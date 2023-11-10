<?php
function loadall_taikhoan()
{
    $sql = "select * from user order by id desc ";
    $listtaikhoan = pdo_query($sql);
    return $listtaikhoan;
}
function insert_taikhoan($email, $user, $pass,$phone,$adress,$gender,$birth)
{
    // $birth = date('Y/d/m');
    $sql = "insert into user(user_email,user_name,user_password,user_phone,user_address,user_gender,user_birth) values('$email','$user','$pass','$phone','$adress','$gender','$birth')";
    pdo_execute($sql);
}
function delete_taikhoan($id)
{
    $sql = "delete from taikhoan where id=" . $id;
    pdo_execute($sql);
}
function checkuser($user, $pass)
{
    $sql = "SELECT * FROM user WHERE user_name = '" . $user . "' AND user_password = '" . $pass . "'";
    $sp = pdo_query_one($sql);
    return $sp;
}
function checkemail($email)
{
    $sql = "SELECT * FROM taikhoan WHERE email = '" . $email . "'";
    $sp = pdo_query_one($sql);
    return $sp;
}
function update_taikhoan($id,$email, $user,$pass, $phone, $adress, $gender, $birth)
{
    $sql = "UPDATE user SET user_name='" . $user . "', user_password='" . $pass . "', user_email='" . $email . "', user_address	='" . $adress . "', user_gender	='" . $gender . "' , user_birth	='" . $birth . "', user_phone	='" . $phone . "' WHERE user_id=" . $id;

    pdo_execute($sql);
}
function update_pass($id,$pass,$user)
{
    $sql = "UPDATE user SET  user_name='" . $user . "', user_password='" . $pass . "' WHERE user_id=" . $id;

    pdo_execute($sql);
}


?>