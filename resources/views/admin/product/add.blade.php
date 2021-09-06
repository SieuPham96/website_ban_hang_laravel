<!-- resources/views/child.blade.php -->

@extends('layouts.admin')

@section('title')
    <title>Add Product</title>
@endsection

@section('css')
<link href="{{ asset('vendor/select2/select2.min.css') }}" rel="stylesheet" />
<link href="{{ asset('admins/product/add/add.css') }}" rel="stylesheet" />
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('common.content-header', ['name' => 'Product', 'key' => 'Add'])

    <!-- Main content -->
    <form action="{{ route('product.store') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Tên sản phẩm</label>
                            <input type="text" 
                                    class="form-control @error('name') is-invalid @enderror" 
                                    name="name" 
                                    placeholder="Nhập tên sản phẩm"
                                    value="{{ old('name') }}"
                            >
                            @error('name')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label>Giá</label>
                            <input type="text" 
                                    class="form-control @error('price') is-invalid @enderror" 
                                    name="price" 
                                    placeholder="Nhập giá sản phẩm"
                                    value="{{ old('price') }}"
                            >
                            @error('price')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label>Ảnh đại diện sản phẩm</label>
                            <input type="file" 
                                    class="form-control-file" 
                                    name="feature_image_path"
                            >
                        </div>

                        <div class="form-group">
                            <label>Ảnh chi tiết sản phẩm</label>
                            <input type="file" 
                                    multiple 
                                    class="form-control-file preview_image_detail mb-2" 
                                    name="image_path[]"
                            >
                            <div class="row image_detail_wrapper">

                            </div>
                        </div>

                        <div class="form-group">
                            <label>Chọn danh mục</label>
                            <select class="form-control select2_init @error('category_id') is-invalid @enderror" 
                                    name="category_id">
                                <option value="{{ old('category_id') }}">Chọn danh mục</option>
                                {!! $htmlOption !!}
                            </select>
                            @error('category_id')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label>Nhập tags cho sản phẩm</label>
                            <select class="form-control tags_select_choose" 
                                    multiple="multiple"
                                    name="tags[]"
                            >
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Nội dung</label>
                            <textarea class="form-control tinymce_editor_init @error('contents') is-invalid @enderror"
                                        rows="20" 
                                        name="contents">{{ old('contents') }}</textarea>
                            @error('contents')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
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
