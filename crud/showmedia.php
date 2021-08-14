<?php
require_once 'actions/db_connect.php';

if ($_GET['ISBN']) {
    $ISBN = $_GET['ISBN'];
    $sql = "SELECT * FROM library WHERE ISBN = '{$ISBN}'";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) == 1) {
        // image, title, type, short_description as 'description', publish_date as 'published', publisher_name AS 'publisher', publisher_address AS 'address'
        $data = mysqli_fetch_assoc($result);
        $title = $data['title'];
        $type = $data['type'];
        $status = $data['status'];
        $status_class = ($status == "available") ? "text-success" : "text-danger";
        $description = $data['short_description'];
        $published = $data['publish_date'];
        $publisher = $data['publisher_name']; 
        $publisher_address = $data['publisher_address']; 
        $picture = $data['image'];
        $author_firstname = $data['author_first_name'];
        $author_lastname = $data['author_last_name'];

    } else {
        header("location: error.php");
    }
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
        <style>
            th, td {text-align: left;}
        </style>
    </head>
    <body>
        <fieldset>
            <div class="d-flex flex-column justify-content-center align-items-center">
                <h2 class="text-center">Show All Media Data</h2>
                <img class='img-fluid img-thumbnail m-2' src='pictures/<?php echo $picture ?>' alt="<?php echo $title ?>">
            </div>
            <div class="table-responsive mx-auto w-75">
                    <table class='table table-hover table-striped mx-auto'>
                        <tr>
                            <th>ISBN</th>
                            <td><?php echo $ISBN ?></td>
                        </tr> 
                        
                        <tr>
                            <th>Title</th>
                            <td><?php echo $title ?></td>
                        </tr> 

                        <tr>
                            <th>Type</th>
                            <td><?php echo $type ?></td>
                        </tr> 

                        <tr>
                            <th>Description</th>
                            <td><?php echo $description ?></td>
                        </tr>

                        <tr>
                            <th>Author first name</th>
                            <td><?php echo $author_firstname ?></td>
                        </tr> 

                        <tr>
                            <th>Author last name</th>
                            <td><?php echo $author_lastname ?></td>
                        </tr> 

                        <tr>
                            <th>Publish Date</th>
                            <td><?php echo $published ?></td>
                        </tr> 

                        <tr>
                            <th>Publisher</th>
                            <td><?php echo $publisher ?></td>
                        </tr> 

                        <tr>
                            <th>Publisher Address</th>
                            <td><?php echo $publisher_address ?></td>
                        </tr>
                        
                        <tr>
                            <th>Availability</th>
                            <td class="<?php echo $status_class ?>"><?php echo $status ?></td>
                        </tr>
                    </table>
            </div>
            <a href= "index.php"><button class="btn btn-warning text-center" type="button"><< Go Back</button></a>

        </fieldset>
    </body>
</html>