<?php
require_once "connect.php";
class Smartphone extends Connect{
    
    public function readSmartphone(){
        $conn = $this->getConnection();
        $query = "SELECT * FROM tb_smartphone";  
        $result = $conn->query($query);
        $mobil = $result->fetchAll();
        return $mobil;
        }

        public function viewEachSmartphone($kode_smartphone){
            $conn = $this->getConnection();
            $query = "SELECT * FROM tb_smartphone WHERE kode_smartphone= $kode_smartphone";
            $result = $conn->query($query);
            $kategori = $result->fetch();
            return $kategori;
        }
    
   

    public function addSmartphone($data){
        $conn = $this->getConnection();
        $seri_smartphone = $data['seri_smartphone'];
        $merk_smartphone = $data['merk_smartphone'];
        $ukuran_layar = $data['ukuran_layar'];
        $kamera_depan = $data['kamera_depan'];
        $kamera_belakang = $data['kamera_belakang'];
        $tanggal_launching_smartphone = $data['tanggal_launching_smartphone'];
    


        $query = "INSERT INTO tb_smartphone VALUES 
        ('',?,?,?,?,?,?)";
    
        $stmt = $conn->prepare($query);
    
        $stmt->bindParam(1,$seri_smartphone);
        $stmt->bindParam(2,$merk_smartphone);
        $stmt->bindParam(3,$ukuran_layar);
        $stmt->bindParam(4,$kamera_depan);
        $stmt->bindParam(5,$kamera_belakang);
        $stmt->bindParam(6,$tanggal_launching_smartphone);
        $stmt->execute();
        return true;
    }


    public function editSmartphone($data){
        $conn = $this->getConnection();
        $kode_smartphone = $data['kode_smartphone'];
        $seri_smartphone = $data['seri_smartphone'];
        $merk_smartphone = $data['merk_smartphone'];
        $ukuran_layar = $data['ukuran_layar'];
        $kamera_depan = $data['kamera_depan'];
        $kamera_belakang = $data['kamera_belakang'];
        $tanggal_launching_smartphone = $data['tanggal_launching_smartphone'];

        $query = "UPDATE tb_smartphone SET
        seri_smartphone = ?,
        merk_smartphone = ?,
        ukuran_layar = ?,
        kamera_depan = ?,
        kamera_belakang = ?,
        tanggal_launching_smartphone = ?
        WHERE kode_smartphone = ?
        ";
             $stmt = $conn->prepare($query);
             $stmt->bindParam(1,$seri_smartphone);
             $stmt->bindParam(2,$merk_smartphone);
             $stmt->bindParam(3,$ukuran_layar);
             $stmt->bindParam(4,$kamera_depan);
             $stmt->bindParam(5,$kamera_belakang);
             $stmt->bindParam(6,$tanggal_launching_smartphone);
             $stmt->bindParam(7,$kode_smartphone);
                $stmt->execute();
                return true;
    }


    public function deletesmartphone($kode_smartphone){
        $conn = $this->getConnection();
        $query = "DELETE FROM tb_smartphone WHERE kode_smartphone = $kode_smartphone";
        $result = $conn->exec($query);
        return $result;
}

}
?>