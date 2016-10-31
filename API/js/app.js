

$(document).ready(function() {


    var author = "Jacek Dukaj";
    var name = "Lód";
    var book_desc = "opis";
    
    $('a#refresh').click(function() {
            $.get('http://localhost/WARSZTAT_03/API/books.php', function(json) {
             var books = $.parseJSON(json);
            console.log(books);
        
              for (var i=0; i<books.length; i++) {
              var book = $('<tr><td>' + books[i].author + '</td><td>' + books[i].name + '</td><td>' + books[i].book_desc + '</td></tr> ');
               $('#books').append(book);
          }
      });
    });
    

    
    var book = $('<tr><td>' + author + '</td><td>name</td><td>book_desc</td></tr> ');
    $('#books').append(book);
    


//        $.ajax({
//            url: 'http://date.jsontest.com/',
//            data: {},
//            type: 'GET',
//            dataType: 'json',
//            success: function(json) {
//                console.log('sukces!', json);
//            },
//            error: function(xhr, status, error) {
//                console.log('błąd', error);
//            },
//            complete: function(xhr, status) {
//                console.log('wykonano zapytanie', xhr);
//            }
//        });




//var time = $('<p>Time: ' + json.time + '</p>');
//var timestamp = $('<p>Timestamp: ' + json.milliseconds_since_epoch + '</p>');
//var date = $('<p>Date: ' + json.date + '</p>');
//
////console.log(json);
//
// $('div#json').prepend(time);
// $('div#json').prepend(timestamp);
// $('div#json').prepend(date);
// });

});
