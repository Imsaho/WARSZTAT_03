<?php

include_once 'src/db.config.inc.php';
include_once 'src/book.php';

if($_SERVER['REQUEST_METHOD'] == 'GET') {
    //echo all books id
    
    $sql_id = "SELECT id FROM books ORDER BY author, name";
    $result = $conn->query($sql_id);
    $books =[];
    while($row = $result->fetch_assoc()) {
        $book = new Book();
        $book->loadFromDB($conn, $row['id']);
        $books[] = $book;
    }
    //var_dump($books);
    echo json_encode($books);
}