<?php
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

        case 'cart':
            include_once "view/cart/cart.php";
            break;
        case 'thanhtoan':
            include_once "view/cart/thanhtoan.php";
            break;
            case 'bill':
                include_once "view/cart/bill.php";
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