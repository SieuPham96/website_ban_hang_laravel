<?php
namespace App\Components;
use App\Models\Menu;

class MenuRecursive {
    private $html;

    public function __construct()
    {
        $this->html = '';
    }

    public function menuRecursiveAdd( $parentsId = 0, $subMark = '')
    {
        $data = Menu::where('parents_id', $parentsId)->get();
        foreach( $data as $dataItem ){
            $this->html .= '<option value=" '.$dataItem->id.' ">'.$subMark.$dataItem->name.'</option>';
            $this->menuRecursiveAdd($dataItem->id, $subMark.'--');
        }
        return $this->html;
    }

    public function menuRecursiveEdit($parentsIdMenuEdit, $parentsId = 0, $subMark = '')
    {
        $data = Menu::where('parents_id', $parentsId)->get();
        foreach( $data as $dataItem ){
            if( $parentsIdMenuEdit == $dataItem->id ){
                $this->html .= '<option selected value=" '.$dataItem->id.' ">'.$subMark.$dataItem->name.'</option>';
            }
            else{
                $this->html .= '<option  value=" '.$dataItem->id.' ">'.$subMark.$dataItem->name.'</option>';
            }
            $this->menuRecursiveEdit($parentsIdMenuEdit, $dataItem->id, $subMark.'--');
        }
        return $this->html;
    }
}