<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Components\Recursive;
use Illuminate\Support\Str;
use App\Models\AppConst;
use App\Http\Requests\CategoryRequest;
use App\Traits\DeleteModelTrait;

class CategoryController extends Controller
{
    use DeleteModelTrait;
    
    private $category;

    public function __construct(Category $category)
    {
        $this->category = $category;
    }
    
    public function index()
    {
        $categories = $this->category->latest()->paginate(AppConst::DEFAULT_PER_PAGE);
        return view('admin.category.index', compact('categories'));
    }

    public function create()
    {
        $htmlOption = $this->getCategory($parentsId = '');
        return view( 'admin.category.add', compact('htmlOption') );
    }

    public function store(CategoryRequest $request)
    {
        $this->category->create([
            'name' => $request->name,
            'parents_id' => $request->parents_id,
            'slug' => Str::slug($request->name)
        ]);
        return redirect()->route('categories.index');
    }

    public function getCategory($parentsId)
    {
        $data = $this->category::all();
        $recursive = new Recursive($data);
        $htmlOption = $recursive->categoryRecursive($parentsId);
        return $htmlOption;
    }

    public function edit($id)
    {
        $category = $this->category->find($id);
        $htmlOption = $this->getCategory($category->parents_id);
        return view('admin.category.edit', compact('category', 'htmlOption'));
    }

    public function update($id, Request $request)
    {
        $this->category->find($id)->update([
            'name' => $request->name,
            'parents_id' => $request->parents_id,
            'slug' => Str::slug($request->name)
        ]);
        return redirect()->route('categories.index');
    }

    public function delete($id)
    {
        // $this->category->find($id)->delete();
        // return redirect()->route('categories.index');

        return $this->deleteModelTrait($id, $this->category);
    }
}
