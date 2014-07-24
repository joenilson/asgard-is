<?php
/*
 * Copyright (C) 2014 Joe Nilson <joenilson@grupoism.com.do>
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
 * 
 */
namespace AsgardLib\Service;
/**
 * Description of CommonModelTableAbstractFactory
 * 
 * This code is based on the Zend Framework 2 ‘Cheat Sheet’ : Zend\Db post
 * from samsonasik:
 * http://samsonasik.wordpress.com/2013/01/15/zend-framework-2-cheat-sheet-zenddb/
 * 
 * @author Joe Nilson <joenilson@grupoism.com.do>
 */
use Zend\ServiceManager\AbstractFactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class CommonModelTableAbstractFactory implements AbstractFactoryInterface{
    public function canCreateServiceWithName(ServiceLocatorInterface $locator, $name, $requestedName)
    {
        return (substr($requestedName, -5) === 'Table');
    }
 
    public function createServiceWithName(ServiceLocatorInterface $locator, $name, $requestedName)
    {
        $db = $locator->get('Zend\Db\Adapter\Adapter');
        $tablemodel = new $requestedName;
        $tablemodel->setDbAdapter($db);
         
        return $tablemodel;
    }
}
