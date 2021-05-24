function loadmenu(){

    if(window.innerWidth > 640){
        return;
    }
    document.getElementById('menu').classList.add('nascosto');
    document.getElementById('menuhamburger').classList.remove('nascosto');
    document.getElementById('menu').classList.remove('floatleft');
    document.getElementById('menuhamburger').classList.add('float');
}
window.addEventListener('resize',function(event){
    loadmenu();
})

function openmenu(){

    document.getElementById('menuhamburger').classList.add('nascosto');
    document.getElementById('menuhamburger').classList.remove('float');
    document.getElementById('close').classList.remove('nascosto');
    document.getElementById('close').classList.add('float');
    document.getElementById('menu').classList.remove('nascosto');

}

function closemenu(){

    document.getElementById('menuhamburger').classList.remove('nascosto');
    document.getElementById('menuhamburger').classList.add('float');
    document.getElementById('close').classList.add('nascosto');
    document.getElementById('close').classList.remove('float');
    document.getElementById('menu').classList.add('nascosto');
}