<?php


function createAlimentationContent(string $data): string{

    $renderer = new Renderer();
    $DBaccess = new DBaccess();
    $contentArray = ($DBaccess->getConnection() !== false ? $DBaccess->getRecipeQuery() : null);
    //$contentArray = null;
    if($contentArray !== null){

        $recipes = "";
        foreach($contentArray as $recipe){

            $recipes .= $renderer-> renderFile('alimentation/recipeTemplate', array(

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

function createSingleRecipeContent(string $data, string $id): string{

    $renderer = new Renderer();
    $DBaccess = new DBaccess();
    $contentArray = ($DBaccess->getConnection() !== false ? $DBaccess->getSingleRecipeQuery($id) : null);


    if($contentArray !== null){

        $data = $renderer-> render($data, array('recipetitle' => $contentArray['Nome']));
        $tmpIngredientsArray = explode("\n", $contentArray['Ingredienti']);
        $tmpMethodArray = explode("\n", $contentArray['Procedimento']);

        $ingredientsList = "";
        foreach($tmpIngredientsArray as $ingredient) {

            if (!empty($ingredient)) {

                $ingredientsList .= $renderer->renderFile('alimentation/singleIngredient',
                    array('singleingredient' => $ingredient));
            }
        }

        $methodList = "";

        foreach ($tmpMethodArray as $step){

            if (!empty($step)) {

                $methodList .= $renderer->renderFile('alimentation/singleStep',
                    array('step' => $step));
            }
        }

        $hintPresent = $contentArray['Consigli'] != "Nessun consiglio.";

        $recipe = $renderer->renderFile('alimentation/singleRecipeTemplate', array(
            'recipename' => $contentArray['Nome'],
            'path' => $contentArray['NomeImmagine'],
            'alt' => $contentArray['AltImmagine'],
            'ingredients' => $ingredientsList,
            'number' => $contentArray['Persone'],
            'method' => $methodList,
            'hintpresent' => $hintPresent,
            'hints' => $contentArray['Consigli']

        ));

        $data = $renderer-> render($data, array('singlerecipecontent' => $recipe));

    }else{

        $data = $renderer-> render($data, array());
    }

    return $data;
}
