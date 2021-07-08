$(document).ready(function () {
    $('.seats').hide()


    $('#carriage_type').change(function () {
        switch ($(this).val()) {
            case 'CoupeCarriage':
                $('.seats').hide()
                $('.top_seats').show();
                $('.bottom_seats').show();
                break;
            case 'CvCarriage':
                $('.seats').hide()
                $('.bottom_seats').show();
                break;
            case 'EcoCarriage':
                $('.seats').hide()
                $('.top_seats').show();
                $('.bottom_seats').show();
                $('.side_top_seats').show();
                $('.side_bottom_seats').show();
                break;
            case 'SeatCarriage':
                $('.seats').hide()
                $('.eco_seats').show()
                break;
        }
    });
});