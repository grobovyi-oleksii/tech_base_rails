$(document).ready(function () {
    $('a.edit_train').click(function (e) {
        e.preventDefault()
        let train_id;
        let form;
        let number;
        train_id = $(this).data('trainId');
        form = $('#edit_train_' + train_id);
        number = $('#train_number' + train_id)
        form.show();
        number.hide();

        if (!$(this).hasClass('cancel')) {
            $(this).html('Cancel');
            $(this).addClass('cancel');
            form.show();
            number.hide();
        } else {
            $(this).html('Edit');
            $(this).removeClass('cancel');
            form.hide();
            number.show();
        }



    });
});