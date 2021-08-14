<?php
require_once 'actions/db_connect.php';

if ($_GET['publisher_name']) {
    $publisher_name = $_GET['publisher_name'];
    $sql = "SELECT * FROM library WHERE publisher_name = '{$publisher_name}' ORDER BY title";
    $result = mysqli_query($connect, $sql);
    $tbody=''; //this variable will hold the body for the table
    if (mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $tbody .= "
            <tr>
                <td>" .$row['ISBN']."</td>
                <td><img class='img-thumbnail img-fluid m-2' src='pictures/" .$row['image']."'</td>
                <td>" .$row['title']."</td>
                <td>" .$row['type']."</td>
                <td style='text-align:justify;'><q>" .$row['short_description']."</q></td>
                <td>".$row['author_first_name']." ".$row['author_last_name']."</td>
                <td>" .$row['publish_date']."</td>
            </tr>";            
        }

    } else $tbody =  "<tr><td colspan='5'><center>No Data Available </center></td></tr>";
    mysqli_close($connect);
} else {
    header("location: error.php");
}
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Show Media Data</title>
        <?php require_once 'components/boot.php'?>
        <link href="components/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="manageProduct my-2 my-md-4">    
            <h2 class="text-center">Media From <?php echo $publisher_name ?></h2>
            <div class="table-responsive mx-auto w-75">
                <table class='table table-hover table-striped'>
                    <thead class='table-success'>
                        <tr>
                            <th>ISBN</th>
                            <th>Image</th>
                            <th>Title</th>
                            <th>Type</th>
                            <th>Description</th>
                            <th>Author</th>
                            <th>Published on</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?= $tbody;?>
                    </tbody>
                </table>
            </div>
            <div class="text-center">
                <a href= "index.php"><button class="btn btn-warning" type="button"><< Go Back</button></a>
            </div>
        </div>

    </body>
</html>