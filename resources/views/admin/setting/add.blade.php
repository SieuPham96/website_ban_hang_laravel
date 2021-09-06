<!-- resources/views/child.blade.php -->

@extends('layouts.admin')

@section('title')
<title>Add Setting</title>
@endsection

@section('css')
<link rel="stylesheet" href="{{ asset('admins/setting/add/add.css') }}">
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('common.content-header', ['name' => 'Setting', 'key' => 'Add'])

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <form action="{{ route('setting.store').'?type='.request()->type }}" method="post">
                        @csrf
                        <div class="form-group">
                            <label>Congfig key</label>
                            <input type="text" 
                                    class="form-control @error('config_key') is-invalid @enderror" 
                                    name="config_key" 
                                    placeholder="Nhập config key"
                            >
                            @error('config_key')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>

                        @if( request()->type === "Text" )
                        <div class="form-group">
                            <label>Congfig value</label>
                            <input type="text"
                                    class="form-control @error('config_value') is-invalid @enderror" 
                                    name="config_value" 
                                    placeholder="Nhập config value"
                            >
                            @error('config_value')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        @elseif( request()->type === "Textarea" )
                        <div class="form-group">
                            <label>Congfig value</label>
                            <textarea name="config_value" 
                                        rows="5" 
                                        class="form-control @error('config_value') is-invalid @enderror" 
                                        placeholder="Nhập config value"></textarea>
                            @error('config_value')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        @endif
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
