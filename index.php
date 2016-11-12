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
        
        <div>
        <form class="add_form" action="./api/books.php" method="POST">
            <label>author:
                <input type="text" name="author"/></input>
            </label>
            <label>title:
                <input type="text" name="title"/></input>
            </label>
            <label>description:
                <textarea maxlength="1000" name="book_desc"/></textarea>
            </label>
            <label>genre:
                <input type="text" name="genre"></input>
            </label>
            <button name="submit">Add book</button>
        </form>
        </div>
       
        <hr>
        
        <div id="books">
        <table border="1" cellspacing="4" cellpadding="4">
            <tr>
                <th>Autor</th>
                <th>Tytuł</th>
                <th>Gatunek</th>
                <th></th>
            </tr>
        </table>
        </div>

    </body>
</html>