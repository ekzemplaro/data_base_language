<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Hello extends CI_Controller {

	public function index()
	{
		$this->load->view('hello_message');
	}
}

/* End of file hello.php */
/* Location: ./application/controllers/hello.php */
