/* =========================================================
Social icons hover
============================================================ */
jQuery(document).ready(function(){
   
    jQuery(".social-links a").mouseenter(function(){
        jQuery(this).find('img').fadeTo(300, 0);
    }).mouseleave(function(){
        jQuery(this).find('img').fadeTo(300, 1);
    });	
});
/* =========================================================
Fix css
============================================================ */
jQuery(document).ready(function(){
	jQuery("#top-nav ul li ul li:last-child").css("border-bottom","none");
	jQuery("#main-nav > li:last-child a").css("background","none");
	jQuery("#headline ul li:last-child").css("margin-right",0);
});
/* =========================================================
Create mobile menu
============================================================ */
function createMobileMenu(menu_id, mobile_menu_id){
    // Create the dropdown base
    jQuery("<select />").appendTo(menu_id);
    jQuery(menu_id).find('select').first().attr("id",mobile_menu_id);
    
    // Populate dropdown with menu items
    jQuery(menu_id).find('a').each(function() {        
        var el = jQuery(this);       
        
        var selected = '';
        if (el.parent().hasClass('current-menu-item') == true){
            selected = "selected='selected'";
        }        
        
        var depth = el.parents("ul").size();
        var space = '';
        if(depth > 1){
            for(i=1; i<depth; i++){
                space += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
            }
        }        
        
        jQuery("<option "+selected+" value='"+el.attr("href")+"'>"+space+el.text()+"</option>").appendTo(jQuery(menu_id).find('select').first());
    });
    jQuery(menu_id).find('select').first().change(function() {
        window.location = jQuery(this).find("option:selected").val();
    });    
}

jQuery(document).ready(function(){
    if(jQuery('#top-nav').length > 0){
        createMobileMenu('#top-nav','top-responsive-menu');	
    }
	 if(jQuery('#secondary-menu').length > 0){
        createMobileMenu('#secondary-menu','responsive-menu');	
    }
});
/* =========================================================
Dropdown menu
============================================================ */
jQuery(document).ready(function(){
	jQuery("#top-nav ul li").hover(function() {
		jQuery(this).find("ul").first().slideDown(300);
			}, function() {
		jQuery(this).find("ul").first().hide();
	});
	jQuery("#main-nav li").hover(function() {
		jQuery(this).find("ul").first().slideDown(300);
			}, function() {
		jQuery(this).find("ul").first().hide();
	});
})
/* =========================================================
HeadLines Scroller
============================================================ */
jQuery(document).ready(function() {

	//create scroller for each element with "horizontal_scroller" class...
	jQuery('.horizontal_scroller').SetScroller({	velocity: 	 60,
											direction: 	 'horizontal',
											startfrom: 	 'right',
											loop:		 'infinite',
											movetype: 	 'linear',
											onmouseover: 'pause',
											onmouseout:  'play',
											onstartup: 	 'play',
											cursor: 	 'pointer'
										});
});
/* =========================================================
Home page slider
============================================================ */
jQuery(window).load(function() {
	jQuery('#slider').nivoSlider({
		effect: 'random' // Specify sets like: 'fold,fade,sliceDown'
		
		});
});
/* =========================================================
Featured news slider
============================================================ */
jQuery(window).load(function() {
	jQuery('.feature-news').carouFredSel({
		responsive: true,
		prev: '#prev-1',
		next: '#next-1',
		width: 189,
		scroll: 1,
		auto: false,
		items: {
			width: 189,
			visible: {
				min: 1,
				max: 3
			}
		}
	});
});
/* =========================================================
Accordion
============================================================ */
jQuery(document).ready(function() {
    (function() {
        var acc_wrapper=jQuery('.acc-wrapper');
        if (acc_wrapper.length >0) 
        {
            jQuery('.acc-wrapper .accordion-container').hide();
            jQuery.each(acc_wrapper, function(index, item){
                jQuery(this).find(jQuery('.accordion-title')).first().addClass('active').next().show();
				
            });
            jQuery('.accordion-title').on('click', function(e) {
                if( jQuery(this).next().is(':hidden') ) {
                    jQuery(this).parent().find(jQuery('.active')).removeClass('active').next().slideUp(300);
                    jQuery(this).toggleClass('active').next().slideDown(300);
                }
                e.preventDefault();
            });
        }
    })();
});
/* =========================================================
Scroll to top
============================================================ */
jQuery(document).ready(function(){	
	// scroll body to 0px on click
	jQuery('#scroll-to-top').click(function () {
		jQuery('body,html').animate({
			scrollTop: 0
		}, 800);
		return false;
	});	
});
/* =========================================================
Hover effect
============================================================ */
jQuery(document).ready(function(){   
    jQuery(".hover-effect").mouseenter(function(){
        jQuery(this).fadeTo(300, 0.8);
    }).mouseleave(function(){
        jQuery(this).fadeTo(300, 1);
    });	
	//video thumbnails hover
	 jQuery(".black-overlay").mouseenter(function(){
        jQuery(this).fadeTo(300, 0);
    }).mouseleave(function(){
        jQuery(this).fadeTo(300, 0.3);
    });	
	
	
});
 /* =========================================================
Tabs
============================================================ */

