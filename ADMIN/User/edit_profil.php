<?php

session_start();
if ( !isset($_SESSION["login1"]) ){
    header("location:login.php");
    exit;
}
require '../../functions.php';

//ambil nilai berdasarkan session 
$result = mysqli_query($conn, 'SELECT * FROM user_admin WHERE id_admin= '.$_SESSION["id_admin"].'');
$row = mysqli_fetch_assoc($result);

if (isset ($_POST["ubah_prop"])) {
    if ( ubah_profil ($_POST) > 0) {
        echo "
            <script>
                alert('Profil Berhasil diubah....!');
                document.location.href = 'edit_profil.php';
            </script>
        ";

    } else {
        echo "
        <script>
            alert('Profil Gagal diubah.....!');
            document.location.href = 'edit_profil.php';
        </script>
    ";
    }
}

if (isset ($_POST["ubahpass"])) {
    if ( ubah_pass ($_POST) > 0) {
        echo "
            <script>
                alert('Password Berhasil diubah....!');
                document.location.href = 'edit_profil.php';
            </script>
        ";
    } else {
        echo "
        <script>
            alert('Password Gagal diubah.....!');
            document.location.href = 'edit_profil.php';
        </script>
    ";
    }
}



?>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Profil Admin | Golden Parfum </title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">


    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../halaman_admin.php">
                <div class="sidebar-brand-icon rotate-n-15">
                    <!-- LOGO -->
                </div>
                <div class="sidebar-brand-text mx-3">Golden Parfum</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="../halaman_admin.php">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Data Website
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="../Produk/produk.php" data-toggle="collapse"
                    data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <span>Data Produk</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="../Produk/produk.php">Data Produk</a>
                        <a class="collapse-item" href="../Produk/tambah_produk.php">Tambah Produk</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="../Kategori/kategori.php" data-toggle="collapse"
                    data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    <span>Data Kategori</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="../Kategori/kategori.php">Data Kategori</a>
                        <a class="collapse-item" href="../Kategori/tambah_kategori.php">Tambahh Kategori</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="../Transaksi/transaksi.php">
                    <span>Data Transaksi</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="../Masukan/masukan_web.php">
                    <span>Masukan</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <ul>
                        <li class="nav-item dropdown no-arrow  float-end">

                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span
                                    class="mr-2 d-none d-lg-inline text-gray-600 small"><?php echo $_SESSION["name_admin"];?></span>
                                <i class="bi bi-person-circle text-secondary"></i>
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="edit_profil.php">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Edit Profile
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout.php" data-toggle="modal"
                                    data-target="#logoutModal" onclick="
                return confirm('Yakin akan logout?')">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Edit Profil</h1>
                    </div>

                    <form action="" class="mb-3" method="post" enctype="multipart/form-data">

                        <div class="mb-3">
                            <input type="text" class="form-control" name="nama" id="nama" placeholder="Nama"
                                value="<?php echo $row["name_admin"] ?>" required>
                        </div>

                        <div class="mb-3">
                            <input type="text" class="form-control" name="username" id="username" placeholder="Username"
                                value="<?php echo $row["username"] ?>" required>
                        </div>

                        <div class="mb-3">
                            <button type="submit" class="btn btn-outline-primary" name="ubah_prop">Ubah Profil</button>
                        </div>

                    </form>

                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Ganti Password</h1>
                    </div>

                    <form action="" class="mb-3" method="post" enctype="multipart/form-data">

                        <div class="mb-3">
                            <input type="password" class="form-control" name="pass" id="pass"
                                placeholder="Password Lama" required>
                        </div>

                        <div class="mb-3">
                            <input type="password" class="form-control" name="newpass" id="newpass"
                                placeholder="Password Baru" required>
                        </div>

                        <div class="mb-3">
                            <input type="password" class="form-control" name="newpass2" id="newpass"
                                placeholder="Konfirmasi Password Baru" required>
                        </div>

                        <?php if(isset($error)) {?>
                        <div class="alert alert-danger" role="alert">
                            <p>Konfirmasi password tidak sesuai</p>
                        </div>
                        <?php }; ?>

                        <div class="mb-3">
                            <button type="submit" class="btn btn-outline-primary" name="ubahpass">Ubah Password</button>
                        </div>

                    </form>

                </div>
            </div>
        </div>

</body>



<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>


<script src="../js/sb-admin-2.min.js"></script>


<script src="../vendor/chart.js/Chart.min.js"></script>


<script src="../js/demo/chart-area-demo.js"></script>
<script src="../js/demo/chart-pie-demo.js"></script>

</body>

</html>