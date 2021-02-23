<?php

namespace App\Models;

use CodeIgniter\Model;

class Favorite_model extends Model
{
    protected $table = 'favorites';
    public function getFavByUserId($userEmail)
    {
        return $this->db->table($this->table)->getWhere(['email' => $userEmail])->getResultArray();
    }
    public function updateFavorite($data)
    {
        $res=$this->db->table($this->table)->getWhere($data)->getResultArray();
        if ($res === []) {


            return ['result' => $this->db->table($this->table)->insert($data), 'message' => 'add '];
        } else {
            return  ['result' => $this->db->table($this->table)->delete($data), 'message' => 'delete'];
        }
    }
}
