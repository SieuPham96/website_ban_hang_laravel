<!-- resources/views/child.blade.php -->

@extends('layouts.admin')

@section('title')
<title>Products</title>
@endsection

@section('css')
<link rel="stylesheet" href="{{ asset('admins/product/index/list.css') }}">
@endsection

@section('header')
@include('common.product-header')
@endsection

@section('content')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('common.content-header', ['name' => 'Product', 'key' => 'List'])

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    @can('product-add')
                        <a href="{{ route('product.create') }}" class="btn btn-success float-right m-2">Add</a>
                    @endcan
                </div>
                <div class="col-md-12">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col">Danh mục</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach( $products as $productItem )
                                <tr>
                                    <th scope="row">{{ $productItem->id }}</th>
                                    <td>{{ $productItem->name }}</td>
                                    <td>{{ number_format($productItem->price) }}</td>
                                    <td>
                                        <img class="product_image" src="{{ $productItem->feature_image_path }}" alt="">
                                    </td>
                                    <td>
                                        {{ optional($productItem->category)->name }}
                                    </td>
                                    <td>
                                        @can('product-edit', $productItem->id)
                                            <a href="{{ route('product.edit', ['id' => $productItem->id]) }}" 
                                                class="btn btn-default"
                                            >
                                                Edit
                                            </a>
                                        @endcan

                                        @can('product-delete', $productItem->id)
                                            <a href="" 
                                                data-url="{{ route('product.delete', ['id' => $productItem->id]) }}"
                                                class="btn btn-danger action_delete"
                                            >
                                                Delete
                                            </a>
                                        @endcan
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="col-md-12">
                    {{ $products->links('pagination::bootstrap-4') }}
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@section('js')
    <script src="{{ asset('vendor/sweetAlert2/sweetalert2@11.js') }}"></script>
    <script src="{{ asset('admins/main.js') }}"></script>
@endsection
