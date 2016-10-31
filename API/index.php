<?php

?>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="js/app.js"></script>

        <title></title>
    </head>
    <body>
        <h1>Książki</h1>
        <div id="json"></div>
        
        <form>
            <label>Imię i nazwisko autora:
                <input type="text" name="author"/></input>
            </label>
            <label>Tytuł:
                <input type="text" name="name"/></input>
            </label>
            <label>Opis:
                <input type="text" name="book_desc"/></input>
            </label>
        </form>
        
        <hr>
        
        <a id="refresh">link</a>
        
        <table id="books" border="1" cellspacing="4" cellpadding="4">
            <tr>
                <th>Autor</th>
                <th>Tytuł</th>
                <th>Opis</th>
            </tr>
        </table>

    </body>
</html>