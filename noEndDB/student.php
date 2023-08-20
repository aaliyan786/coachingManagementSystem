
<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "noendacademy";
    $table = "student";

    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST, OPTIONS");



    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
        return;
    }



    $action = $_POST['action'];

    if('GET_ALL' == $action){
        $dbdata = array();
        $sql = "SELECT * FROM $table ORDER BY loginID";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $dbdata[]=$row;
            }
            echo json_encode($dbdata);
        } else {
            echo json_encode("no entries available");
        }
        $conn->close();
        return;
    }

    if('GET_ONE' == $action){
        $loginID = $_POST['loginID'];
        //$dbdata = array();
        $sql = "SELECT * FROM $table where loginID = '$loginID'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();            
            echo json_encode($row);

        } else {
            echo json_encode("no user found");
        }
        $conn->close();
        return;
    }

    if('_ADD' == $action){
        $loginID = $_POST['loginID'];
        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $gender = $_POST['gender'];
        $dob = $_POST['dob'];
        $cnic = $_POST['cnic'];
        $email = $_POST['email'];
        $mobile = $_POST['mobile'];
        $address = $_POST['address'];

        
        $query = "SELECT * from $table where loginID = '$loginID'";
        $check =  $conn->query($query);
        $count = mysqli_num_rows($check);

        if ($count == 1) {
            $msg = "user already exixts";
            //echo json_encode("User already exists!");
            echo json_encode($msg);
            $conn->close();
            return;
        }

        $sql = "INSERT INTO $table (loginID, first_name, last_name, gender, dob, cnic, email, mobile, address) 
                VALUES('$loginID', '$first_name', '$last_name', '$gender', '$dob', '$cnic', '$email', '$mobile', '$address')";
        $result = $conn->query($sql);
        echo 'success';
        $conn->close();
        return;
    }

    // if('_UPDATE' == $action){
    //     $emp_id = $_POST['emp_id'];
    //     $first_name = $_POST['first_name'];
    //     $last_name = $_POST['last_name'];
    //     $sql = "UPDATE $table SET first_name = '$first_name', last_name = '$last_name' WHERE id = $emp_id";
    //     if ($conn->query($sql) === TRUE) {
    //         echo "success";
    //     } else {
    //         echo "error";
    //     }
    //     $conn->close();
    //     return;
    // }

    if('_DELETE' == $action){
        $loginID = $_POST['loginID'];
        $sql = "DELETE FROM $table WHERE loginID = '$loginID'";
        if ($conn->query($sql) === TRUE) {
            echo json_encode("success");
        } else {
            echo json_encode("query failed");
        }
        $conn->close();
        return;
    }
    
?>
