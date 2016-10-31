<?php

define("DB_HOST", "127.0.0.1");
define("DB_USER", "library");
define("DB_PASS", "UhJhlyrqXTI5NdE3");
define("DB_DATABASE", "library");

$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE
);

if ($conn->connect_error == FALSE) {
    echo "";
} else {
    echo "Connection Error: " . $conn->connect_error;
    die;
}

$conn->set_charset('utf8');

?>