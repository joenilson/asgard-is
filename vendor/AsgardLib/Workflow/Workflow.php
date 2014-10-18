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

namespace AsgardLib\Workflow;

/**
 * Description of Workflow
 *
 * @author Joe Nilson <joenilson@gmail.com>
 */
class Workflow {
    /*
     * Return AsgardLib\Workflow
     */
    public function __construct() {
        return $this;
    }

    /*
     * @param type $wf array
     * @param type $step
     * @param type $time
     * @param type $status
     * @return workflowSuccess
     */    
    public function startWorkflow($wf,$step,$time,$status){
        if($step !== 1)
            return false;
        
    }
    
    public function stepWorkflow($wf,$step,$time,$status){
        
    }
    
    public function finishWorkflow($wf,$step,$time,$status){
        
    }
    
    private function controlStep($wf,$step){
        
    }
    
    private function controlTime($wf,$step,$time){
        
    }
    
    private function controlStatus($wf,$step,$time,$status){
        
    }
    
    private function controlNodes($wf,$step,$time,$status){
        
    }
}
