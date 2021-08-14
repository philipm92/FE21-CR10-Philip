<?php 
require_once 'actions/db_connect.php';

$sql = "SELECT ISBN, image, title, type, short_description as 'description', publish_date as 'published' FROM library; ";
$result = mysqli_query($connect, $sql);
$tbody=''; //this variable will hold the body for the table
if(mysqli_num_rows($result)  > 0) {     
    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        // ISBN, image, title, type, description, 'author', 'published', 'publisher', 'publisher_address', available
        $tbody .= "
            <tr>
                <td>" .$row['ISBN']."</td>
                <td><img class='img-fluid' src='pictures/" .$row['image']."'</td>
                <td>" .$row['title']."</td>
                <td>" .$row['type']."</td>
                <td style='text-align:justify;'><q>" .$row['description']."</q></td>
                <td>" .$row['published']."</td>
                <td>
                    <a href='update.php?ISBN=".$row["ISBN"]."'><button class='btn btn-primary btn-sm m-1' type='button'>Edit</button></a>
                    <a href='delete.php?ISBN=".$row["ISBN"]."'><button class='btn btn-danger btn-sm m-1' type='button'>Delete</button></a>
                </td>
                
                <td>
                    <a href='showmedia.php?ISBN=".$row['ISBN']."'><button class='btn btn-success btn-sm' type='button'>Show media</button></a>
                </td>
            </tr>";
    }
} else $tbody =  "<tr><td colspan='9'><center>No Data Available </center></td></tr>";

$sql = "SELECT publisher_name, publisher_address, COUNT(*) AS 'numberofmedia' FROM library GROUP BY library.publisher_name ORDER BY library.publisher_name;";
$result = mysqli_query($connect, $sql);
$listpublisher = ''; // hold data for publishers
if(mysqli_num_rows($result)  > 0) {
    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $listpublisher .= "
        <a href='showpublisher.php?publisher_name=".$row['publisher_name']."' class='text-center list-group-item list-group-item-action flex-column align-items-start'>
            <div class='d-flex justify-content-center'>
                <h5 class='mb-1'>".$row['publisher_name']."</h5>
            </div>
            <p class='mb-1'>".$row['publisher_address']."</p>
            <small><b>Learn more</b></small>
        </a>";
    }
} else $listpublisher =  "<div class='d-flex justify-content-center'><h5 class='mb-1'>No Publisher Available</h5></div>";

mysqli_close($connect);
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Philip Mahlberg - Code Review 10</title>
        <?php require_once 'components/boot.php'?>
        <link href="components/style.css" rel="stylesheet" type= "text/css">
    </head>
    <body>
        <div class="manageProduct my-2 my-md-4">    
            <div class='mb-3'>
                <a href= "create.php"><button class='btn btn-primary'type="button" >Add new media</button></a>
            </div>
            <h2 class="text-center">Media Library</h2>
            <div class="table-responsive mx-auto w-75">
                <table class='table table-hover table-striped'>
                    <thead class='table-success'>
                        <tr>
                            <th>ISBN</th>
                            <th>Image</th>
                            <th>Title</th>
                            <th>Type</th>
                            <th>Description</th>
                            <th>Published on</th>
                            <th>Change</th>
                            <th>More Information</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?= $tbody;?>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="manageProduct my-2 my-md-4">
            <h2 class="text-center">Publishers</h2>
            <div class="list-group w-50 mx-auto my-2">
                <?= $listpublisher; ?>

            </div>  
        </div>      
    </body>
</html>