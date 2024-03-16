<?php 
    require_once 'header.php';
    require_once 'Smartphone.php';

if(isset($_POST['submit'])){
    $add = new Smartphone;

    $result =$add->addSmartphone($_POST);
    
    //check the progress
    if ($result){
        echo "
            <script>
            alert('data berhasil ditambah');
            document.location.href = 'index.php';
            </script>
        ";
    }else{
        echo " <script>
        alert('data gagal ditambah');
        document.location.href = 'index.php';
        </script>
    ";

    }

}
?>
<div class="container">
  <div class="row">
    <div class="col-12 p-3 bg-white">
        <h3>Tambah Smartphone</h3>


        <form method="post" enctype="multipart/form-data">

        <div class="mb-3">
                <label class="form-label"> Seri Smartphone</label>
                <input type="text" name="seri_smartphone" class="form-control">
            </div>
            

          
            <div class="mb-3">
                <label class="form-label"> Ukuran Layar</label>
                <input type="text" name="ukuran_layar" class="form-control">
            </div>

            <div class="mb-3">
        <select class="form-select" name="merk_smartphone" required>
        <option value="" disabled selected hidden>Select a smartphone brand</option>
                <option value="iphone">Iphone</option>
                <option value="samsung">Samsung</option>
                <option value="xiaomi">Xiaomi</option>
                <option value="oppo">Oppo</option>
                <option value="vivo">Vivo</option>
        </select>
    </div>
    
            <div class="mb-3">
                <label class="form-label">Kamera Depan</label>
                <input type="text" name="kamera_depan" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label"> Kamera Belakang</label>
                <input type="text" name="kamera_belakang" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label"> Tanggal Launching</label>
                <input type="date" name="tanggal_launching_smartphone" class="form-control">
            </div>
            
            <a href="index.php" class="btn btn-success" >Kembali</a>
            <button type="submit" class="btn btn-primary" name="submit" >Simpan</button>
        </form>
    </div>
  </div>
</div>


<?php require_once 'footer.php';?>


<script type="text/javascript">
  $('.nav-link').removeClass('active');
  $('.menu-binatang').addClass('active');
</script>