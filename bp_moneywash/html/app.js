

var circle = new ProgressBar.Circle('#progress', {
  strokeWidth: 7,
  color: '#8fc92b',
  duration: 1000,
  easing: 'easeInOut',
  trailColor: '#1b1b1943',
   trailWidth: 11
  
});
var done = false;
var aktif = false;
window.addEventListener("message", function (event) {   
  
  if (event.data.action == "open"){
     $('.moneymain').fadeIn(500);
     $('#yourmoney').html('$'+ formatMoney(event.data.blackmoney));
      givinmoney = Number(event.data.blackmoney) * Number(event.data.factor)
      playermoney = Number(event.data.blackmoney)
      selectimer = Number(event.data.timer);
     $('#givinmoney').html('$'+ formatMoney(givinmoney));

  

     
  
      
  }
  
  
});

function writetext(){

  interval = setInterval(function() {
    var value = Math.round(circle.value() * 100);
    if (value == 100) {
     
      done = true;
      $('.progresstext').html('DONE..');
      clearInterval(interval);
   
      circle.animate(0, {duration:0});
      setTimeout(function(){
       
        
        $('.moneymain').fadeOut(500);
        $('.moneyprogressbarpart').fadeOut(500);
        // done = false;
       
        $.post('https://bp_moneywash/done', JSON.stringify({givinmoney: givinmoney, playermoney: playermoney }));
        $('.progresstext').html('');
        aktif = false;
      }, 1000);
      
    }

     if (done == false){
      if (value === 0) {
        $('.progresstext').html('');
      } else {
        $('.progresstext').html(value+' %');
      }
     }
    
  }, 0);
}

$(document).ready(function(){
  $(".moneycentermainbutton").click(function(){

    if (playermoney != 0 ){
      done = false;
      aktif = true;
      $('.moneyprogressbarpart').fadeIn(500);
      writetext();
      
      circle.animate(1, {duration:Number(selectimer)});
    }
 
  });
  $(".moneycentermainbutton2").click(function(){
    var value = Math.round(circle.value() * 100);
    
    if (value < 100) {
      done = true;
      aktif = false;
      clearInterval(interval);
      circle.animate(0, {duration:0});
      $('.moneyprogressbarpart').fadeOut(500);
      $('.progresstext').html('CANCEL');
      
    }
   
    
    
  });

  
});

function formatMoney(number, decPlaces, decSep, thouSep) {
  decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces,
  decSep = typeof decSep === "undefined" ? "." : decSep;
  thouSep = typeof thouSep === "undefined" ? "," : thouSep;
  var sign = number < 0 ? "-" : "";
  var i = String(parseInt(number = Math.abs(Number(number) || 0).toFixed(decPlaces)));
  var j = (j = i.length) > 3 ? j % 3 : 0;

  return sign +
      (j ? i.substr(0, j) + thouSep : "") +
      i.substr(j).replace(/(\decSep{3})(?=\decSep)/g, "$1" + thouSep) +
      (decPlaces ? decSep + Math.abs(number - i).toFixed(decPlaces).slice(2) : "");
}


document.onkeyup = function(data) {
    
  if ( data.which == 27) {     
    if (aktif == false){
      $('.moneymain').fadeOut(500);
      $('.moneyprogressbarpart').fadeOut(500);
      $.post('https://bp_moneywash/exit', JSON.stringify({}));
    }
  }
}