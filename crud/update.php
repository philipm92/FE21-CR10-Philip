<?php
require_once 'actions/db_connect.php';

if ($_GET['id']) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM dishes WHERE dishID = {$id}";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) == 1) {
        $data = mysqli_fetch_assoc($result);
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
<html>
    <head>
        <title>Edit Product</title>
        <?php require_once 'components/boot.php'?>
        <link href="components/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <fieldset>
            <div class="d-flex flex-column justify-content-center align-items-center">
                <legend class='h2 text-center'>Update request</legend>
                <img class='img-fluid img-thumbnail rounded-circle m-2' src='pictures/<?php echo $picture ?>' alt="<?php echo $name ?>">
            </div>
            <form action="actions/a_update.php"  method="post" enctype="multipart/form-data">
                <table class="table">
                    <tr>
                        <th>Name</th>
                        <td><input class="form-control" type="text"  name="name" placeholder ="Product Name" value="<?php echo $name ?>"  /></td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td><input class="form-control" type= "number" name="price" step="any"  placeholder="Price" value ="<?php echo $price ?>" /></td>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <td><input class="form-control" type= "text" name="description" placeholder="Description" value ="<?php echo $description ?>" /></td>
                    </tr>                    
                    <tr>
                        <th>Picture</th>
                        <td><input class="form-control" type="file" name= "image" /></td>
                    </tr>
                    <tr>
                        <input type= "hidden" name= "id" value= "<?php echo $data['dishID'] ?>" />
                        <input type= "hidden" name= "image" value= "<?php echo $data['image'] ?>" />
                        <td><a href= "index.php"><button class="btn btn-warning" type="button"><< Go Back</button></a></td>
                        <td><button class="btn btn-success" type= "submit">Save Changes</button></td>
                    </tr>
                </table>
            </form>
        </fieldset>
    </body>
</html>