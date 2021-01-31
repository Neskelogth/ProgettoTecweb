<?php

require_once "vendor/autoload.php";

class Parser{
	
	private $routes = array();
	private $notFoundCallback;

	public function __construct(){}

    public function addRoute(string $route, array $settings){ // {{basePage: 'sass', params: array}  {basePage: 'sass2', params: array}}


    }

    public function onNotFound($callback){

	    if (!is_callable($callback))
            return;

	    $this->notFoundCallback = $callback;
    }

    public function parse(): void {
	    $route = ($_GET['r'] ?? false);
	    if ($route === false) {
	        $routeExists = array_key_exists($route, $this->routes);
	        if (!$routeExists) {
	            call_user_func($this->notFoundCallback);
            } else {
	            $renderer = new Renderer();
            }
        }
    }

}