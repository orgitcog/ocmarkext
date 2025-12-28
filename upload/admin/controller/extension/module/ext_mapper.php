<?php
/**
 * Extension Mapper & Recommender
 * 
 * Lists, maps, and recommends OpenCart extensions by functionality
 */
class ControllerExtensionModuleExtMapper extends Controller {
    private $error = array();
    
    public function index() {
        $this->load->language('extension/module/ext_mapper');
        
        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('setting/setting');
        
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('module_ext_mapper', $this->request->post);
            
            $this->session->data['success'] = $this->language->get('text_success');
            
            $this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true));
        }
        
        // Load model
        $this->load->model('extension/module/ext_mapper');
        
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        
        $data['entry_status'] = $this->language->get('entry_status');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        
        $data['breadcrumbs'] = array();
        
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
        );
        
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true)
        );
        
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/ext_mapper', 'user_token=' . $this->session->data['user_token'], true)
        );
        
        $data['action'] = $this->url->link('extension/module/ext_mapper', 'user_token=' . $this->session->data['user_token'], true);
        $data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=module', true);
        
        // Get extension list
        $data['extensions'] = $this->model_extension_module_ext_mapper->getExtensions();
        
        // Get categories
        $data['categories'] = $this->model_extension_module_ext_mapper->getCategories();
        
        // Get use cases
        $data['use_cases'] = $this->model_extension_module_ext_mapper->getUseCases();
        
        if (isset($this->request->post['module_ext_mapper_status'])) {
            $data['module_ext_mapper_status'] = $this->request->post['module_ext_mapper_status'];
        } else {
            $data['module_ext_mapper_status'] = $this->config->get('module_ext_mapper_status');
        }
        
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        
        $this->response->setOutput($this->load->view('extension/module/ext_mapper', $data));
    }
    
    public function install() {
        $this->load->model('extension/module/ext_mapper');
        $this->model_extension_module_ext_mapper->install();
    }
    
    public function uninstall() {
        $this->load->model('extension/module/ext_mapper');
        $this->model_extension_module_ext_mapper->uninstall();
    }
    
    public function getRecommendations() {
        $this->load->language('extension/module/ext_mapper');
        $this->load->model('extension/module/ext_mapper');
        
        $json = array();
        
        if (isset($this->request->get['use_case_id'])) {
            $use_case_id = $this->request->get['use_case_id'];
            $recommendations = $this->model_extension_module_ext_mapper->getRecommendations($use_case_id);
            $json['recommendations'] = $recommendations;
        } else {
            $json['error'] = 'No use case specified';
        }
        
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    public function addExtension() {
        $this->load->language('extension/module/ext_mapper');
        $this->load->model('extension/module/ext_mapper');
        
        $json = array();
        
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            $data = $this->request->post;
            $extension_id = $this->model_extension_module_ext_mapper->addExtension($data);
            
            if ($extension_id) {
                $json['success'] = 'Extension added successfully';
                $json['extension_id'] = $extension_id;
            } else {
                $json['error'] = 'Failed to add extension';
            }
        }
        
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    protected function validate() {
        if (!$this->user->hasPermission('modify', 'extension/module/ext_mapper')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        
        return !$this->error;
    }
}
