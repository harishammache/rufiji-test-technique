<?php
class IndexController extends CommonController{

    public function __construct(){
        parent::__construct();
        $this->module = 'home';
    }

    public function indexAction(){
        $this->layout['title']       = WEBSITE_TITLE;
        $this->layout['description'] = '';
        $this->layout['canonical']   = WEBSITE_URL;
        $this->layout['selected']    = 'home';

        parent::setViewInLayout('modules/' . $this->module .'/views/index.php');
    }
}
