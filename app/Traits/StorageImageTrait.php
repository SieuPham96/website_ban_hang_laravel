<?php

namespace App\Traits;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

trait StorageImageTrait
{
    public function storageTraitUpload($request, $fieldName, $folderName)
    {
        if ($request->hasFile($fieldName)) {
            $file = $request->$fieldName;
            $fileOriginalName = $file->getClientOriginalName();
            $fileNameHash = Str::random(20) . '.' . $file->getClientOriginalExtension();
            $filePath = $request->file($fieldName)->storeAs('public/' . $folderName . '/' . auth()->id(), $fileNameHash);
            $dataTraitUpload = [
                'file_name' => $fileOriginalName,
                'file_path' => Storage::url($filePath)
            ];
            return $dataTraitUpload;
        }
        return null;
    }

    public function storageTraitUploadMultiple($file, $folderName)
    {
        $fileOriginalName = $file->getClientOriginalName();
        $fileNameHash = Str::random(20) . '.' . $file->getClientOriginalExtension();
        $filePath = $file->storeAs('public/' . $folderName . '/' . auth()->id(), $fileNameHash);
        $dataTraitUpload = [
            'file_name' => $fileOriginalName,
            'file_path' => Storage::url($filePath)
        ];
        return $dataTraitUpload;
    }
}
