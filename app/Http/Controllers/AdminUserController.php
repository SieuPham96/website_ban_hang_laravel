<?php

namespace App\Http\Controllers;

use App\Models\AppConst;
use App\Models\Role;
use App\Models\User;
use App\Traits\DeleteModelTrait;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Requests\UserRequest;

class AdminUserController extends Controller
{
    use DeleteModelTrait;

    private $user;
    private $role;

    public function __construct(User $user, Role $role)
    {
        $this->user = $user;
        $this->role = $role;
    }

    public function index()
    {
        $users = $this->user->paginate(AppConst::DEFAULT_PER_PAGE);
        return view('admin.user.index', compact('users'));
    }

    public function create()
    {
        $roles = $this->role->all();
        return view('admin.user.add', compact('roles'));
    }

    public function store(UserRequest $request)
    {
        try{
            DB::beginTransaction();
            // insert data to users table
            $user = $this->user->create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);

            // insert role_id to role_user
            $user->roles()->attach($request->role_id);
            DB::commit();
            return redirect()->route('users.index');
        }
        catch( Exception $exception) {
            DB::rollBack();
            Log::error('Message: '.$exception->getMessage().' Line: '.$exception->getLine());
        }
    }

    public function edit($id)
    {
        $roles = $this->role->all();
        $user = $this->user->find($id);
        $rolesUser = $user->roles;

        return view('admin.user.edit', compact('roles', 'user', 'rolesUser'));
    }

    public function update(Request $request, $id)
    {
        try{
            DB::beginTransaction();
            $this->user->find($id)->update([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);

            $userUpdate = $this->user->find($id);
            $userUpdate->roles()->sync($request->role_id);
            DB::commit();
            return redirect()->route('users.index');
        }
        catch( Exception $exception) {
            DB::rollBack();
            Log::error('Message: '.$exception->getMessage().' Line: '.$exception->getLine());
        }
    }

    public function delete($id)
    {
        return $this->deleteModelTrait($id, $this->user);
    }

}
