<?php
    namespace App\controler;
    use Medoo\Medoo;
    class IndexController{
        // Index
        public static function data($c, $req, $rsp, $args){
            $user = $c->db->select("tbl_users",'*');
            $admin = $c->db->select("tbl_admins","*");
            // return var_dump($data);/
            // return json_encode($data);
            
                $c->view->render($rsp, 'data.html',[
                    'hasLogin'=>true,
                    'name'=>$_SESSION['name'],
                    'user'=>$user,
                    'admin'=>$admin
                ]);
            }
        public static function index($c, $req, $rsp, $args){
            $name = isset($_SESSION['name'])?$_SESSION['name']:null;
            $notNumber = isset($_SESSION['notNumber'])?true:null;
            // return var_dump($_SESSION);
            if($args['hasLogin'] == true){
                $c->view->render($rsp, 'index.html',[
                    'hasLogin'=>true,
                    'name'=>$name,
                    'notNumber'=>$notNumber
                ]);
            }else{
                $c->view->render($rsp, 'index.html',[
                    'hasLogin'=>false,
                    'name'=>$name
                ]);
            }
        }
        // enter login or register mode based on args
        public static function log($c, $req, $rsp, $args){
            $hasRegistered  = isset($_SESSION['hasRegistered']);
            unset($_SESSION['hasRegistered']);
            $c->view->render($rsp, 'login.html',[
                'mode'=>$args['data']
            ]);
            // return var_dump($args['data']);
        }
        // delete
        // public static function delete($c, $req, $rsp, $args){
        //     $data = $args['data']['id'];
        //     // return var_dump($data);
        //     $del = $c->db->delete('tbl_customers',[
        //         "ID_CUST" => $data
        //     ]);
        //     // return var_dump($del);
        // }

        // register post 
        public static function register($c, $req, $rsp, $args){
            // get data
            $data_reg = $args['data'];
            // hash password
            // return var_dump($data_reg);
            $pass = md5($data_reg['pass']);
            $no_split = preg_replace('/^0/', '', $data_reg['phone']);
            // return var_dump($no_split); 
            $number = '62'.$no_split.'@s.whatsapp.net';
            // insert new user
            $dAwal = $c->db->select('tbl_users',"email",[
                "email"=>$data_reg['email']
            ]);
            // return var_dump($dAwal == null);
            // if not exist
            if($dAwal == null){
                $d = $c->db->insert('tbl_users',[
                    "email"=>$data_reg['email'],
                    "first_name"=>$data_reg['firstName'],
                    "last_name"=>$data_reg['lastName'],
                    "number"=>$number,
                    "password_user"=>$pass
                ]);
                
                $hasRegistered = $_SESSION['hasRegistered'] = true;
                $mode = $_SESSION['mode'] = "login";

                return $rsp->withRedirect('/login');
            // if exist
            }else{
                // go back
                $c->view->render($rsp, 'login.html',[
                    'mode'=>"register",
                    "hasData" => true
                ]);
            }
        }
        // login post
        public static function login($c, $req, $rsp, $args){
            // get data
            $data_log = $args['data'];
            // hash password
            $pass = md5($data_log['pass']);
            // check the admin database
            $a = $c->db->select('tbl_admins','*',[
                "user_adm"=>$data_log['email'],
                'pass_adm'=>md5($data_log['pass'])
            ]);
            // Check the user database
            $d = $c->db->select('tbl_users','*',[
                "email"=>$data_log['email'],
                'password_user'=>md5($data_log['pass'])
            ]);
            
            // if not exist in admin database, check again to user database
            if($a == null){
                // if not exist in user database
                if($d == null){
                    $c->view->render($rsp, 'login.html',[
                        'mode'=>"login",
                        "notValidate" => true
                    ]);
                // if exist in user database
                }else{
                    // if add in number bot list, then can use API
                    $dSecVerif = $c->db->select('tbl_users',[
                        '[><]tbl_user_bots'=>'number'
                    ],'*',[
                        'tbl_user_bots.number'=>$d[0]['number']
                    ]);
                    //if not exist
                    if($dSecVerif == null){
                        $_SESSION['notNumber'] = true;
                    }
                    //if exist
                    else{
                    };

                    // go into index
                    $_SESSION['hasLogin'] = true;
                    $name = $_SESSION['name'] = $d[0]['first_name'];

                    return $rsp->withRedirect('/');
                }
            // if exist in admin database
            }else{
                $_SESSION['hasLogin'] = true;
                $name = $_SESSION['name'] = $a[0]['profile'];
                // return var_dump($name);
                return $rsp->withRedirect('/');
            }
            
        }
        public static function selectT1($c, $req, $rsp, $args){
            $data = $c->db->select("tbl_user_bots",'*');
            $columns = array(
                0=>'index',
            );
            $totalfilter = $totaldata = count($data);
            $limit = $req->getParam('length');
            $start = $req->getParam('start');
            $order = $req->getParam('order');
            $order = $columns[$order[0]['column']];
            $dir = $req->getParam('order');
            $dir = $dir[0]['dir'];

            $condition = [
                "LIMIT" => [$start, $limit],
            ];
            if(!empty($req->getParam('search')['value'])){
                $search = $req->getParam('search')['value'];
                $condition['OR'] =[
                    'tbl_user_bots.name[~]'=> '%'.$search.'%',
                    'tbl_user_bots.number[~]'=> '%'.$search.'%'
                ];
            }

            $showData = $c->db->select('tbl_user_bots','*',$condition);
            // var_dump($showData)
;            $data = array();

            if(!empty($showData)){
                $index = $req->getParam('start') + 1;
                foreach ($showData as $d){
                    $each['#'] = $index.'.';
                    $each['Fullname'] = $d['name'];
                    $each['Number'] = $d['number'];
                    $each['Action'] = 
                    '<button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#edit" data-bs-whatever="'.$d['id_bots'].'"><i class="bi bi-pencil-square"></i>&nbsp
                    Edit
                </button>
                <button class="btn btn-danger delete_items" data-bs-whatever="'.$d['id_bots'].'" id="delete" ><i class="bi bi-trash"></i>&nbsp;Delete</button>'
                ;
                    $data[] = $each;
                    $index++;
                }
            }

            $json_data = array(
                "draw"=>intval($req->getParam('draw')),
                "recordsTotal"=>intval($totaldata),
                "recordsFiltered"=>intval($totalfilter),
                "data"=>$data
            );
            echo json_encode($json_data);

        // // return var_
        }
        public static function selectT2($c, $req, $rsp, $args){
            $data = $c->db->select("tbl_users",[
                '[>]tbl_user_bots'=>'number'
            ],[
                'id_users',
                'first_name',
                'last_name',
                'number',
                'email',
                'password_user',
                'isBots' => Medoo::raw('CASE
                WHEN tbl_users.number = tbl_user_bots.number
                   THEN 1
                   ELSE 0
           END')
            ]);
            $columns = array(
                0=>'index',
            );

            $totalfilter = $totaldata = count($data);
            $limit = $req->getParam('length');
            $start = $req->getParam('start');
            $order = $req->getParam('order');
            $order = $columns[$order[0]['column']];
            $dir = $req->getParam('order');
            $dir = $dir[0]['dir'];

            $condition = [
                "LIMIT" => [$start, $limit],
            ];
            if(!empty($req->getParam('search')['value'])){
                $search = $req->getParam('search')['value'];
                $condition['OR'] =[
                    'tbl_users.first_name[~]'=> '%'.$search.'%',
                    'tbl_users.last_name[~]'=> '%'.$search.'%',
                    'tbl_users.number[~]'=> '%'.$search.'%',
                    'tbl_users.email[~]'=> '%'.$search.'%',
                ];
            }

            $showData = $c->db->select('tbl_users',[
                '[>]tbl_user_bots'=>'number'
            ],[
                'id_users',
                'first_name',
                'last_name',
                'number',
                'email',
                'password_user',
                'isBots' => Medoo::raw('CASE
                WHEN tbl_users.number = tbl_user_bots.number
                   THEN 1
                   ELSE 0
           END')
            ],$condition);
            // return var_dump($showData)
;            $data = array();

            if(!empty($showData)){
                $index = $req->getParam('start') + 1;
                foreach ($showData as $d){
                    $each['#'] = $index.'.';
                    $each['First_Name'] = $d['first_name'];
                    $each['Last_Name'] = $d['last_name'];
                    $each['Number'] = $d['number'];
                    $each['Email'] = $d['email'];
                    $each['isBots'] = $d['isBots'];
                //     $each['Action'] = 
                //     '<button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#edit" data-bs-whatever="'.$d['id_users'].'">
                //     Edit
                // </button>
                // <button class="btn btn-danger delete_items" data-bs-whatever="'.$d['id_users'].'" id="delete" >Delete Data</button>'
                // ;
                    $data[] = $each;
                    $index++;
                }
            }

            $json_data = array(
                "draw"=>intval($req->getParam('draw')),
                "recordsTotal"=>intval($totaldata),
                "recordsFiltered"=>intval($totalfilter),
                "data"=>$data
            );
            echo json_encode($json_data);

        // // return var_
        }
        public static function edit($c,$req,$rsp,$args){
            $data_edit = $args['data'];
            // return var_dump($data_edit);
            $update = $c->db->update('tbl_user_bots',[
                'name'=>$data_edit['edit_name'],
                'number'=>$data_edit['edit_number'],
            ],[
                "id_bots"=>$data_edit['id']
            ]);
            // console.log($data_edit);
        }
        public static function insert($c,$req,$rsp,$args){
            $data_insert = $args['data'];
            // return var_dump($data_insert);
            $insert = $c->db->insert('tbl_user_bots',[
                "name"=>$data_insert['name'],
                'number'=>$data_insert['number'],
            ]);
            // return var_dump();
            return $rsp->withJson(array('succes'=> true));
            // console.log($data_insert);
        }
    }
?>