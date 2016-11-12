<?php

include_once 'src/db.config.inc.php';
include_once 'src/Book.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    //echo all books id

    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $sql = "SELECT * FROM books WHERE id=$id";
        $result = $conn->query($sql);
        $book = new Book();
        $book->loadFromDB($conn, $id);

        echo json_encode($book);
    } else {
        $sql_id = "SELECT id FROM books ORDER BY author, name";
        $result = $conn->query($sql_id);
        $books = [];
        while ($row = $result->fetch_assoc()) {
            $book = new Book();
            $book->loadFromDB($conn, $row['id']);
            $books[] = $book;
        }
        //var_dump($books);
        echo json_encode($books);
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = [];

    if (!empty($_POST['author']) && !empty($_POST['title']) && !empty($_POST['book_desc']) && !empty($_POST['genre'])) {

        $author = $_POST['author'];
        $title = $_POST['title'];
        $description = $_POST['book_desc'];
        $genre = $_POST['genre'];

        $newBook = new Book();
        if ($newBook->create($conn, $title, $description, $author, $genre)) {
            $data['success'] = true;
        } else {
            $data['success'] = false;
        }
        echo json_encode($data);
    } else {
        $data['message'] = "Niekompletne informacje";
        $data['success'] = false;
        echo json_encode($data);
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $del_vars);
    if (isset($del_vars['id'])) {
        $id = $del_vars['id'];
        $sql = "SELECT * FROM books WHERE id=$id";

        $result = $conn->query($sql);
        $book = new Book();
        $book->deleteFromDB($conn, $id);
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
    parse_str(file_get_contents("php://input"), $put_vars);
    $data = [];
    $id = $put_vars['id'];
    $newBook = new Book();
    $newBook->loadFromDB($conn, $id);

    if (!empty($put_vars['author'])) {
        $author = $put_vars['author'];
        //$newBook->setAuthor($author);
    } else {
        $author = $newBook->getAuthor();
    }

    if (!empty($put_vars['title'])) {
        $title = $put_vars['title'];
        //$newBook->setName($title);
    } else {
        $title = $newBook->getName();
    }

    if (!empty($put_vars['book_desc'])) {
        $book_desc = $put_vars['book_desc'];
        //$newBook->setBook_desc($bookDesc);
    } else {
        $book_desc = $newBook->getBook_desc();
    }

    if (!empty($put_vars['genre'])) {
        $genre = $put_vars['genre'];
        //$newBook->setGenre($genre);
    } else {
        $genre = $newBook->getGenre();
    }

    if ($newBook->update($conn, $title, $author, $book_desc, $genre) == true) {
        $data['success'] = true;
    } else {
        $data['success'] = false;
    }
    echo json_encode($data);
}
?>