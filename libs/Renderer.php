<?php

use \Gobie\Regex\Wrappers\Pcre\PcreRegex;
require_once "vendor/autoload.php";

class Renderer{

    public function __construct(){}


    public function render(string $html, array $variables = array()): string {

        $data = $this->replaceInclude(self::removeComments($html));
        $this->replaceBlocks($data);
        $this->replaceVariables($data, $variables);
        return $data;
    }

    public function renderFile(string $file, array $variables = array()): string{

        return $this-> render(file_get_contents('html/' . $file  . '.xhtml'), $variables);
    }

    private static function removeComments(string $data): string {

        $matches = PcreRegex::getAll("/<!--.*-->/", $data);

        foreach (($matches[0] ?? array()) as $match) {
            $data = str_replace($match, '', $data);
        }
        return $data;
    }

    private function replaceInclude(string $data): string{

        $matches = PcreRegex::getAll("/<include(.)*Placeholder \/>/", $data);

        foreach (($matches[0] ?? array()) as $match) {
            $data = str_replace($match, $this->replaceInclude(self::removeComments(file_get_contents(
                    'html/' . strtolower(str_replace('<include', '', str_replace('Placeholder />', '', $match) . '.xhtml'))
            ))), $data);
        }

        return $data;
    }

    
    private function replaceBlocks(string &$data):void{

        //$matches = array();
        $matches = PcreRegex::getAll("/<blockSet[^\/<>]*Placeholder \/>/", $data);
        foreach (($matches[0] ?? array()) as $match) {

            $blockName = strtolower(str_replace('<blockSet', '', str_replace('Placeholder />', '', $match)));
            $blockBeginString = '<blockDef' . ucfirst($blockName) . 'Placeholder />';
            $blockBegin = strpos($data, $blockBeginString);
            if($blockBegin === false){
                continue;
            }
            $blockEndString = '<blockEndPlaceholder />';
            $blockEnd = strpos($data, $blockEndString, $blockBegin);
            if($blockEnd === false){
                continue;
            }
            $codeToReplace = substr($data, $blockBegin + strlen($blockBeginString), $blockEnd - $blockBegin - strlen($blockBeginString));
            $data = str_replace('<blockSet' . ucfirst($blockName) . 'Placeholder />', $codeToReplace, $data);
            $data = str_replace($blockBeginString . $codeToReplace . '<blockEndPlaceholder />', '', $data);
        }
    }

    private function replaceVariables(string &$data, array $variables): void{

        $matches = PcreRegex::getAll("/<[^\/<>]*Placeholder \/>/", $data);
        foreach (($matches[0] ?? array()) as $match) {

            $variableName = strtolower(str_replace('<', '', str_replace('Placeholder />', '', $match)));
            $data = str_replace($match, ($variables[$variableName] ?? ''), $data);
        }
    }

}