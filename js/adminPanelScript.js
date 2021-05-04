function loadElements(){

    const select = document.getElementById("userToPromote");
    //const secondSelect = document.getElementById("userToDeclass");
    const alimentationSelect = document.getElementById("recipe");
    const newsSelect = document.getElementById("news");
    const newsTypesSelect = document.getElementById("type");

    select.innerHTML = "";
    //secondSelect.innerHTML = "";
    alimentationSelect.innerHTML = "";
    newsSelect.innerHTML = "";

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

    fetch('/api/newsGetter.php')
        .then(response => response.json())
        .then(json => {

            const news = json.result;
            console.log(news);
            news.forEach((element) => {

                let option = document.createElement("option");
                option.setAttribute("value", element.id);
                option.innerHTML = element.title;
                newsSelect.appendChild(option)
            })

        });

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

document.addEventListener('DOMContentLoaded', function(event) {

    loadElements();
});

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

            if(!json.ok){

                const el = document.getElementById("addNewsError");
                el.classList.remove("nascosto");
                el.innerHTML = "La news non è stata aggiunta a causa di un errore. Si prega di riprovare.";
            }
        })
}