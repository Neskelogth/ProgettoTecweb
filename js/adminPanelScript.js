function loadElements(){

    const select = document.getElementById("userToPromote");
    //const secondSelect = document.getElementById("userToDeclass");
    const alimentationSelect = document.getElementById("recipe");
    const newsSelect = document.getElementById("news");
    const newsTypesSelect = document.getElementById("type");
    const textArea = document.getElementById("postText");
    const postSelect = document.getElementById("post");

    select.innerHTML = "";
    //secondSelect.innerHTML = "";
    alimentationSelect.innerHTML = "";
    newsSelect.innerHTML = "";
    postSelect.innerHTML = "";
    textArea.innerHTML = "";

    //working
    fetch('/api/userGetter.php')
        .then(response => response.json())
        .then(json => {

            const users = json.result;
            users.forEach((element) => {

                let option = document.createElement("option");
                option.setAttribute("value", element.username);
                option.setAttribute("class", "userSelection");
                option.innerHTML = element.username;

                if(!element.admin){

                    select.appendChild(option);
                }/*else{

                    secondSelect.appendChild(option);
                }*/

            });
        });

    //working
    fetch('/api/recipeGetter.php')
        .then(response => response.json())
        .then(json => {

            const recipes = json.result;

            recipes.forEach((element) => {

                let option = document.createElement("option");
                option.setAttribute("value", element.id);
                option.innerHTML = element.name;
                alimentationSelect.appendChild(option)
            })

        });

    //working
    fetch('/api/newsGetter.php')
        .then(response => response.json())
        .then(json => {

            const news = json.result;

            news.forEach((element) => {

                let option = document.createElement("option");
                option.setAttribute("value", element.id);
                option.innerHTML = element.title;
                newsSelect.appendChild(option)
            })

        });

    //wokring
    fetch('/api/commentGetter.php')
        .then(response => response.json())
        .then(json => {

            const posts = json.result;

            posts.forEach((element) => {

                const option = document.createElement("option");
                option.setAttribute("value", element.id);
                const firstPart = element.text.slice(0, 20);
                option.innerHTML = (element.id + " - " + firstPart + "...");
                postSelect.appendChild(option);
            });

            textArea.innerHTML = posts[0].text;

        });

    //working
    fetch('/api/newsTypesGetter.php')
        .then(response => response.json())
        .then(json => {

            const types = json.result;

            types.forEach((element) => {

                const option = document.createElement("option");
                option.setAttribute("value", element.type);
                option.innerHTML = element.type;
                newsTypesSelect.appendChild(option);
            });
        });
}

//tested
function promote(){

    fetch('/api/promoteUser.php',{
        method: 'POST',
        credentials: 'same-origin',
        body: JSON.stringify({user: document.getElementById("userToPromote").value})
    })
        .then(response => response.json())
        .then(json => {

            if(!json.ok){

                const el = document.getElementById("errorMessage").setAttribute("display", "block");
                el.innerHTML = "L'utente non è stato promosso a causa di un errore. Si prega di riprovare.";
            }
            loadElements();
        });

}
//tested
/*
function declass(){

    fetch('/api/declassUser.php',{
        method: 'POST',
        credentials: 'same-origin',
        body: JSON.stringify({user: document.getElementById("userToDeclass").value})
    })
        .then(response => response.json())
        .then(json => {

            if(!json.ok){

                const el = document.getElementById("errorMessage").setAttribute("display", "block");
                el.innerHTML = "L'utente non è stato declassato a causa di un errore. Si prega di riprovare.";
            }
        });
    loadElements();
}
*/

//tested
function deleteRecipe(){

    fetch('/api/deleteRecipe.php',{
        method: 'POST',
        credentials: 'same-origin',
        body: JSON.stringify(
            {recipe: document.getElementById("recipe").value})
    })
        .then(response=> response.json())
        .then(json => {

            if(!json.ok){

                const el = document.getElementById("deleteRecipeError");
                el.classList.remove("nascosto");
                el.innerHTML = "La ricetta non è stata rimossa a causa di un errore. Si prega di riprovare.";
            }
            loadElements();
        })

}

//tested
function deleteNews(){

    fetch('/api/deleteNews.php',{
        method: 'POST',
        credentials: 'same-origin',
        body: JSON.stringify(
            {id: document.getElementById("news").value})
    })
        .then(response=> response.json())
        .then(json => {

            if(!json.ok){

                const el = document.getElementById("deleteNewsError");
                el.classList.remove("nascosto");
                el.innerHTML = "La news non è stata rimossa a causa di un errore. Si prega di riprovare.";
            }
            loadElements();
        })
}


function validateNewNews(){

    fetch('/api/newsSender.php',{
        method: 'POST',
        credentials: 'same-origin',
        body: JSON.stringify({

            type: document.getElementById("type").value,
            title: document.getElementById("newsTitle").value,
            text: document.getElementById("newsText").value,
            link: document.getElementById("newsLink").value
        })
    })
        .then(response => response.json())
        .then(json => {

            const el = document.getElementById("addNewsError");
            if(!json.ok){

                el.classList.remove("nascosto");
                el.innerHTML = "La news non è stata aggiunta a causa di un errore. Si prega di riprovare.";
            }else{

            }
        })
}

//tested
function findText(){

    const postId = document.getElementById("post").value;
    const textArea = document.getElementById("postText");

    fetch('/api/textFinder.php', {
        method: 'POST',
        credentials: 'same-origin',
        body: JSON.stringify({
            id: postId
        })
    })
        .then(response => response.json())
        .then(json => {

            textArea.innerHTML = json.result;
        });
}

function deletePost(){

    const postId = document.getElementById("post").value;
    document.getElementById("postText").innerHTML = "";

    fetch('/api/deletePost.php', {
        method: 'POST',
        credentials: 'same-origin',
        body: JSON.stringify({
            id: postId
        })
    })
        .then(response => response.json())
        .then(json => {

            const el = document.getElementById("deletePostError");
            if(!json.ok){

                el.classList.remove("nascosto");
            }else{
                el.classList.add("nascosto");
                loadElements();
            }
        });
}

//working
document.addEventListener('DOMContentLoaded', function(event) {

    loadElements();
});