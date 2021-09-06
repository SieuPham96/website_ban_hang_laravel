<?php
namespace App\Components;


class PermissionRecursive {

    private $data;
    private $htmlSelect = '';

    public function __construct($data)
    {
        $this->data = $data;
    }
    public function permissionRecursive( $parentsId, $id = 0, $text = '' )
    {
        foreach( $this->data as $value ){
            if( $value['parents_id'] == $id ){
                if( !empty($parentsId) && $parentsId ==  $value['id'] ){
                    $this->htmlSelect.="<option selected value='".$value['id']."'>".$text.$value['name']."</option>";
                }
                else {
                    $this->htmlSelect.="<option value='".$value['id']."'>".$text.$value['name']."</option>";
                }
                $this->permissionRecursive($parentsId, $value['id'], $text.'--');
            }
        }

        return $this->htmlSelect;
    } 
}