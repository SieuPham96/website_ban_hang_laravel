<!-- resources/views/child.blade.php -->

@extends('layouts.admin')

@section('title')
<title>User</title>
@endsection

@section('css')
<link rel="stylesheet" href="">
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @include('common.content-header', ['name' => 'User', 'key' => 'List'])

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    @can('user-add')
                        <a href="{{ route('users.create') }}" class="btn btn-success float-right m-2">Add</a>
                    @endcan
                </div>
                <div class="col-md-12">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Email</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($users as $user)
                                <tr>
                                    <th scope="row">{{ $user->id }}</th>
                                    <td>{{ $user->name }}</td>
                                    <td>{{ $user->email }}</td>
                                    <td>
                                        @can('user-edit')
                                            <a href="{{ route('users.edit', ['id' => $user->id]) }}" class="btn btn-default">Edit</a>
                                        @endcan

                                        @can('user-delete')
                                            <a href="" 
                                                data-url="{{ route('users.delete', ['id' => $user->id]) }}"
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
                    {{ $users->links('pagination::bootstrap-4') }}
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
