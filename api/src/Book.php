<?php

class Book implements JsonSerializable {

    private $id;
    private $name;
    private $author;
    private $book_desc;
    private $genre;

    public function __construct($name = '', $author = '', $book_desc = '', $genre = '') {
        $this->id = -1;
        $this->name = $name;
        $this->author = $author;
        $this->book_desc = $book_desc;
        $this->genre = $genre;
    }

    public function getId() {
        return $this->id;
    }

    public function getName() {
        return $this->name;
    }

    public function getAuthor() {
        return $this->author;
    }

    public function getBook_desc() {
        return $this->book_desc;
    }
    
    function getGenre() {
        return $this->genre;
    }

    public function setName($name) {
        $this->name = $name;
        return $this;
    }

    public function setAuthor($author) {
        $this->author = $author;
        return $this;
    }

    public function setBook_desc($book_desc) {
        $this->book_desc = $book_desc;
        return $this;
    }
    
    function setGenre($genre) {
        $this->genre = $genre;
        return $this;
    }

    public function loadFromDB($conn, $id) {
        $safe_id = $conn->real_escape_string($id);
        $sql = "SELECT name, author, book_desc, genre FROM books WHERE id=$safe_id";

        if ($result = $conn->query($sql)) {

            $row = $result->fetch_assoc();
            $this->name = $row['name'];
            $this->author = $row['author'];
            $this->book_desc = $row['book_desc'];
            $this->genre = $row['genre'];
            $this->id = $id;

            return true;
        } else {
            return false;
        }
    }

    public function create($conn, $name, $book_desc, $author, $genre) {
        $safe_name = $conn->real_escape_string($name);
        $safe_author = $conn->real_escape_string($author);
        $safe_book_desc = $conn->real_escape_string($book_desc);
        $safe_genre = $conn->real_escape_string($genre);

        $sql = "INSERT INTO books(name, author, book_desc, genre) VALUES('$safe_name', '$safe_author', '$safe_book_desc', '$genre')";

        if ($conn->query($sql)) {
            return true;
        } else {
            return false;
        }
    }

    public function update($conn, $name, $author, $book_desc, $genre) {
        //$safe_id = $conn->real_escape_string($id);
        $safe_name = $conn->real_escape_string($name);
        $safe_author = $conn->real_escape_string($author);
        $safe_book_desc = $conn->real_escape_string($book_desc);
        $safe_genre = $conn->real_escape_string($genre);

        $sql = "UPDATE books SET name='$safe_name', author='$safe_author', book_desc='$safe_book_desc', genre='$safe_genre'  WHERE id=$this->id";

        if ($conn->query($sql)) {
            return true;
        } else {
            return false;
        }
    }

    public function deleteFromDB($conn, $id) {
        $safe_id = $conn->real_escape_string($id);
        $sql = "DELETE FROM books WHERE id=$safe_id";

        if ($conn->query($sql)) {
            return true;
        } else {
            return false;
        }
    }

    public function jsonSerialize() {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'author' => $this->author,
            'book_desc' => $this->book_desc,
            'genre' => $this->genre
        ];
    }

}
?>
