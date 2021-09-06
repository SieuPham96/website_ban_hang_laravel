<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'bail|required|unique:menus|max:255|min:6',
            'email' => 'bail|email:rfc|required|unique:menus|max:255|min:6',
            'password' => 'bail|required|unique:menus|max:20|min:6',
            'role_id' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Tên user không được để trống',
            'name.unique' => 'Tên user không được trùng',
            'name.max' => 'Tên user không được phép quá 255 ký tự',
            'name.min' => 'Tên user không được phép dưới 6 ký tự',

            'email.required' => 'Email không được để trống',
            'email.unique' => 'Email không được trùng',
            'email.email' => 'Email không hợp lệ',
            'email.max' => 'Email không được phép quá 255 ký tự',
            'email.min' => 'Email không được phép dưới 6 ký tự',

            'password.required' => 'Password không được để trống',
            'password.unique' => 'Bạn đã nhập mật khẩu trùng với mật khẩu cũ',
            'password.max' => 'Password không được phép quá 20 ký tự',
            'password.min' => 'Password không được phép dưới 6 ký tự',

            'role_id.required' => 'Vai trò không được để trống',
        ];
    }
}
