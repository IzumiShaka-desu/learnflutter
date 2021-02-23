<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;

class Favorite extends ResourceController
{
  protected $modelName = 'App\Models\Favorite_model';
  protected $format = 'json';
  function index()
  {
    $data = $this->model->findAll() ?? [];

    return $this->respond($data, 200);
  }
  public function byUserEmail($userEmail=null)
  {
    if ($userEmail!==NULL) {
      $response = $this->model->getFavByUserId($userEmail);
        return $this->respond($response??[], 200);
    }
  }

  public function update($userEmail = NULL)
  {
    
      $data = [
        "video_id" => $this->request->getPost('video_id'),
        "email" => $userEmail,
      ];
      $result=$this->model->updateFavorite($data);
    if ($result['result']) {
      $response = [
        'status' => 200,
        'error' => false,
        'data' => ['message' => 'successfull '.$result['message'].' fav']
      ];
      return $this->respond($response, 200);
    } else {
      $response = [
        'status' => 500,
        'error' => true,
        'data' => ['message' => 'cannot update fav']
      ];
      return $this->respond($response, 500);
    }
  }
}
