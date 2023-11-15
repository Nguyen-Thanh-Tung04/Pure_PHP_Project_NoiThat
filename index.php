    <?php
    session_start();
    include "model/pdo.php";
    include "model/taikhoanuser.php";
    include "view/header.php";
    include "view/OffCanvas.php";
    if ((isset($_GET['act'])) && ($_GET['act'] != "")) {
        $act = $_GET['act'];
        switch ($act) {
            case "sanphamct":
                include "view/product_detail.php";
                break;
            case "account":
                include "view/acount/my-account.php";
                break;

            case 'login':
                include_once "view/acount/login.php";

                // Đăng nhập
                if (isset($_POST['dangnhap']) && $_POST['dangnhap']) {
                    $user = $_POST['user-name'];
                    $pass = $_POST['user-password'];
                    $checkuser = checkuser($user, $pass);
                    $thongbao = "";
                    if (is_array($checkuser)) {
                        $_SESSION['user-name'] = $checkuser;
                        // header('location:index.php');
    ?>
    <meta http-equiv="refresh" content="0;url=index.php">
    <?php
                        exit; // Kết thúc kịch bản sau khi chuyển hướng
                    } else {
                        echo '<script>document.querySelector(".thongbao").innerText = "Mật khẩu sai rồi !";</script>';                        // $thongbao = "Tài khoản hoặc mật khẩu không chính xác !";
                    }
                }

                // Đăng ký  
                if (isset($_POST['dangky']) && $_POST['dangky']) {
                    $email = $_POST['user-email'];
                    $user = $_POST['user-name'];
                    $pass = $_POST['user-password'];

                    insert_taikhoan($email, $user, $pass);
                    echo '<script>document.querySelector(".thongbao").innerText = "Đăng ký thành công :)";</script>';                        // $thongbao = "Tài khoản hoặc mật khẩu không chính xác !";


                }
                break;






            case 'quenmk':
                if (isset($_POST['guiemail']) && $_POST['guiemail']) {
                    $email = $_POST['email'];
                    // cách 2: Gửi thông báo về email
                    $sendMailMess = sendMail($email);
                }
                include_once "view/acount/quenmk.php";
                break;




            case 'dangxuat':
                session_unset();
                // header('location:index.php');
                //    include_once "view/gioithieu.php";
                ?>
    <meta http-equiv="refresh" content="0;url=index.php?act=login">
    <?php
                break;


            case 'edit_taikhoan':
                if (isset($_POST['capnhat']) && $_POST['capnhat']) {
                    $email = $_POST['user-email'];
                    $user = $_POST['user-name'];
                    $pass = $_POST['user-password'];
                    $phone = $_POST['user-phone'];
                    $adress = $_POST['user-adress'];
                    $gender = $_POST['gender'];
                    $birth = $_POST['birth'];
                    $id = $_POST['id'];

                    $hinh = $_FILES['hinh']['name'];
                    $target_dir = "upload/";
                    $target_file = $target_dir . basename($_FILES['hinh']['name']);
                    if (move_uploaded_file($_FILES['hinh']['tmp_name'], $target_file)) {
                    }
                    update_taikhoan($id, $email, $user, $pass, $phone, $adress, $gender, $birth, $hinh);

                    // cập nhật lại session user mới 
                    $_SESSION['user-name'] = checkuser($user, $pass);

                    $thongbao = "Cập nhật thông tin thành công !";

                    include_once "view/acount/my-account.php";
                }

                break;

            case 'edit_pass':
                if (isset($_POST['capnhat']) && $_POST['capnhat']) {
                    $user = $_POST['user-name'];
                    $pass = $_POST['user-password'];
                    $pass_new = $_POST['password-new'];
                    $pass_new_confirm = $_POST['password-new-confirm'];
                    $id = $_POST['id'];

                    $thongbao = "";

                    if ($pass_new == $pass_new_confirm) {
                        $pass = $pass_new;
                        update_pass($id, $pass, $user);
                        // cập nhật lại session user mới 
                        $_SESSION['user-name'] = checkuser($user, $pass);
                        $thongbao = "Thay đổi mật khẩu thành công !";
                    } else {
                        $thongbao = "Mật khẩu không trùng khớp !";
                    }
                }
                include_once "view/acount/my-account.php";
                break;


            case 'cart':
                include_once "view/cart/cart.php";
                break;
            case 'thanhtoan':
                include_once "view/cart/thanhtoan.php";
                break;
            case 'bill':
                include_once "view/cart/bill.php";
                break;
            case 'trangthaidon':
                include_once "view/cart/trangthaidon.php";
                break;

                case 'trangthai_chitiet':
                    include_once "view/cart/trangthai_chitiet.php";
                    break;
    

            case 'error':
                include_once "view/404.php";
                break;


            case 'about':
                include_once "about.php";
                break;
            case 'store':
                include_once "store.php";
                break;
            case 'blog':
                include_once "blog.php";
                break;
            case 'contact':
                include_once "contact.php";
                break;

            default:
                include_once "view/home.php";
                break;
        }
    } else {
        include "view/home.php";
    }

    include "view/footer.php";