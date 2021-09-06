<?php

namespace App\Http\Controllers;

use App\Components\MenuRecursive;
use Illuminate\Http\Request;
use App\Models\Menu;
use Illuminate\Support\Str;
use App\Http\Requests\MenuRequest;
use App\Traits\DeleteModelTrait;

class MenuController extends Controller
{
    use DeleteModelTrait;

    private $menuRecursive;
    private $menu;

    public function __construct(MenuRecursive $menuRecursive, Menu $menu)
    {
        $this->menuRecursive = $menuRecursive;
        $this->menu = $menu;
    }

    public function index()
    {
        $menus = $this->menu->paginate(10);
        return view('admin.menus.index', compact('menus'));
    }

    public function create()
    {
        $optionSelect = $this->menuRecursive->menuRecursiveAdd();
        return view('admin.menus.add', compact('optionSelect'));
    }

    public function store(MenuRequest $request)
    {
        $this->menu->create([
            'name' => $request->name,
            'parents_id' => $request->parents_id,
            'slug' => Str::slug($request->name)
        ]);
        return redirect()->route('menus.index');
    }

    public function edit($id, Request $request)
    {
        $menuFollowIdEdit = $this->menu->find($id);
        $optionSelect = $this->menuRecursive->menuRecursiveEdit($menuFollowIdEdit->parents_id);
        return view('admin.menus.edit', compact('optionSelect', 'menuFollowIdEdit'));
    }

    public function update($id, Request $request)
    {
        $this->menu->find($id)->update([
            'name' => $request->name,
            'parents_id' => $request->parents_id,
            'slug' => Str::slug($request->name)
        ]);
        return redirect()->route('menus.index');
    }

    public function delete($id)
    {
        // $this->menu->find($id)->delete();
        // return redirect()->route('menus.index');
        return $this->deleteModelTrait($id, $this->menu);
    }
}
