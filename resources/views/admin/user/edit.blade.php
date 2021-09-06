<!-- resources/views/child.blade.php -->

@extends('layouts.admin')

@section('title')
<title>Edit User</title>
@endsection

@section('css')
<link href="{{ asset('vendor/select2/select2.min.css') }}" rel="stylesheet" />
<link href="{{ asset('admins/user/add/add.css') }}" rel="stylesheet" />
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('common.content-header', ['name' => 'User', 'key' => 'Edit'])

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <form action="{{ route('users.update', ['id' => $user->id]) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label>Tên User</label>
                            <input type="text" 
                                    class="form-control" 
                                    name="name"
                                    placeholder="Nhập tên user"
                                    value="{{ $user->name }}"
                            >
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" 
                                    class="form-control" 
                                    name="email"
                                    placeholder="Nhập email"
                                    value="{{ $user->email }}"
                            >
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" 
                                    class="form-control" 
                                    name="password"
                                    placeholder="Nhập password"
                            >
                        </div>

                        <div class="form-group">
                            <label>Chọn vai trò</label>
                            <select name="role_id[]" 
                                    class="form-control select2_init" 
                                    multiple
                            >
                                <option value=""></option>
                                @foreach($roles as $role)
                                    <option value="{{ $role->id }}"
                                        {{ $rolesUser->contains('id', $role->id) ? 'selected' : '' }}
                                    >
                                        {{ $role->name }}
                                    </option>
                                @endforeach
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

@section('js')
<script src="{{ asset('vendor/select2/select2.min.js') }}"></script>
<script src="{{ asset('admins/user/add/add.js') }}"></script>
@endsection