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
