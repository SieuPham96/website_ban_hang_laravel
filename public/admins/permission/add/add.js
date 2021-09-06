$( function(){
    $('.checkAll').on('click', function(){
        $(this).parents().find('.checkbox_children').prop('checked', $(this).prop('checked'));
    })
})