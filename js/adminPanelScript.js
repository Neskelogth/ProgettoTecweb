function loadElements(){

    const select = document.getElementById("userToPromote");
    const secondSelect = document.getElementById("userToDeclass");

    select.innerHTML = "";
    secondSelect.innerHTML = "";

    fetch('/api/userGetter.php')
        .then(response => response.json())
        .then((json )=> {

            const users = json.result;
            users.forEach((element) => {

                let option = document.createElement("option");
                option.setAttribute("value", element.username);
                option.setAttribute("class", "userSelection");
                option.innerHTML = element.username;

                if(!element.admin){

                    select.appendChild(option);
                }else{

                    secondSelect.appendChild(option);
                }

            });
        });

    fetch('/api/recipeGetter.php')
        .then(response => response.json())
        .then(json => {

            const recipes = json.result;
            const select = document.getElementById("recipe");

            recipes.forEach((element) => {

                let option = document.createElement("option");
                option.setAttribute("value", element.id);
                option.innerHTML = element.name;
                select.appendChild(option)
            })

        })
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
        });
    loadElements();
}

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

function deleteRecipe(){

    fetch('/spi/deleteRecipe')
}

document.addEventListener('DOMContentLoaded', function(event) {

    loadElements();
});