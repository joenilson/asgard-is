<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
        $userData = $this->getServiceLocator()->get('userSessionData');
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        if($userPrefs[0]['lang'] != 'en'){
            $this->getViewHelper('HeadScript')->appendFile("/js/web/app/locales/app_locale_{$userPrefs[0]['lang']}.js","text/javascript");
            $this->getViewHelper('HeadScript')->appendFile("/js/extjs/locale/ext-lang-{$userPrefs[0]['lang']}.js","text/javascript");
        }
        return new ViewModel(array('username'=>$userData->realname));
    }
    
    protected function getViewHelper($helperName)
    {
    	return $this->getServiceLocator()->get('viewhelpermanager')->get($helperName);
    }
}
