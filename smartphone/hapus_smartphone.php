<?php

require_once 'Smartphone.php';

$smartphone = new Smartphone;
$kode_smartphone = $_GET['kode_smartphone'];

if ($smartphone->deletesmartphone($kode_smartphone)){
    echo "<script>
            alert('data berhasil dihapus');
            document.location.href = 'index.php';
      </script>";
}else{
  echo "  <script>
            alert('data gagal dihapus');
            document.location.href = 'index.php';
            </script>";
}


?>