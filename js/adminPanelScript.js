function loadElements(){

    fetch('/api/userGetter.php')
        .then(response => response.json())
        .then((json )=> {

            const users = json.result;
            const select = document.getElementById("userToPromote");
            console.log(users);
            users.forEach((element) => {

                if(!element.admin){
                    let option = document.createElement("option");
                    option.setAttribute("value", element.username);
                    option.setAttribute("class", "userSelection");
                    option.innerHTML = element.username;
                    select.appendChild(option);
                }
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
                el.innerHTML = "L'utente non è stato promosso a causa di un errore. Si prega di riprovare";
            }
        });
}

document.addEventListener('DOMContentLoaded', function(event) {

    loadElements();
});