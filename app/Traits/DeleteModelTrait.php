<?php
namespace App\Traits;
use Illuminate\Support\Facades\Log;
use Exception;

trait DeleteModelTrait {
    public function deleteModelTrait($id, $model){
        try {
            $model->find($id)->delete();
            return response()->json([
                'code' => 200,
                'message' => 'Delete success'
            ], 200);
        }
        catch( Exception $exception ){
            log::error('Fault: '.$exception->getMessage().'Line: '.$exception->getLine());
            return response()->json([
                'code' => 500,
                'message' => 'Delete fail'
            ], 500);
        }
    }
}