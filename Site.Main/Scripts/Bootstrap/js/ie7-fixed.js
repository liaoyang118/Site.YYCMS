/* =========================================================
Fix height of Carousel
============================================================ */

function fix_carousel_height(){
	child=jQuery(".feature-news").children();
	max_height=jQuery(".feature-news li:first-child").height();
	jQuery.each( child, function(){
		 if(jQuery(this).height() > max_height){
			 max_height=jQuery(this).height();
		 }
	});	
	jQuery.each( child, function(){
		 jQuery(this).height(max_height);
	});	
}
jQuery(document).ready(function(){
    fix_carousel_height();  
});
jQuery(window).resize(function() {
	 fix_carousel_height(); 
});