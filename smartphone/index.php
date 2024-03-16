<?php
require_once 'Smartphone.php'; 
require_once 'header.php'; 


$hasil = new Smartphone;
$smartphone = $hasil->readSmartphone();
?>


  
    
    <div class="container">
      <div class="row">
        <div class="col-12 p-3 bg-white">
          <h3>Smartphone</h3>
          <a href="tambah_smartphone.php" class="btn btn-primary  mb-3">Add</a>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th class="text-center">Kode Smartphone</th>
                    <th class="text-center">Seri Smartphone</th>
                    <th class="text-center">Merk Smartphone</th>
                    <th class="text-center">Ukuran Layar</th>
                    <th class="text-center">Kamera Depan</th>
                    <th class="text-center">Kamera Belakang</th>
                    <th class="text-center">Tanggal Launchling</th>
                    <th class="text-center">Actions</th>
                  </tr>
            </thead>
            <tbody>
              <?php foreach($smartphone as $row):?>
                <tr>
                  <td class="text-center" ><?=$row['kode_smartphone']?></td>
                  <td ><?=$row['seri_smartphone']?></td>
                  <td ><?=$row['merk_smartphone']?></td>
                  <td ><?=$row['ukuran_layar']?></td>
                  <td ><?=$row['kamera_depan']?></td>
                  <td ><?=$row['kamera_belakang']?></td>
                  <td ><?=$row['tanggal_launching_smartphone']?></td>
                   <td>
                    <a  href="edit_smartphone.php?kode_smartphone=<?=$row['kode_smartphone'];?>" class="btn btn-primary btn-sm ">Edit</a>
                    <a href="hapus_smartphone.php?kode_smartphone=<?=$row['kode_smartphone'];?>" class="btn btn-secondary btn-sm " onclick="return confirm('yakin?');">Delete</a>
                   </td>
                  </tr>
                  <?php endforeach; ?>
                </tbody>
        </table>
        <div>
          
          </div>
    </div>
  </div>
</div>



<?php require_once 'footer.php';?>

<?php require_once 'footer.php';?>
<script type="text/javascript">
  $('.nav-link').removeClass('active');
  $('.menu-binatang').addClass('active');
</script>
 
