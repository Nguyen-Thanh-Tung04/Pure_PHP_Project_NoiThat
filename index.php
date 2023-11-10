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
                break;
            case 'quenmk':
                include_once "view/acount/quenmk.php";
                break;



            case 'dangnhap':
                if (isset($_POST['dangnhap']) && $_POST['dangnhap']) {
                    $user = $_POST['user-name'];
                    $pass = $_POST['user-password'];
                    $checkuser = checkuser($user, $pass);
                    if (is_array($checkuser)) {
                        $_SESSION['user-name'] = $checkuser;
                        // header('Location: index.php');
                         ?>
    <meta http-equiv="refresh" content="0;url=index.php">
    <?php
                        exit; // Kết thúc kịch bản sau khi chuyển hướng
                    } else {
                        echo "<h1>Đăng nhập thất bại </h1>";
                    }
                }
                break;
            case 'dangxuat':
                session_unset();
                // header('location:index.php');
                //    include_once "view/gioithieu.php";
                ?>
    <meta http-equiv="refresh" content="0;url=index.php?act=login">
    <?php
                break;

            case 'dangky':
                if (isset($_POST['dangky']) && $_POST['dangky']) {
                    $email = $_POST['user-email'];
                    $user = $_POST['user-name'];
                    $pass = $_POST['user-password'];
                    $phone = $_POST['user-phone'];
                    $adress = $_POST['user-adress'];
                    $gender = $_POST['gender'];
                    $birth = $_POST['birth'];

                    insert_taikhoan($email, $user, $pass, $phone, $adress, $gender, $birth);
                    $thongbao = "Đã đăng ký thành công. Vui lòng đăng nhập để thực hiện chức năng";
                }

                echo '<h1 class="text-center">Đăng ký tài khoản thành công !</h1>';
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


                    update_taikhoan($id, $email, $user, $pass, $phone, $adress, $gender, $birth);

                    // cập nhật lại session user mới 
                    $_SESSION['user-name'] = checkuser($user, $pass);

                    include_once "view/acount/my-account.php";
                }

             break;

            case 'edit_pass':
                if (isset($_POST['capnhat']) && $_POST['capnhat']) {
                    $user = $_POST['user-name'];
                    $pass = $_POST['user-password'];

                    $id = $_POST['id'];


                    update_pass($id,$pass,$user);
                    
                    // cập nhật lại session user mới 
                    $_SESSION['user-name'] = checkuser($user, $pass);

                    include_once "view/acount/my-account.php";
                }

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