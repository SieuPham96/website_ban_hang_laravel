<!-- resources/views/child.blade.php -->

@extends('layouts.admin')

@section('title')
<title>Edit Role</title>
@endsection

@section('css')
<link href="{{ asset('admins/role/add/add.css') }}" rel="stylesheet" />
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('common.content-header', ['name' => 'Role', 'key' => 'Edit'])

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <form action="{{ route('roles.update', ['id' => $role->id]) }}" method="post" enctype="multipart/form-data" style="width: 100%">
                    @csrf
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Tên vai trò</label>
                            <input type="text" 
                                    class="form-control" 
                                    name="name"
                                    placeholder="Nhập tên vai trò"
                                    value="{{ $role->name }}"
                            >
                        </div>

                        <div class="form-group">
                            <label>Mô tả vai trò</label>
                            <textarea name="display_name"
                                    rows="5"
                                    placeholder="Nhập mô tả"
                                    class="form-control">{{ $role->display_name }}</textarea>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <label>
                                    <input type="checkbox" class="checkAll">
                                    checkAll
                                </label>
                            </div>
                            
                            @foreach($permissionParent as $permissionParentItem)
                                <div class="card border-light mb-3 col-md-12">
                                    <div class="card-header">
                                        <label>
                                            <input type="checkbox" 
                                                    value="{{ $permissionParentItem->id }}"
                                                    class="checkbox_wrapper"
                                            >
                                        </label>
                                        Module {{ $permissionParentItem->name }}
                                    </div>

                                    <div class="row">
                                        @foreach( $permissionParentItem->permissionsChildren as $permissionChildrenItem )
                                            <div class="card-body col-md-3">
                                                <h5 class="card-title">
                                                    <label>
                                                        <input type="checkbox" 
                                                                {{ $permissionsChecked->contains('id', $permissionChildrenItem->id) ? 'checked' : '' }}
                                                                value="{{ $permissionChildrenItem->id }}"
                                                                name="permission_id[]"
                                                                class="checkbox_children"
                                                        >
                                                    </label>
                                                {{ $permissionChildrenItem->name }}
                                                </h5>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@section('js')
<script src="{{ asset('admins/role/add/add.js') }}"></script>
@endsection
