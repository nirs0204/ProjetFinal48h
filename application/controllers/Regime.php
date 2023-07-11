<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Regime extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

    public function regimeForm() {
        $this->load->view('pages/insertion_regime');
    }

    public function exerciceForm() {
        $this->load->view('pages/insertion_exercice');
    }

	public function menuForm() {
        $this->load->view('pages/insertion_menu');
    }
	
	public function menuList() {
        $this->load->view('pages/liste_menu');
    }

    public function regimeEdit() {
        $this->load->view('pages/modification_regime');
    }

    public function activiteEdit() {
        $this->load->view('pages/modification_regime');
    }

	public function chart() {
        $this->load->view('pages/chartjs');
    }

	public function chartData() {
        $this->load->view('inc/chartjs');
    }

	public function login() {
        $this->load->view('pages/login');
    }

	public function inscription() {
        $this->load->view('pages/inscription');
    }

	public function details() {
        $this->load->view('pages/details');
    }

	/////////////////////////////////////////////////////////
	public function evolution() {
        $this->load->view('pages/evolution_client');
    }
}
