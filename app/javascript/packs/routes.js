$(document).ready(function () {
    $('a.edit_route').click(function (e) {
        e.preventDefault()
        let route_id;
        let form;
        let title;
        route_id = $(this).data('routeId');
        form = $('#edit_route_' + route_id);
        title = $('#route_title_' + route_id);


        if (!$(this).hasClass('cancel')) {
            $(this).html('Cancel');
            $(this).addClass('cancel');
            form.show();
            title.hide();
        } else {
            $(this).html('Edit');
            $(this).removeClass('cancel');
            form.hide();
            title.show();
        }
    });

});