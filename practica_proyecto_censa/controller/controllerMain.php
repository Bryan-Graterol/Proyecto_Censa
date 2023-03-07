<?php
include_once("model/bd.php");

class controllerPrincipal{
    
    public function home()
    {
        include_once("views/home.php");
    }
    
    public function Crear_cuenta()
    {
        $bd = new bd();
        
        if (isset($_POST['nombre']) && isset($_POST['apellido']) && isset($_POST['gmail']) && isset($_POST['ti']) && isset($_POST['password'])) {
            $nombre = $_POST['nombre'];
            $apellido = $_POST['apellido'];
            $email = $_POST['gmail'];
            $ti = $_POST['ti'];
            $password = $_POST['password'];
            
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                if (empty($_POST['nombre']) || empty($_POST['apellido']) || empty($_POST['gmail']) || empty($_POST['ti']) || empty($_POST['password'])) {
                    // código a ejecutar si alguna de las variables está vacía
                    $_SESSION['error'] = "Verifique que los campos no esten bacios";
                } else {
                    // código a ejecutar si todas las variables tienen valores
                    $_SESSION['exito'] = true;
                    $bd->CrearCuenta($nombre,$apellido,$ti,$email,$password);
                    include_once("views/home.php");
                }
            }
        }
        include_once("views/Crear_cuenta.php");
    }

    public function login()
    {
        # code...
        $bd = new bd();
        if(isset($_POST['username']) && isset($_POST['password'])) {
            $nombre = $_POST['username'];
            $password = $_POST['password'];
            $validacion = $bd->validarUsuario($nombre,$password);
            if ($validacion == $_POST['exito']=true) {
                echo "exito";
            }
        }
        include_once("views/login.php");
    }

}