<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Components\Recursive;
use App\Http\Requests\ProductRequest;
use App\Models\AppConst;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\ProductTag;
use App\Models\Tag;
use App\Traits\DeleteModelTrait;
use App\Traits\StorageImageTrait;
use Exception;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class AdminProductController extends Controller
{
    use StorageImageTrait, DeleteModelTrait;

    private  $category;
    private  $product;
    private  $productImage;
    private  $productTag;
    private  $tag;

    public function __construct(Category $category, Product $product, ProductImage $productImage,
                                ProductTag $productTag, Tag $tag)
    {
        $this->category = $category;
        $this->product = $product;
        $this->productImage = $productImage;
        $this->productTag = $productTag;
        $this->tag = $tag;
    }

    public function index()
    {
        $products = $this->product->latest()->paginate(AppConst::DEFAULT_PER_PAGE);
        return view('admin.product.index', compact('products'));
    }

    public function search(Request $request)
    {
        $products = $this->product->getProductSearch($request);
        return view('admin.product.index', compact('products'));
    }

    public function create()
    {
        $htmlOption = $this->getCategory($parentsId = '');
        return view('admin.product.add', compact('htmlOption'));
    }

    public function getCategory($parentsId)
    {
        $data = $this->category::all();
        $recursive = new Recursive($data);
        $htmlOption = $recursive->categoryRecursive($parentsId);
        return $htmlOption ;
    }

    public function store(ProductRequest $request)
    {
        try {
            DB::beginTransaction();
            
            // insert data to products table
            $dataProductCreate = [
                'name' => $request->name,
                'price' => $request->price,
                'content' => $request->contents,
                'user_id' => auth()->id(),
                'category_id' => $request->category_id,
            ];
            $dataUploadFeatureImage = $this->storageTraitUpload($request, 'feature_image_path', 'product');
            if( !empty($dataUploadFeatureImage) ){
                $dataProductCreate['feature_image_name'] = $dataUploadFeatureImage['file_name'];
                $dataProductCreate['feature_image_path'] = $dataUploadFeatureImage['file_path'];
            }
            $product = $this->product->create($dataProductCreate);
            
            // insert data to product_images table
            if( $request->hasFile('image_path') ){
                foreach( $request->image_path as $fileItem ){
                    $dataProductImage = $this->storageTraitUploadMultiple($fileItem, 'product');
                    $product->images()->create([
                        'image_path' => $dataProductImage['file_path'],
                        'image_name' => $dataProductImage['file_name'],
                    ]);
                }
            }
    
            // insert tags for product
            if( !empty($request->tags) ){
                foreach( $request->tags as $tagItem ){
                    // insert to tags table
                    $tagInstance = $this->tag->firstOrCreate( ['name' => $tagItem] );
                    $tagIds[] = $tagInstance->id;
                }
                $product->tags()->attach($tagIds);
            }
            DB::commit();
            return redirect()->route('product.index');
        }

        catch( Exception $exception ){
            DB::rollBack();
            Log::error('Message: '.$exception->getMessage().'Line: '.$exception->getLine());
        }
    }

    public function edit($id)
    {
        $product = $this->product->find($id);
        $htmlOption = $this->getCategory($product->category_id);
        return view('admin.product.edit', compact('htmlOption', 'product'));
    }

    public function update(Request $request, $id)
    {
        try {
            DB::beginTransaction();
            
            // insert data to products table
            $dataProductUpdate = [
                'name' => $request->name,
                'price' => $request->price,
                'content' => $request->contents,
                'user_id' => auth()->id(),
                'category_id' => $request->category_id,
            ];
            $dataUploadFeatureImage = $this->storageTraitUpload($request, 'feature_image_path', 'product');
            if( !empty($dataUploadFeatureImage) ){
                $dataProductUpdate['feature_image_name'] = $dataUploadFeatureImage['file_name'];
                $dataProductUpdate['feature_image_path'] = $dataUploadFeatureImage['file_path'];
            }
            $this->product->find($id)->update($dataProductUpdate);
            $product = $this->product->find($id);
            
            // insert data to product_images table
            if( $request->hasFile('image_path') ){
                $this->productImage->where('product_id', $id)->delete();
                foreach( $request->image_path as $fileItem ){
                    $dataProductImage = $this->storageTraitUploadMultiple($fileItem, 'product');
                    $product->images()->create([
                        'image_path' => $dataProductImage['file_path'],
                        'image_name' => $dataProductImage['file_name'],
                    ]);
                }
            }
    
            // insert tags for product
            if( !empty($request->tags) ){
                foreach( $request->tags as $tagItem ){
                    // insert to tags table
                    $tagInstance = $this->tag->firstOrCreate( ['name' => $tagItem] );
                    $tagIds[] = $tagInstance->id;
                }
                $product->tags()->sync($tagIds);
            }
            DB::commit();
            return redirect()->route('product.index');
        }

        catch( Exception $exception ){
            DB::rollBack();
            Log::error('Message: '.$exception->getMessage().'Line: '.$exception->getLine());
        }
    }

    public function delete($id)
    {
        return $this->deleteModelTrait($id, $this->product);
    }

}
