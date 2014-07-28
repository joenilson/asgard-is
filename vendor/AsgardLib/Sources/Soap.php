<?php
/*
 * Copyright (C) 2014 Joe Nilson <joenilson@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace AsgardLib\Sources;

/**
 * Description of Soap
 *
 * @author Joe Nilson <joenilson@grupoism.com.do>
 */
class Soap {
    /**
        * 
        * @return \AsgardLib\Sources\Soap
        */
    public function __construct() {
        return $this;
    }

    /**
        * 
        * @param type $wsdl
        * @param type $options
        * @return \SoapClient
        */
    public function SoapConnection($wsdl,$options){
        ini_set('default_socket_timeout', 100000);
        $soap_auth = $this->SoapOptions($options);        
        try {
            $client = new \SoapClient($wsdl, $soap_auth);
            $connection = true;
        } catch (SoapFault $exception) {
            print_r($exception);
            $connection = false;
        }
        if ($connection){
            return $client;
        }else{
            
        }
    }
    
    /**
        * 
        * @param type $opts
        * @return type $soap_opts
        */
    private function SoapOptions($opts){
        $soap_opts = array (
            'login'=>(empty($opts['user']))?"":trim($opts['user']),
            'password'=>(empty($opts['password']))?"":trim($opts['password']),
            'encoding'=>(empty($opts['encoding']))?"UTF-8":trim($opts['encoding']),
            'connection_timeout'=>100000);
        return $soap_opts;
    }
            
}
