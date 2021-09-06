<?php
    // require 'autoload.php';

    // use system\session;
    // use system\user;
    // use system\input;
    // use system\website;

    // $session = new session;
    // $website = new website;
    // $website->start();

    require 'config.php';
    require 'core/database.php';
    require "drivers/".$db_connection.'_database.php';

    $dbClassName = $db_connection.'_database';
    $db = new $dbClassName;

    // $users = $db->get('user', 10);
    // foreach( $users as $user ){
    //     echo $user->username. '<br>';
    // }

    $users = $db->table('user')->get();
    $db->table('user')
        // ->insert([
        //     'username' => 'adffdsfsd',
        //     'password' => '435434',
        //     'fullname' => 'afagg',
        //     'email' => 'asdfafss@gmail.com'
        // ]);
        // ->delete(1);
        ->update(
            6,   //id
            [
                'title' => 'my web',               //data
                'content' => 'welcome to my web'   
            ]
            );