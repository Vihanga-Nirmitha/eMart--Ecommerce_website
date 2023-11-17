const h6Elm = document.querySelectorAll('.get-rating h5')
const avgElm = document.querySelector('.rating h1');
const totalElm = document.querySelector('.rating h6');
const bar1Elm = document.querySelector('#bar1 h6');
const bar2Elm = document.querySelector('#bar2 h6');
const bar3Elm = document.querySelector('#bar3 h6');
const bar4Elm = document.querySelector('#bar4 h6');
const bar5Elm = document.querySelector('#bar5 h6');
const progElm1 =document.querySelector('#bar1 .bar');
const progElm2 =document.querySelector('#bar2 .bar');
const progElm3 =document.querySelector('#bar3 .bar');
const progElm4 =document.querySelector('#bar4 .bar');
const progElm5 =document.querySelector('#bar5 .bar');
let proglist = [progElm1,progElm2,progElm3,progElm4,progElm5];

const newElm1 = document.createElement('div')
const newElm2 = document.createElement('div')
const newElm3 = document.createElement('div')
const newElm4 = document.createElement('div')
const newElm5 = document.createElement('div')

const iconElm = document.querySelectorAll('#star-list i' );
let newElmlist = [newElm1,newElm2,newElm3,newElm4,newElm5];

let total = 0;
let count =0;
let rate1 = 0;
let rate2 = 0;
let rate3 = 0;
let rate4 = 0;
let rate5 = 0;

h6Elm.forEach(function (e){

    if((e.innerHTML) === "1")rate1++;
    if((e.innerHTML) === "2")rate2++;
    if((e.innerHTML) === "3")rate3++;
    if((e.innerHTML) === "4")rate4++;
    if((e.innerHTML) === "5")rate5++;
    count++
    total = total+ parseInt(e.innerHTML);
});
let ratelist = [rate5,rate4,rate3,rate2,rate1];
let avg = parseFloat((total/count)).toFixed(1);
avgElm.innerHTML=`${avg}`;
totalElm.innerHTML = `${count} Ratings`;
bar1Elm.innerHTML = `${rate5}`;
bar2Elm.innerHTML = `${rate4}`;
bar3Elm.innerHTML = `${rate3}`;
bar4Elm.innerHTML = `${rate2}`;
bar5Elm.innerHTML = `${rate1}`;

let i =0
proglist.forEach(function (e){

    newElmlist[i].innerHTML = `<div class="col-bar progress-bar " style="width: ${(ratelist[i]*100)/count}%"></div>`;
    e.append(newElmlist[i]);
    i++;
});
let index2 = 0
iconElm.forEach(function (e){
    index2++;
    if(index2 <= parseFloat((total/count))){
        e.classList.add('bi');
        e.classList.add('bi-star-fill');
    }
    else {
        if(index2-(parseFloat((total/count)))<1){
            e.classList.add('bi');
            e.classList.add('bi-star-half');
        }else {
            e.classList.add('bi');
            e.classList.add('bi-star');
        }

    }

});

