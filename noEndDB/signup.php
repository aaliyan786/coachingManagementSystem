<?php

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "noendacademy";
    $table = "logindetails";

    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST, OPTIONS");

    //create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    //check connection
    if ($conn->connect_error) {
        die("Connection Failed" . $conn->connect_error);
        return;
    }
    else {
        //echo "Connection Successful";
    }

    //if connection is OK
    $action = $_POST['action'];


     if ("Add_User" == $action) {
        $loginID = $_POST['loginID'];
        $status = $_POST['status'];

        //check if loginID is unique
        $sql = "select * from logindetails where loginID = '$loginID'";
        $query = $conn->query($sql);
        $count = mysqli_num_rows($query);
        if ($query == true) {
            if ($count == 1) {
                $msg = "user already exixts";
                //echo json_encode("User already exists!");
                echo json_encode($msg);
            }
            else {
                //escape password
                $escapedPass = mysqli_real_escape_string($conn, $_POST['pass']);
                //hash password
                $pass = password_hash($escapedPass, PASSWORD_DEFAULT);

                //write sql quesry to insert data in logindetails table
                $insert = "insert into $table(loginID, password, status) values('$loginID','$pass','$status')";

                //check if data was inserted in table successfully
                $result = $conn->query($insert);
                if ($result == true) {
                    
                    echo json_encode("Success");
                }
                else {
                    echo json_encode("Unable to insert data");
                }
            }
        }
        else {
            echo json_encode("Unable to retrieve data");
        }

        $conn->close();
    }
    elseif ("SignIn" == $action) {
        //get data from user
        $loginID = $_POST['loginID'];
        $pass = mysqli_real_escape_string($conn, $_POST['pass']);

        //check if loginID is in database
        $sql = "select * from logindetails where loginID = '$loginID'";
        $query = $conn->query($sql);
        
        //if query was successfull
        if ($query == true) {
            //if a loginID match is found
            if (mysqli_num_rows($query) > 0) {
                $row = mysqli_fetch_assoc($query);

                //if password matches
                if (password_verify($pass, $row["password"])) {
                    echo json_encode(array("Success",$row["loginID"],$row["status"]));
                }
                else {
                    echo json_encode("Incorrect password");
                }
            }
            else {
                echo json_encode("Incorrect loginID");
            }
        }
        else {
            echo json_encode("Unable to retrieve data");
        }
        
        $conn->close();
    }

    return;
?>