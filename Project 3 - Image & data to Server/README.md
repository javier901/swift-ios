# Saving Contacts App

This is a Swift app that demonstrates sending of data from the application to a web server. It is a personal contact list app, where the user can make new entries with details about one's telephone contacts.

## Details of the application
The user can send 2 kinds of data : Name & Phone numbers (as String/text) and contact images (binary data). The uploaded image is saved in a folder on the server. The database, also on server, saves contact name, phone number and the corresponding image file path location.

![app](https://github.com/d-misra/Swift-Apps/blob/master/Project%203%20-%20Image%20%26%20data%20to%20Server/Thumbnail.png)

## Topics covered
- Making HTTP request in Swift with [URLRequest](https://developer.apple.com/documentation/foundation/urlrequest)
- Sending Swift data as JSON objects [JSONSerialization](https://developer.apple.com/documentation/foundation/jsonserialization)
- Server side database handling & storage using PHP (code below)

## Database view

![db](https://github.com/d-misra/Swift-Apps/blob/master/Project%203%20-%20Image%20%26%20data%20to%20Server/Db.png)

## Server side code in PHP
```
<?php

session_start();

{
  $post = file_get_contents('php://input');
  $jsonObject = json_decode($post, true);
  $fileExtension = "png";
  $uploadFileDir = './uploaded_files/';
  $fileName = $uploadFileDir.md5(time()) . '.' . $fileExtension;

  $ifp = fopen( $fileName, "wb" );
  fwrite( $ifp, base64_decode( $jsonObject['picture'] ) );
  fclose( $ifp );
  $jsonObject['message'] = "We succeeded (theoretically) to store your data !!!";
  echo(json_encode($jsonObject));

//  Database entry
  $servername = "localhost";
  $username = "username"; // Enter your username
  $password = "pw"; // Enter your password
  $dbname = "Contacts";

  // Create connection
  $conn = new mysqli($servername, $username, $password, $dbname);
  if ($conn->connect_error) {
    die("Connection to database failed: " . $conn->connect_error);
  }
  else {
    // echo nl2br ("\n Connection to database is OK");
  }

  $NameVal = $jsonObject['name'];
  $PhoneVal = $jsonObject['phone'];
  $ImgPathVal = $fileName;

  // If you want to assign incremental values to the saved images
  // $fileCount = count (glob ('uploaded_files/*.png'));
  // $newName = 'uploaded_files/' . ( $fileCount + 1) . '.png';
  // $ImgPathVal = 'uploaded_files/'.$newName;

  $sql = "INSERT INTO ContactRecords (Name, Phone, ImgPath)
  VALUES ('$NameVal', '$PhoneVal', '$ImgPathVal')";

  if ($conn->query($sql) === TRUE) {
    // echo nl2br ("\n New record created successfully:");
  } else {
    // echo nl2br ("\n Error in adding to record: " . $sql . "<br>" . $conn->error);
  }
  $conn->close();
  die();
}
```

## Help

- PHP [documentation](https://www.php.net/)
- Insert data in mysql database using PHP [link](https://www.w3schools.com/php/php_mysql_insert.asp)
- Excellent [article](https://matteomanferdini.com/network-requests-rest-apis-ios-swift/) on handling network requests in iOS Swift
- Installation [tutorial](https://coolestguidesontheplanet.com/get-apache-mysql-php-and-phpmyadmin-working-on-macos-sierra/) to setup Apache, MySQL, PHP and phpmyadmin on MacOS High Sierra
