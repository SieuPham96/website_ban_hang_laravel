function renderHtmlImage(srcImage) {
    return `<div class="card col-md-3 mr-2">
            <img class="card-img-top image_detail_product" src="${srcImage}" alt="">
            </div>`;
}

function loadPreviewMultipleImage() {
    let files = $(this).get(0).files;
    let fileLength = files.length;
    $('.image_detail_wrapper').html('');
    for (let i = 0; i < fileLength; i++) {
        let fileItem = files[i];
        const reader = new FileReader();
        reader.onload = function (element) {
            let data = renderHtmlImage(element.target.result);
            $('.image_detail_wrapper').append(data);
        };
        reader.readAsDataURL(fileItem);
    }
}
$(document).on('change', '.preview_image_detail', loadPreviewMultipleImage);