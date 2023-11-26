
const itemElm  = document.querySelectorAll('.number-input')


itemElm.forEach(function (e){
    // e.children[1].value = '1';
    let value = e.children[1].value;


    e.children[0].addEventListener('click', function (){
        if(value<=1)return
        value--;
        e.children[1].value = value;
    })

    e.children[2].addEventListener('click', function (){
        value++;
        e.children[1].value = value;
    })  ;

    e.children[1] = value;

})

