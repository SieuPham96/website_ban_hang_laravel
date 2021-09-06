<!-- resources/views/child.blade.php -->

@extends('layouts.admin')

@section('title')
    <title>Edit Product</title>
@endsection

@section('css')
<link href="{{ asset('vendor/select2/select2.min.css') }}" rel="stylesheet" />
<link href="{{ asset('admins/product/add/add.css') }}" rel="stylesheet" />
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('common.content-header', ['name' => 'Product', 'key' => 'Edit'])

    <!-- Main content -->
    <form action="{{ route('product.update', ['id' => $product->id]) }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Tên sản phẩm</label>
                            <input type="text" 
                                    class="form-control" 
                                    name="name" 
                                    placeholder="Nhập tên sản phẩm"
                                    value="{{ $product->name }}"
                            >
                        </div>

                        <div class="form-group">
                            <label>Giá</label>
                            <input type="text" 
                                    class="form-control" 
                                    name="price" 
                                    placeholder="Nhập giá sản phẩm"
                                    value="{{ $product->price }}"
                            >
                        </div>

                        <div class="form-group">
                            <label>Ảnh đại diện sản phẩm</label>
                            <input type="file" 
                                    class="form-control-file" 
                                    name="feature_image_path"
                            >
                            <div class="col-md-4 feature_image">
                                <img class="feature_image" src="{{ $product->feature_image_path }}" alt="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Ảnh chi tiết sản phẩm</label>
                            <input type="file" 
                                    multiple 
                                    class="form-control-file" 
                                    name="image_path[]"
                            >
                            <div class="col-md-12 container_image_detail">
                                <div class="row">
                                    @foreach($product->images as $productImageItem)
                                    <div class="col-md-3">
                                        <img class="product_image_item" src="{{ $productImageItem->image_path }}" alt="">
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Chọn danh mục</label>
                            <select class="form-control select2_init" name="category_id">
                                <option value="">Chọn danh mục</option>
                                {!! $htmlOption !!}
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Nhập tags cho sản phẩm</label>
                            <select class="form-control tags_select_choose" 
                                    multiple="multiple"
                                    name="tags[]"
                            >
                                @foreach($product->tags as $tagItem)
                                    <option value="{{ $tagItem->name }}" selected>{{ $tagItem->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Nội dung</label>
                            <textarea class="form-control tinymce_editor_init"
                                        rows="20" 
                                        name="contents">{{ $product->content }}</textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
@endsection

@section('js')
<script src="{{ asset('vendor/select2/select2.min.js') }}"></script>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script src="{{ asset('admins/product/add/add.js') }}"></script>
@endsection
