<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    use HasFactory;

    protected $guarded = [];

    // public function products()
    // {
    //     return $this->belongsToMany('App\Models\Product', 'product_tags', 'tag_id');
    // }
}
