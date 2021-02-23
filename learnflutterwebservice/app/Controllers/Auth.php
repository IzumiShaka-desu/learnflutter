<?php namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;

class Auth extends ResourceController{
    protected $format='json';
        protected $modelName='App\Models\Auth_model';
        function index(){
            return $this->respond('',404);
        }
        public function login(){
            $email=$this->request->getPost('email');
            $password=$this->request->getPost('password');
            $validation =  \Config\Services::validation();
            $data=[
                'email'=>$email,
                'password'=>$password
            ];
            if($validation->run($data,'auth')==FALSE){
                $response = [
                    'status' => 500,
                    'error' => true,
                    'data' => $validation->getErrors(),
                ];
            }
             else{   
                 $result=$this->model->login($email,$password);
                $response = [
                    'status' => 200,
                    'error' => false,
                    'data' => $result,
                ];}
                return $this->respond($response, 200);
        }
        public function register(){
            $email=$this->request->getPost('email');
            $password=$this->request->getPost('password');
            $validation =  \Config\Services::validation();
            $data=[
                'email'=>$email,
                'password'=>$password
            ];
            if($validation->run($data,'auth')==FALSE){
                $response = [
                    'status' => 500,
                    'error' => true,
                    'data' => $validation->getErrors(),
                ];
            }
             else{   $result=$this->model->register($email,$password);
                $response = [
                    'status' => 200,
                    'error' => false,
                    'data' => $result,
                ];}
                return $this->respond($response, 200);
        }
}

?>