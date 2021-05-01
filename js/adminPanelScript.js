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

    fetch('/api/promoteUser.php')
        .then(response => response.json())
        .then(json => {


        });
}

document.addEventListener('DOMContentLoaded', function(event) {

    loadElements();
});