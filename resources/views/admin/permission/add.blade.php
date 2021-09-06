<!-- resources/views/child.blade.php -->

@extends('layouts.admin')

@section('title')
<title>Add Permission</title>
@endsection

@section('css')
<link rel="stylesheet" href="{{ asset('admins/permission/add/add.css') }}">
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('common.content-header', ['name' => 'Permission', 'key' => 'Add'])

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <form action="{{ route('permissions.store') }}" method="post">
                        @csrf
                        <div class="form-group">
                            <label>Chọn module</label>
                            <select class="form-control" name="module_parent">
                                <option value="">Chọn module</option>
                                @foreach( config('permissions.table_module') as $moduleItem)
                                    <option value="{{ $moduleItem }}">{{ $moduleItem }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label>
                                        <input type="checkbox" class="checkAll">
                                        checkAll
                                    </label>
                                </div>
                                @foreach( config('permissions.module_children') as $moduleChildrenItem)
                                    <div class="col-md-3">
                                        <label for="">
                                            <input type="checkbox" 
                                                    value="{{ $moduleChildrenItem }}" 
                                                    name="module_children[]"
                                                    class="checkbox_children"
                                            >
                                            {{ $moduleChildrenItem }}
                                        </label>
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
</div>
@endsection

@section('js')
<script src="{{ asset('admins/permission/add/add.js') }}"></script>
@endsection

