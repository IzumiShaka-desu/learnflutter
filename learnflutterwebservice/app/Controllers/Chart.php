<?php namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;

class Chart extends ResourceController{
    protected $modelName = 'App\Models\Chart_model';
    protected $format = 'json';
    function index()
    {
        $data=$this->model->findAll();
        $decodedData=[];
        foreach($data as $item){
            $dataDecoded=json_decode($item["data"]);
            // $item['data']=$dataDecoded;
            // print_r(($dataDecoded->data));
            $item['data']=$dataDecoded->data;
            $item['total']=$dataDecoded->total;
            array_push($decodedData,$item);
        }
        return $this->respond($decodedData,200);
    }
}