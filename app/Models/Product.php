<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\App;

class Product extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $guarded = [];

    public function images()
    {
        return $this->hasMany('App\Models\ProductImage', 'product_id');
    }

    public function tags()
    {
        return $this->belongsToMany('App\Models\Tag', 'product_tags', 'product_id', 'tag_id')
                    ->withTimestamps();
    }

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id');
    }

    public function getProductSearch($request)
    {
        $products = new Product();
        if (!empty($request->product_id)) {
            $products = $products->where('products.id', $request->product_id);
        }
        if (!empty($request->name)) {
            $products = $products->where('products.name', 'like', '%'.$request->name.'%');
        }
        if (!empty($request->category_id)) {
            $products = $products->where('products.category_id', $request->category_id);
        }
        if (!empty($request->tags)) {
            $products = $products->join('product_tags', 'products.id', 'product_tags.product_id')
                                ->join('tags', 'product_tags.tag_id', 'tags.id')
                                ->where('tags.name', 'like', '%'.$request->tags.'%');
        }
        $products = $products->select('products.*')
                            ->latest('products.created_at')
                            ->paginate(AppConst::DEFAULT_PER_PAGE);
        return $products;
    }
}
