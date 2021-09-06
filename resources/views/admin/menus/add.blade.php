<!-- resources/views/child.blade.php -->

@extends('layouts.admin')

@section('title')
<title>Add Menu</title>
@endsection

@section('css')
<link href="{{ asset('admins/slider/add/add.css') }}" rel="stylesheet" />
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('common.content-header', ['name' => 'Menu', 'key' => 'Add'])

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <form action="{{ route('menus.store') }}" method="post">
                        @csrf
                        <div class="form-group">
                            <label>Tên Menu</label>
                            <input type="text" 
                                    class="form-control @error('name') is-invalid @enderror" 
                                    name="name"
                                    placeholder="Nhập tên menu"
                            >
                            @error('name')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        
                        <div class="form-group">
                            <label>Chọn menu</label>
                            <select class="form-control" name="parents_id">
                              <option value="0">Chọn menu</option>
                              {!! $optionSelect !!}
                            </select>
                          </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
