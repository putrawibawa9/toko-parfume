<?php 
    require_once 'header.php';
    require_once 'Smartphone.php';
?>

<?php
$kode_smartphone = $_GET['kode_smartphone'];


$data = new Smartphone;
$smartphoneIndividu = new Smartphone;

$smartphone = $smartphoneIndividu->viewEachSmartphone($kode_smartphone);
// $result= $data->readTwoTablepart2($id_binatang);

if(isset($_POST['submit'])){

    $edit = new Smartphone;
    $result = $edit->editSmartphone($_POST);
    
    //check the progress
    if ($result){
        echo "
            <script>
            alert('data berhasil diubah');
            document.location.href = 'index.php';
            </script>
        ";
    }else{
        echo " <script>
        alert('data gagal diubah');
        document.location.href = 'index.php';
        </script>
    ";

    }

}

?>
<div class="container">
  <div class="row">
    <div class="col-12 p-3 bg-white">
        <h3>Edit smartphone</h3>


        <form method="post" enctype="multipart/form-data">

        <input type="hidden" name="kode_smartphone" value="<?= $kode_smartphone ?>;">


    
            <div class="mb-3">
                <label class="form-label"> Seri smartphone</label>
                <input type="text" name="seri_smartphone" class="form-control" value="<?= $smartphone['seri_smartphone']?>">
            </div>

            <div class="mb-3">
        <select class="form-select" name="merk_smartphone" required>
            <option value="<?= $smartphone['merk_smartphone'] ?>"><?= $smartphone['merk_smartphone'] ?></option>
            <option value="iphone">Iphone</option>
                <option value="samsung">Samsung</option>
                <option value="xiaomi">Xiaomi</option>
                <option value="oppo">Oppo</option>
                <option value="vivo">Vivo</option>
        </select>
    </div>

            <div class="mb-3">
                <label class="form-label">Ukuran Layar</label>
                <input type="text" name="ukuran_layar" class="form-control" value="<?= $smartphone['ukuran_layar']?>">
            </div>

            <div class="mb-3">
                <label class="form-label"> Kamera Depan</label>
                <input type="text" name="kamera_depan" class="form-control" value="<?= $smartphone['kamera_depan']?>">
            </div>

            <div class="mb-3">
                <label class="form-label">Kamera Belakang</label>
                <input type="text" name="kamera_belakang" class="form-control" value="<?= $smartphone['kamera_belakang']?>">
            </div>

            <div class="mb-3">
                <label class="form-label"> Tanggal Launching smartphone</label>
                <input type="date" name="tanggal_launching_smartphone" class="form-control" value="<?= $smartphone['tanggal_launching_smartphone']?>">
            </div>
        

            <a href="index.php" class="btn btn-danger" >Back</a>
            <button type="submit" class="btn btn-primary" name="submit" >Save</button>
        </form>
    </div>
  </div>
</div>


<?php require_once 'footer.php';?>

<script type="text/javascript">
  $('.nav-link').removeClass('active');
  $('.menu-binatang').addClass('active');
</script>
