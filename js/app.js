
$(document).ready(function () {

    var form = $(document).find('form');
    var updateForm = $(form).clone();
    $(updateForm).find('button').text('Aktualizuj informacje');
    $(updateForm).find('button').attr('id', 'btn2');
    $(updateForm).attr('class', 'update_form');
    $(updateForm).find('input[name=author]').attr('name', 'update_author');
    $(updateForm).find('input[name=title]').attr('name', 'update_title');
    $(updateForm).find('textarea[name=book_desc]').attr('name', 'update_book_desc');
    $(updateForm).find('input[name=genre]').attr('name', 'update_genre');

    var tableHeading = $('.table_heading').clone();

// funkcja, która wczytuje listę wszystkich książek z bazy danych
    function loadAllBooks() {
        $.get('http://localhost/WARSZTAT_03/api/books.php', function (json) {
            var books = $.parseJSON(json);
            for (var i = 0; i < books.length; i++) {
                var book = $('<table><tr data-book-id="' + books[i].id + '"><td>'
                        + books[i].author
                        + '</td><td class="book_title">'
                        + books[i].name
                        + '</td><td>' + books[i].genre
                        + '<td class="remove_book">usuń</td>'
                        + '</td></tr></table>'
                        + '<div class="details"><div class="book_desc"></div>'
                        + '<div class="update_book"></div></div>');
                $('#books').append($(book));
            }
        });
    }

//wywołanie funkcji - wyświetla listę książek na stronie
    loadAllBooks();

//po kliknięciu na tytuł rozwija pole z opisem książki
    $(document).on('click', ".book_title", function () {
        $(this).parent().parent().parent().parent().find('.details').slideUp(500);
        $(this).parent().parent().parent().next().slideToggle(500);

        var descriptionDiv = $(this).parent().parent().parent().next().find('.book_desc');
        var updateBookDiv = $(this).parent().parent().parent().next().find('.update_book');
        var bookId = $(this).parent().data("book-id");
        var endpoint = "http://localhost/WARSZTAT_03/api/books.php?id=" + bookId;

        $.get(endpoint, function (json) {
            var book = $.parseJSON(json);
            var bookDescription = book.book_desc;
            $(descriptionDiv).text(bookDescription);
            $(updateBookDiv).html(updateForm);
        });
    });

// tworzenie nowej książki za pomocą formularza
    $('form.add_form').submit(function (event) {
        var formData = {
            'author': $('input[name=author]').val(),
            'title': $('input[name=title]').val(),
            'book_desc': $('textarea[name=book_desc]').val(),
            'genre': $('input[name=genre]').val()
        };
        $.ajax({
            type: 'POST',
            url: "http://localhost/WARSZTAT_03/api/books.php",
            data: formData,
            dataType: 'json',
            encode: true
        })
                .done(function (data) {
                    if (data.success === true) {
                        $('#books').html(tableHeading);
                        loadAllBooks();
                        $('form').trigger("reset");
                    }
                });
        event.preventDefault();
    });

// aktualizacja informacji o danej 
    $(document).on('click', '#btn2', function (event) {
        var bookId = $(this).parent().parent().parent().prev().find('tr').data("book-id");

        var formData = {
            'id': bookId,
            'author': $('input[name=update_author]').val(),
            'title': $('input[name=update_title]').val(),
            'book_desc': $('textarea[name=update_book_desc]').val(),
            'genre': $('input[name=update_genre]').val()
        };

        $.ajax({
            type: 'PUT',
            url: "http://localhost/WARSZTAT_03/api/books.php",
            data: formData,
            dataType: 'json'
        })
                .done(function (json) {
                    $('#books').html(tableHeading);
                    loadAllBooks();
                    $('#btn2').trigger("reset");
                });
        event.preventDefault();

    });

//po kliknięciu na "remove" zostaje usunięta ksiazka o wskazanym id
    $(document).on('click', '.remove_book', function () {
        var bookId = $(this).parent().data("book-id");
        $.ajax({
            type: 'DELETE',
            url: "http://localhost/WARSZTAT_03/api/books.php",
            data: {id: bookId},
            dataType: ''
        })
                .done(function () {
                    $('#books').html(tableHeading);
                    loadAllBooks();
                });
    });

});

