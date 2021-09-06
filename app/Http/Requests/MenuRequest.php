<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MenuRequest extends FormRequest
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
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Tên menu không được để trống',
            'name.unique' => 'Tên menu không được trùng',
            'name.max' => 'Tên menu không được phép quá 255 ký tự',
            'name.min' => 'Tên menu không được phép dưới 6 ký tự',
        ];
    }
}
