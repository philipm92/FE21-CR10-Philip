<?php 
require_once 'actions/db_connect.php';
$sql = "SELECT * FROM dishes";
$result = mysqli_query($connect ,$sql);
$tbody=''; //this variable will hold the body for the table
if(mysqli_num_rows($result)  > 0) {     
    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){ 
        // image. name  price descripton action        
        $tbody .= "
            <tr>
                <td><img class='img-thumbnail img-fluid' src='pictures/" .$row['image']."'</td>
                <td class='text-center'>" .$row['name']."</td>
                <td class='text-center'>" .$row['price']."&euro;</td>
                <td class='text-center'>" .$row['description']."</td>
                <td><a href='update.php?id=" .$row['dishID']."'><button class='btn btn-primary btn-sm' type='button'>Edit</button></a>
                <a href='delete.php?id=" .$row['dishID']."'><button class='btn btn-danger btn-sm' type='button'>Delete</button></a></td>
            </tr>";
    };
} else {
    $tbody =  "<tr><td colspan='5'><center>No Data Available </center></td></tr>";
}

mysqli_close($connect);
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PHP CRUD</title>
        <?php require_once 'components/boot.php'?>
        <link href="components/style.css" rel="stylesheet" type= "text/css">
    </head>
    <body>
        <div class="manageProduct w-75 mt-3">    
            <div class='mb-3'>
                <a href= "create.php"><button class='btn btn-primary'type="button" >Add product</button></a>
            </div>
            <p class='h2'>Products</p>
            <table class='table table-striped'>
                <thead class='table-success'>
                    <tr>
                        <th>&nbsp;</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?= $tbody;?>
                </tbody>
            </table>
        </div>
    </body>
</html>