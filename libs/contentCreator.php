<?php


function createAlimentationContent(string $data): string{

    $renderer = new Renderer();
    $DBaccess = new DBaccess();
    $contentArray = ($DBaccess->getConnection() !== false ? $DBaccess->getRecipeQuery() : null);

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

function createNewsContent(string $data, string $type): string{

    $renderer = new Renderer();
    $DBaccess = new DBaccess();
    $contentArray = ($DBaccess-> getConnection() !== false ? $DBaccess->getNewsQuery($type) : null);

    $newsList = "";
    $linkPresent = false;

    if($contentArray !== null){

        foreach ($contentArray as $element){

            $linkPresent = $element['link'] !== '';

            $newsList .= $renderer-> renderFile('news/newsTemplate', array(

                'newstitle' => $element['Titolo'],
                'type' => $element['Tipo'],
                'text' => $element['Testo'],
                'linkpresent' => $linkPresent,
                'link' => $element['link']
            ));
        }

    }else{

        $newsList = $renderer-> renderFile('news/newsTemplate', array(
           'text' => "Nessuna notizia trovata",
            'Linkpresent' => $linkPresent
        ));
    }

    $data = $renderer->render($data, array(
        'news' => $newsList
    ));

    return $data;
}

function createNavMenuNews(string $data, string $type): string{

    $renderer = new Renderer();

    $menuItemAll = $renderer->renderFile('news/singleNavElement', array(
       'getlink' => '/?r=news',
       'navtext' => '%%Top news%%'
    ));

    $menuItemWorkout = $renderer->renderFile('news/singleNavElement', array(
        'getlink' => '/?r=news&type=workout',
        'navtext' => '%%Workout news%%'
    ));

    $menuItemAlimentation = $renderer->renderFile('news/singleNavElement', array(
        'getlink' => '/?r=news&type=alimentazione',
        'navtext' => 'Alimentazione %%news%%'
    ));

    $menuItemSite = $renderer->renderFile('news/singleNavElement', array(
        'getlink' => '/?r=news&type=sito',
        'navtext' => '%%News%% del sito'
    ));


    $menuItemAllNonLink = $renderer->renderFile('news/nonLinkNavElement', array(
        'text' => '%%Top news%%'
    ));

    $menuItemWorkoutNonLink = $renderer->renderFile('news/nonLinkNavElement', array(
        'text' => '%%Workout news%%'
    ));

    $menuItemAlimentationNonLink = $renderer->renderFile('news/nonLinkNavElement', array(
        'text' => 'Alimentazione %%news%%'
    ));

    $menuItemSiteNonLink = $renderer->renderFile('news/nonLinkNavElement', array(
        'text' => '%%News%% del sito'
    ));

    $navList = "";

    if($type == "All"){

        $navList .= $menuItemAllNonLink;
        $navList .= $menuItemWorkout;
        $navList .= $menuItemAlimentation;
        $navList .= $menuItemSite;
    }

    if($type == "sito"){

        $navList .= $menuItemAll;
        $navList .= $menuItemWorkout;
        $navList .= $menuItemAlimentation;
        $navList .= $menuItemSiteNonLink;
    }

    if($type == "workout"){

        $navList .= $menuItemAll;
        $navList .= $menuItemWorkoutNonLink;
        $navList .= $menuItemAlimentation;
        $navList .= $menuItemSite;
    }

    if($type == "alimentazione"){

        $navList .= $menuItemAll;
        $navList .= $menuItemWorkout;
        $navList .= $menuItemAlimentationNonLink;
        $navList .= $menuItemSite;
    }

    $data = $renderer->render($data, array(
       'navnews' => $navList
    ));


    return $data;
}