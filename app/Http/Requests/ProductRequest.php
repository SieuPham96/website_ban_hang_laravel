<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
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
            'name' => 'bail|required|max:255|min:3',
            'price' => 'required',
            'contents' => 'required',
            'category_id' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Tên sản phẩm không được để trống',
            'name.max' => 'Tên sản phẩm không được phép quá 255 ký tự',
            'name.min' => 'Tên sản phẩm không được phép dưới 3 ký tự',
            'price.required' => 'Giá không được để trống',
            'category_id.required' => 'Danh mục không được để trống',
            'contents.required' => 'Nội dung không được để trống',
        ];
    }
}
