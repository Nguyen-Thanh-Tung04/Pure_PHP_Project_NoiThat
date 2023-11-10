<!-- breadcrumb-area start -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row breadcrumb_box  align-items-center">
                    <div class="col-lg-6 col-md-6 col-sm-12 text-center text-md-start">
                        <h2 class="breadcrumb-title">Shop</h2>
                    </div>
                    <div class="col-lg-6  col-md-6 col-sm-12">
                        <!-- breadcrumb-list start -->
                        <ul class="breadcrumb-list text-center text-md-end">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Login</li>
                        </ul>
                        <!-- breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- breadcrumb-area end -->
<!-- login area start -->
<div class="login-register-area pt-100px pb-100px">
    <div class="container">
        <div class="d-flex justify-content-center">
            <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                <div class="login-register-wrapper">
                    <div class="login-register-tab-list nav">
                        <a class="active" data-bs-toggle="tab" href="#lg1">
                            <h4>Đăng nhập</h4>
                        </a>
                        <a data-bs-toggle="tab" href="#lg2">
                            <h4>Đăng ký</h4>
                        </a>
                    </div>
                    <div class="tab-content">
                        <div id="lg1" class="tab-pane active">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <form action="index.php?act=dangnhap" method="post">
                                        <input type="text" name="user-name" placeholder="Tên tài khoản" />
                                        <input type="password" name="user-password" placeholder="Mật khẩu" />
                                        <div class="button-box">
                                            <div class="login-toggle-btn">
                                                <input type="checkbox" />
                                                <a class="flote-none" href="javascript:void(0)">ghi nhớ</a>
                                                <a href="index.php?act=quenmk">Quên mật khẩu ?</a>
                                            </div>
                                            <div class="dangky col-lg-3 my-3">
                                                <input type="submit" value="Đăng Nhập" name="dangnhap">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <p style="color: red;">Mật khẩu hoặc tài khoản không chính xác !</p>
                            </div>
                            <?php
                            //  if(isset($thongbao)){
                            //     echo "<p>. $thongbao.</p>";
                            // }
                            ?>
                        </div>
                        <div id="lg2" class="tab-pane">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <form action="index.php?act=dangky" method="post">
                                        <input type="text" name="user-name" placeholder="Tên tài khoản" />
                                        <input type="password" name="user-password" placeholder="Mật khẩu" />
                                        <input name="user-email" placeholder="Địa chỉ email" type="email" />
                                        <input type="text" name="user-adress" placeholder="Địa chỉ" />
                                        <input type="text" name="user-phone" placeholder="Số điện thoại" />
                                        <div class="ngaysinh">
                                            <p>Ngày sinh</p>
                                            <input type="date" name="birth" id="">
                                        </div>
                                        <div class="gioitinh">
                                            <label for="gioi_tinh">Giới tính</label>
                                            <select class="form-select" name="gender" id="gioi_tinh">
                                                <option value="nam">Nam</option>
                                                <option value="nữ">Nữ</option>
                                            </select>
                                        </div>


                                        <div class="dangky col-lg-3 my-3">
                                            <input type="submit" value="Đăng ký" name="dangky">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- login area end -->