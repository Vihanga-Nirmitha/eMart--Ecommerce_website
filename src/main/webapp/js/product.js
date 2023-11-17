const tagconElm = document.querySelector('#tag1')
const tagconElm2 = document.querySelector('#tag2')
const optElm = document.querySelectorAll('.sort1')
const btnElm = document.querySelector('button');
const formElm =document.querySelector('#filterForm')


// Log the URL to the console

const urlParams = new URLSearchParams(window.location.search);

const paramList = [urlParams.get('category1')===null? '': 'Electronics',urlParams.get('category2')===null? '': 'Sports',urlParams.get('category3')===null? '': 'Fashion',urlParams.get('category4')===null? '': 'Home & Garden',urlParams.get('category5')===null? '': 'Kid\'s Items']
paramList.forEach(function (e){
    if(e!=''){
        let newElm = document.createElement('div');
        newElm.innerHTML= `<div class="tag d-flex gap-2 rounded-pill">
                        <h6>${e}</h6>
                        <i class="bi bi-x-lg"></i>
                    </div>`;
        tagconElm.append(newElm);
    }
})
if(urlParams.get('min-price') === '' && urlParams.get('max-price') === ''){
}else {
    let newElm = document.createElement('div');
    newElm.innerHTML= `<div class="tag d-flex gap-2 rounded-pill">
                        <h6>$${urlParams.get('min-price')===''? '0': urlParams.get('min-price') }.00 - $${urlParams.get('max-price')===''? '0': urlParams.get('max-price') }.00</h6>
                        <i class="bi bi-x-lg"></i>
                    </div>`;
    tagconElm2.append(newElm);
}const  closeElm  = document.querySelectorAll('.bi-x-lg')
let urlSearchParams = new URLSearchParams(window.location.search);
closeElm.forEach((e)=>{
    e.addEventListener('click',function (){
        let text = e.parentElement.children[0].textContent;

        if(text==='Electronics'){
            urlSearchParams.delete('category1');
            window.history.replaceState({}, document.title, `${window.location.pathname}?${urlSearchParams}`);
        }
        else if(text==='Sports'){
            urlSearchParams.delete('category2');
            window.history.replaceState({}, document.title, `${window.location.pathname}?${urlSearchParams}`);
        }
       else  if(text==='Fashion'){
            urlSearchParams.delete('category3');
            window.history.replaceState({}, document.title, `${window.location.pathname}?${urlSearchParams}`);
        }
        else if(text==='Home & Garden'){
            urlSearchParams.delete('category4');
            window.history.replaceState({}, document.title, `${window.location.pathname}?${urlSearchParams}`);
        }
       else if(text==='Kid\'s Items'){
            urlSearchParams.delete('category5');
            window.history.replaceState({}, document.title, `${window.location.pathname}?${urlSearchParams}`);
        }
        else{
           urlSearchParams.set('min-price','');
            urlSearchParams.set('max-price','');
            window.history.replaceState({}, document.title, `${window.location.pathname}?${urlSearchParams}`);

        }
        window.location.href = window.location.href;
    });
})
let sortbyList =['Best match','Newest','Oldest','Price :low first','Price :high first','Most Popular']
function showSelected() {

    const dropdown = document.getElementById('myDropdown');
    const selectedIndex = dropdown.selectedIndex;
    urlSearchParams.set('sort', sortbyList[selectedIndex]);
    window.history.replaceState({}, document.title, `${window.location.pathname}?${urlSearchParams}`);
    window.location.href = window.location.href;
}


