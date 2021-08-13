<?php 
require_once 'actions/db_connect.php';

if ($_GET['id']) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM dishes WHERE dishID = {$id}" ;
    $result = mysqli_query($connect, $sql);
    $data = mysqli_fetch_assoc($result);
    if (mysqli_num_rows($result) == 1) {
        $name = $data['name'];
        $price = $data['price'];
        $description = $data['description'];
        $picture = $data['image'];
    } else {
        header("location: error.php");
    }
    mysqli_close($connect);
} else {
    header("location: error.php");
}  
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Delete Product</title>
        <?php require_once 'components/boot.php'?>
        <link href="components/style.css" rel="stylesheet" type= "text/css">
    </head>
    <body>
        <fieldset>
            <div class="d-flex flex-column justify-content-center align-items-center">
                <legend class='h2 mb-3 text-center'>Delete request</legend>
                <img class='img-thumbnail rounded-circle' src='pictures/<?php echo $picture ?>' alt="<?php echo $name ?>">
                <h5>You have selected the data below:</h5>
                <table class="table table-responsive w-75 mt-3 d-flex flex-column justify-content-center">
                    <tr>
                        <td><?php echo $name?></td>
                        <td><?php echo $price?></td>
                        <td><?php echo $description?></td>
                    </tr>
                </table>

                <h3 class="mb-4">Do you really want to delete this product?</h3>
                <form action ="actions/a_delete.php" method="post">
                    <input type="hidden" name="id" value="<?php echo $id ?>" />
                    <input type="hidden" name="image" value="<?php echo $picture ?>" />
                    <button class="btn btn-danger" type="submit">Yes, delete it!</button>
                    <a href="index.php"><button class="btn btn-warning" type="button">No, go back!</button></a>
                </form>

            </div> 
        </fieldset>
    </body>
</html>