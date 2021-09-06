<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RoleRequest extends FormRequest
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
            'name' => 'bail|required|unique:roles|max:255|min:6',
            'display_name' => 'bail|required|max:500|min:6',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Tên vai trò không được để trống',
            'name.unique' => 'Tên vai trò không được trùng',
            'name.max' => 'Tên vai trò không được phép quá 255 ký tự',
            'name.min' => 'Tên vai trò không được phép dưới 6 ký tự',

            'display_name.required' => 'Mô tả không được để trống',
            'display_name.max' => 'Mô tả không được phép quá 500 ký tự',
            'display_name.min' => 'Mô tả không được phép dưới 6 ký tự',
        ];
    }
}
