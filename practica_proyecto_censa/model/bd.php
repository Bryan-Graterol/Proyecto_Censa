<?php

class bd{

    private $db;
  
    public function __construct() {
      $this->db = new PDO('mysql:host=localhost;dbname=alquiler_carro', 'root', '');
      $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    public function CrearCuenta($nombre, $apellido, $ti, $gmail, $password) {
      // Generar un hash seguro de la contraseña
      $passwordHash = password_hash($password, PASSWORD_DEFAULT);
        
      // Insertar el nombre de usuario y la contraseña hash en la base de datos
      $query = $this->db->prepare("INSERT INTO usuario (nombre, apellido, ti, gmail ,password) VALUES (:nombre, :apellido, :ti, :gmail, :password)");
      $query->bindParam(':nombre', $nombre);
      $query->bindParam(':apellido', $apellido);
      $query->bindParam(':ti',$ti);
      $query->bindParam(':gmail',$gmail);
      $query->bindParam(':password', $passwordHash);
      $query->execute();
    }

    public function validarUsuario($nombre, $password) {

      $query = $this->db->prepare("SELECT * FROM usuario WHERE nombre = :nombre LIMIT 1");
      $query->bindParam(':nombre', $nombre);
      $query->execute();
      $result = $query->fetch(PDO::FETCH_ASSOC);
    
      if ($result !== false) {
        if (password_verify($password, $result['password'])) {
          
          // se crea la session de exito si todo esta correcto
          return $_SESSION['exito'] = true; 

        }else{
          $_SESSION['error'] =  "usuario y/o contraseña son incorrectas";
        }
  
      }else {
        $_SESSION['error'] = "No existe usuario";   
      }
    }

}