<?php

require_once "vendor/autoload.php";

class Parser{
	
	private $routes = array();
	private $routesVariables = array();
	private $notFoundCallback;

	public function __construct(){}

    public function addRoute(string $route, callable $callback, array $rendererVariables = array()){
        $this->routes[$route] = $callback;
        $this->routesVariables[$route] = $rendererVariables;
    }

    public function onNotFound(callable $callback){

	    $this->notFoundCallback = $callback;
    }

    public function parse(): void {
	    $route = ($_GET['r'] ?? false);

	    if ($route !== false) {

            $routeExists = array_key_exists($route, $this->routes);
            if (!$routeExists) {
                call_user_func($this->notFoundCallback);
            } else {
                $renderer = new Renderer();
                $data = $renderer->renderFile($route, $this->routesVariables[$route]);
                $data = call_user_func($this->routes[$route], $data);
                echo Renderer::clean($data);
                //secho ($data);
            }
        }
    }

}