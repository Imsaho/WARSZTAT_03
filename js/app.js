

$(document).ready(function () {

    var form = $(document).find('form');
    //console.log(form);
    var updateForm = $(form).clone();
    //console.log(updateForm);
    $(updateForm).find('button').text('Update book');
    $(updateForm).find('button').attr('id', 'btn2');
    $(updateForm).attr('class', 'update_form');
    $(updateForm).find('input[name=author]').attr('name', 'update_author');
    $(updateForm).find('input[name=title]').attr('name', 'update_title');
    $(updateForm).find('textarea[name=book_desc]').attr('name', 'update_book_desc');
    $(updateForm).find('input[name=genre]').attr('name', 'update_genre');
    //$(updateForm).find();
    console.log(updateForm);

// funkcja, która wczytuje listę wszystkich książek z bazy danych
    function loadAllBooks() {
        //var updateForm = "";
        $.get('http://localhost/WARSZTAT_03/api/books.php', function (json) {
            var books = $.parseJSON(json);
            for (var i = 0; i < books.length; i++) {
                var book = $('<table><tr data-book-id="' + books[i].id + '"><td>'
                        + books[i].author
                        + '</td><td class="book_title">'
                        + books[i].name
                        + '</td><td>' + books[i].genre
                        + '<td class="remove_book">remove</td>'
                        + '</td></tr></table>'
                        + '<div class="details"><div class="book_desc">asdasd</div>'
                        + '<div class="update_book">asdasd</div></div>');
                $('#books').append($(book));
            }
        });
    }

//wywołanie funkcji - wyświetla listę książek na stronie
    loadAllBooks();

//po kliknięciu na tytuł rozwija pole z opisem książki
    $(document).on('click', ".book_title", function () {
        $(this).parent().parent().parent().next().slideToggle();
        var descriptionDiv = $(this).parent().parent().parent().next().find('.book_desc');
        var updateBookDiv = $(this).parent().parent().parent().next().find('.update_book');
        //console.log(descriptionDiv);
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
                        $('#books').html("<table><tr><th>Autor</th><th>Tytuł</th><th>Opis</th><th></th></tr></table>");
                        loadAllBooks();
                        $('form').trigger("reset");
                    }
                });
        event.preventDefault();
    });

    $(document).on('click', '#btn2', function (event) {
        var bookId = $(this).parent().parent().parent().prev().find('tr').data("book-id");
        console.log(bookId);

        var formData = {
            'id': bookId,
            'author': $('input[name=update_author]').val(),
            'title': $('input[name=update_title]').val(),
            'book_desc': $('textarea[name=update_book_desc]').val(),
            'genre': $('input[name=update_genre]').val()
        };

        console.log(formData);
        $.ajax({
            type: 'PUT',
            url: "http://localhost/WARSZTAT_03/api/books.php",
            data: formData,
            dataType: 'json'
        })
                .done(function (json) {
                    //console.log(json);
                    $('#books').html("<table><tr><th>Autor</th><th>Tytuł</th><th>Opis</th><th></th></tr></table>");
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
            dataType: '',
        })
                .done(function () {
                    $('#books').html("<table><tr><th>Autor</th><th>Tytuł</th><th>Gatunek</th><th></th></tr></table>");
                    loadAllBooks();
                });
    });

});

