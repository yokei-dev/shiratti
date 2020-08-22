$(function(){
var getHours = new Date().getHours();
if((getHours >= 5) && (getHours < 10)) { $('.full-page').removeClass('night').addClass('morning'); }
else if( (getHours >= 10) && (getHours < 16) ) { $('.full-page').removeClass('morning').addClass('noon'); }
else if( (getHours >= 16) && (getHours < 18) ) { $('.full-page').removeClass('noon').addClass('afternoon'); }
else if( (getHours >= 18) || (getHours < 5) ) { $('.full-page').removeClass('afternoon').addClass('night'); }
});
