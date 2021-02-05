<?php


function createAlimentationContent(string $data): string{

    $renderer = new Renderer();
    $DBaccess = new DBaccess();
    $DBaccess-> openDBConnection();
    $contentArray = ($DBaccess->getConnection() !== false ? $DBaccess->getRecipeQuery() : null);
    //$contentArray = null;
    if($contentArray !== null){

        $recipes = "";
        foreach($contentArray as $recipe){

            $recipes .= $renderer-> renderFile('recipeTemplate', array(

                'name' => $recipe['Nome'],
                'singlerecipe' => '/?r=singleRecipe&id='.$recipe['ID'],
                'path' => $recipe['NomeImmagine'],
                'alt' => $recipe['AltImmagine'],
                'recipead' => $recipe['Descrizione']
            ));
        }

        $data = $renderer-> render($data, array('recipes' => $recipes));

    }else{

        $data = $renderer-> render($data, array('recipes' => 'Nessuna ricetta'));
    }
    return $data;
}