jQuery(document).ready(function() {
//Default Action Product Tab
	jQuery(".tab-content").hide(); //Hide all content
	jQuery("ul.tabs li:first").addClass("active").show(); //Activate first tab
	jQuery(".tab-content:first").show(); //Show first tab content
	//On Click Event Product Tab
	jQuery("ul.tabs li").click(function() {
		jQuery("ul.tabs li").removeClass("active"); //Remove any "active" class
		jQuery(this).addClass("active"); //Add "active" class to selected tab
		jQuery(".tab-content").hide(); //Hide all tab content
		var activeTab = jQuery(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		jQuery(activeTab).fadeIn(); //Fade in the active content
		return false;
		
	});
});

/* =========================================================
prettyPhoto
============================================================ */
jQuery(document).ready(function(){
    jQuery("a[rel^='prettyPhoto']").prettyPhoto();
});
/* =========================================================
Sticky
============================================================ */
jQuery(document).ready(function(){
	jQuery("#sidebar-a").find(".widget").last().addClass("a-last-widget");
	jQuery("#sidebar-b").find(".widget").last().addClass("b-last-widget");
	var view_port_w = window.innerWidth;
	var sidebar_w=jQuery(".sidebar").width();
	jQuery(".sidebar .widget").width(sidebar_w);
	jQuery("#main-section").find(".article-wrap").last().addClass("last-item");
	if(jQuery("#main-section .last-item").next().is(".pagination-wrap")){
		jQuery("#main-section .last-item").removeClass("last-item");
		jQuery("#main-section .pagination-wrap").addClass("last-item");
	}
	var main_section_w=jQuery("#main-section").width();
	jQuery("#main-section .last-item").width(main_section_w);
	//Add sticky to sidebar
	if(view_port_w >=940){
		jQuery("#sidebar-a .a-last-widget").sticky({ topSpacing: 0, bottomSpacing: 188, className: 'sticky', wrapperClassName: 'sticky-wrapper'});
		jQuery("#sidebar-b .b-last-widget").sticky({ topSpacing: 0, bottomSpacing: 188, className: 'sticky', wrapperClassName: 'sticky-wrapper'});
	}
	if((view_port_w <=939) && (view_port_w >=768)){
		jQuery("#sidebar-b .b-last-widget").sticky({ topSpacing: 0, bottomSpacing: 188, className: 'sticky', wrapperClassName: 'sticky-wrapper'});
	}
	if((view_port_w <=767) &&(view_port_w >=480)){
		jQuery("#sidebar-a .a-last-widget").sticky({ topSpacing: 0, bottomSpacing: 188, className: 'sticky', wrapperClassName: 'sticky-wrapper'});
		jQuery("#sidebar-b .b-last-widget").sticky({ topSpacing: 0, bottomSpacing: 188, className: 'sticky', wrapperClassName: 'sticky-wrapper'});
	}
	//Add sticky to main section
	if(view_port_w >= 768 ){
		jQuery("#main-section .last-item").sticky({ topSpacing: 0, bottomSpacing: 188, className: 'sticky', wrapperClassName: 'sticky-wrapper'});
	}	
});

/*+++++++++resize+++++++++*/
jQuery(window).resize(function(){
	var sidebar_w=jQuery(".sidebar").width();
	jQuery(".sidebar .widget").width(sidebar_w);
	var main_section_w=jQuery("#main-section").width();
	jQuery("#main-section .last-item").width(main_section_w);
	var view_port_w = window.innerWidth;
	
	if(view_port_w <= 767 ){	
		var find_m_sticky = jQuery("#main-section .last-item").parent();	
		if(jQuery(find_m_sticky).hasClass("sticky-wrapper")){
			jQuery("#main-section .last-item").removeClass("sticky");
			jQuery("#main-section .last-item").css("position","static");
			m_temp=jQuery("#main-section .sticky-wrapper").html();
			jQuery("#main-section .sticky-wrapper").remove();
			jQuery("#main-section").append(m_temp);
		}
	}
	else if(view_port_w > 767 ){
		var find_m_sticky = jQuery("#main-section .last-item").parent();	
		if (jQuery(find_m_sticky).hasClass("sticky-wrapper") == false){
			jQuery("#main-section .last-item").sticky({ topSpacing: 0, bottomSpacing: 188, className: 'sticky', wrapperClassName: 'sticky-wrapper'});
		}
	}
	//sidebar
	if(view_port_w >=940){
		var find_sticky_a = jQuery("#sidebar-a .a-last-widget").parent();
		if (jQuery(find_sticky_a).hasClass("sticky-wrapper") == false){
			jQuery("#sidebar-a .a-last-widget").sticky({ topSpacing: 0, bottomSpacing: 188, className: 'sticky', wrapperClassName: 'sticky-wrapper'});		
		}
	}
	else if((view_port_w <=939) && (view_port_w >=768)){
		var find_sticky_a = jQuery("#sidebar-a .a-last-widget").parent();
		if(jQuery(find_sticky_a).hasClass("sticky-wrapper")){
			jQuery("#sidebar-a .a-last-widget").removeClass("sticky");
			jQuery("#sidebar-a .a-last-widget").css("position","static");
			temp=jQuery("#sidebar-a .sticky-wrapper").html();
			jQuery("#sidebar-a .sticky-wrapper").remove();
			jQuery("#sidebar-a").append(temp);
		}
	}
	else if((view_port_w <=767) &&(view_port_w >=480)){
		var find_sticky_a = jQuery("#sidebar-a .a-last-widget").parent();
		if (jQuery(find_sticky_a).hasClass("sticky-wrapper") == false){
			jQuery("#sidebar-a .a-last-widget").sticky({ topSpacing: 0, bottomSpacing: 188, className: 'sticky', wrapperClassName: 'sticky-wrapper'});		
		}
	}
	else if(view_port_w <= 479){
		var find_sticky_a = jQuery("#sidebar-a .a-last-widget").parent();
		if(jQuery(find_sticky_a).hasClass("sticky-wrapper")){
			jQuery("#sidebar-a .a-last-widget").removeClass("sticky");
			jQuery("#sidebar-a .a-last-widget").css("position","static");
			temp=jQuery("#sidebar-a .sticky-wrapper").html();
			jQuery("#sidebar-a .sticky-wrapper").remove();
			jQuery("#sidebar-a").append(temp);
		}
	}
	
});
/* =========================================================
Comment Form
============================================================ */
jQuery(document).ready(function() {
    var validator = jQuery("#comments-form").kendoValidator().data("kendoValidator"),
    status = jQuery("#status-message");
    jQuery("#submit-comment").click(function() {
        if (validator.validate()) {
            status.text("Your message is being sent").addClass("valid");
        } else {
            status.text("Oops! There is invalid data in the form.").addClass("invalid");
        }
    });
});

/* =========================================================
Responsive fixed width
============================================================ */
function fix_searchBoxW(){
	var secondary_width = jQuery(".sub-1sidebar #sidebar-b").width();
	var primary_width=jQuery(".sub-1sidebar .primary").width();
	jQuery(".sub-1sidebar .sub-search-box").width(secondary_width -2);
	jQuery(".sub-1sidebar .sub-search-box .search-text").width(secondary_width -45);
	jQuery(".sub-1sidebar .breadcrumb").width(primary_width - 50);	
	
}
jQuery(document).ready(function() {
	fix_searchBoxW();
})
jQuery(window).resize(function(){
		fix_searchBoxW();
	})