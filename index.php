<?php ?>

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
        <div id="title">
            <h1>Biblioteka</h1>    
        </div>

        <div id="add_form">
            <form class="add_form" action="./api/books.php" method="POST">
                <label>autor:
                    <input type="text" name="author"/></input>
                </label>
                <label>tytuł:
                    <input type="text" name="title"/></input>
                </label>
                <label>opis fabuły:
                    <textarea maxlength="1000" name="book_desc"/></textarea>
                </label>
                <label>gatunek:
                    <input type="text" name="genre"></input>
                </label>
                <button name="submit">Dodaj książkę</button>
            </form>
        </div>

        <hr>

        <div id="books">
            <table class="table_heading">
                <tr>
                    <th>autor</th>
                    <th>tytuł</th>
                    <th>gatunek</th>
                    <th></th>
                </tr>
            </table>
        </div>

    </body>
</html>