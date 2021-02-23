<?php namespace App\Models;

use CodeIgniter\Model;

class Chart_model extends Model{
    protected $table='chart';
    public function getChart()
    {
        return $this->findAll();
    }
   
    
}