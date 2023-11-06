<?php 
    include 'header.php';
    include 'sidebar.php';
    if(isset($_GET['act'])&&($_GET['act']!="")){
        $act=$_GET['act'];
        switch($act){
            case "listdm":
                include "category/list.php";
                break;
            case "listproduct":
                include "product/list.php";
                break;
            case "listcustomer":
                include "taikhoan/list.php";
                break;
            case "listcomment":
                include "binhluan/list.php";
                break;
            case "listcomment":
                include "binhluan/list.php";
                break;
            case "listcomment":
                include "binhluan/list.php";
                break;   
            case "listoders":
                include "cart/list.php";
                break;  
            default:
            //
            break; 
        }
    }else{
        include "dashboard.php";
    }
    include 'footer.php';
?>


