<!-- resources/views/child.blade.php -->

@extends('layouts.admin')

@section('title')
<title>Edit Slider</title>
@endsection

@section('css')
<link href="{{ asset('admins/slider/add/add.css') }}" rel="stylesheet" />
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('common.content-header', ['name' => 'Slider', 'key' => 'Edit'])

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <form action="{{ route('slider.update', ['id' => $slider->id]) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label>Tên Slider</label>
                            <input type="text"
                                    class="form-control @error('name') is-invalid @enderror" 
                                    name="name"
                                    placeholder="Nhập tên slider"
                                    value="{{ $slider->name }}"
                            >
                            @error('name')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label>Mô tả</label>
                            <textarea name="description"
                                    rows="5"
                                    placeholder="Nhập mô tả"
                                    class="form-control @error('description') is-invalid @enderror">{{ $slider->description }}</textarea>
                            @error('description')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label>Hình ảnh</label>
                            <input type="file" 
                                    class="form-control @error('image_path') is-invalid @enderror" 
                                    name="image_path"
                            >
                            <div class="col-md-4">
                                <div class="row">
                                    <img class="sliderImg_edit" src="{{ $slider->image_path }}" alt="">
                                </div>
                            </div>
                            @error('image_path')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
