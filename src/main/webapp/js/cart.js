const subElm = document.querySelector("#subtotal h5");
const totalElm = document.querySelector("#subtotal h4");
const grosElm = document.querySelector("#total h4");
const checkElm =document.querySelectorAll(".form-check-input");
const trashElm = document.querySelectorAll(".bi-trash")



checkElm.forEach((e)=>{
   e.addEventListener(`click`,()=>{
      var total =0;
      var itemCount = 0;
      checkElm.forEach(function (e){
         if(e.checked){
            itemCount = itemCount + parseInt(e.parentElement.parentElement.children[4].children[0].children[1].value)
            var price = e.parentElement.parentElement.children[3].children[0].innerText;
            total = total + parseFloat(price.substring(1))
         }
         totalElm.innerHTML = "$"+total.toFixed(2);
         grosElm.innerHTML = "$"+(total +29.49).toFixed(2);

      });
      subElm.innerHTML="Subtotal ("+itemCount+" items)"
   })
});

trashElm.forEach((e)=>{

   e.addEventListener('click',()=>{
     var elemnt_id =  e.parentElement.parentElement.parentElement.id;

    deleteItem(elemnt_id);
   })

})
function deleteItem(itemid) {

    const currentURL =  window.location.origin + window.location.pathname;
    var form = document.createElement('form');
    form.action = currentURL;


    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'itemid';
    input.value = itemid;
    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
}