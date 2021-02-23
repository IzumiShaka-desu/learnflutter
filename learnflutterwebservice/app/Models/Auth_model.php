<?php

namespace App\Models;

use CodeIgniter\Model;

class Auth_model extends Model
{
  protected $table = 'userlogin';
  public function login($email, $password)
  {
    $result = $this->db->table($this->table)->getWhere(['email' => $email, "password" => sha1($password)])->getRowArray();
    if ($result != NULL) {
      return [
        "message" => "login berhasil",
        "result" => true,
        'email' => $result['email'],
        'id' => $result['id'],

      ];
    } else {
      return [
        "message" => "login gagal",
        "result" => false,
        "data" => []
      ];
    }
  }

  public function register($email, $password)
  {

    $result = $this->db->table($this->table)->getWhere(['email' => $email])->getRowArray();
    if ($result != NULL) {
      return [
        'result' => false,
        'message' => 'email telah digunakan',
      ];
    } else {
      $result = $this->db->table($this->table)->insert([
        "email" => $email,
        "password" => sha1($password)
      ]);
      if ($result) {
        $details = $this->db->table($this->table)->getWhere(['email' => $email, "password" => sha1($password)])->getRowArray();

        return [
          'result' => true,
          'message' => 'register berhasil tunggu sesaat ',
          'email' => $details['email'],
          'id' => $details['id'],
        ];
      } else {
        return [
          'result' => true,
          'message' => 'register gagal',
        ];
      }
    }
  }
}
