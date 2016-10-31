<?php

include_once 'src/db.config.inc.php';
include_once 'src/book.php';

$result = $conn->query("SELECT author, name FROM books ORDER BY author, name");

$books = [];
while($row = $result->fetch_assoc()) {
    print $row['author'] . ": " . $row['name'] . "<br>";
    $books[] = $row;
}

$booksJson = json_encode($books);
var_dump($booksJson);

$book = new Book();

if ($book->loadFromDB($conn, 10)) {
    var_dump(json_encode($book));
} else {
    echo "ERROR: " . $conn->erno . $conn->error;
}

if ($book->deleteFromDB($conn, 11)) {
    
}


$conn->close();
$conn = null;