$(window).scroll(function() {
   var wH = $(window).height();
   var wS = $(this).scrollTop();
   var aR = $(document.getElementById('about_right')).height();
   var sR = $(document.getElementById('store_right')).height();
   var about_left = document.getElementById('about_left');
   var about_right = document.getElementById('about_right');
   var store_left = document.getElementById('store_left');
   var store_right = document.getElementById('store_right');
   if (wS > wH && wS < aR){
       about_left.classList.add('about_left_fixed');
       about_right.classList.add('about_right_fixed');
       about_left.style.top = "";
       store_left.classList.remove('store_left_fixed');
   }
   else if (wS < wH){
       about_left.classList.remove('about_left_fixed');
       about_right.classList.remove('about_right_fixed');
       about_left.style.top = "";
       store_left.classList.remove('store_left_fixed');
   } 
   else if (wS > aR && wS < aR+wH+80) {
	   about_left.classList.remove('about_left_fixed');
       about_right.classList.remove('about_right_fixed');	
       about_left.style.top = (aR - wH).toString() + 'px';
       store_left.classList.remove('store_left_fixed');
   }
   else if (wS > aR+wH+80){
   	   store_left.classList.add('store_left_fixed');
   }
});
$("#about_button").click(function() {
	$('html,body').animate({
        scrollTop: $("#about").offset().top},
        'slow');
});
$("#store_button").click(function() {
	$('html,body').animate({
        scrollTop: $("#store").offset().top},
        'slow');
});