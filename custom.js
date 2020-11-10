jQuery(document).ready(function($){
    
    AOS.init({
        once: true,
    });

    //Header sticky

    function stickyHeader() {
        var currScroll = $(window).scrollTop();
        if(currScroll > 10) {
            $(".site__header").addClass("site__header-sticky");
        } else {
            $(".site__header").removeClass("site__header-sticky");
        }
    }

	//Responsive Menu
	$(".site__toggle").click(function(){
		$("header").toggleClass("is-active");
		$(".site__nav-list").slideToggle();
	});
	
	function resetMenu(){
		if($(window).outerWidth() > 767) {
			$(".site__nav-list").show();
			$("header").removeClass("is-active");
		} else {
			$("header").removeClass("is-active");
			$(".site__nav-list").hide();
		}
	}
	resetMenu();
    
    
    //On Scroll Function
	function onScrollEvents(){
        stickyHeader();
    }

    onScrollEvents();

    $(window).on('resize', function(){
        resetMenu();
    });

    $(window).on('load scroll', function(){
        onScrollEvents();
    });

    //Footer - Copyright year print
    $("#printYear").text(new Date().getFullYear());

    //Slide To Target
    function slideToTarget(idVal, offsetVal) {
        var offsetSection = offsetVal;
        $('html,body').animate({ scrollTop: $(idVal).offset().top - offsetSection }, 700);
    }

    $(".slideToTarget").on("click", function(ev){
        ev.preventDefault();
        var getHash = (this.getAttribute('data-target')) ? this.getAttribute('data-target') : this.getAttribute('href');
        var offsetEl = this.getAttribute('data-offtop');
        var getOffset = (offsetEl) ? $(offsetEl).outerHeight() : 0;
        if($(getHash).length > 0) { slideToTarget(getHash, getOffset); }
    });
  
    //Load Video On Click
    if($(".video_poster").length > 0) {
        var vidPlay  = 0;
        $(".video_poster").on("click", function(e){
          e.preventDefault();
  
          var that = $(this);
          var videoEl = $(this).parents().find("video");
  
          videoEl.find("source").each(function(){
            $(this).attr("src", $(this).attr("data-src"));
          });
  
          that.addClass("buffering");
  
          vidPlay = 1;
  
          videoEl[0].load();
          videoEl[0].play();
    
          videoEl.on("loadeddata", function() {
            that.fadeOut();
            $(".video__wrapper").removeClass("video_paused").addClass("video_playing");
          });
        });
  
        //Play/Pause on video click0
        var vidControl = $(".video__wrapper .video_controls");
     
        vidControl.on("click", function(){
  
          var thisVid = $(this).parents(".video__wrapper").find("video")[0];
  
          if(thisVid.paused) {
            thisVid.play();
            $(".video__wrapper").removeClass("video_paused").addClass("video_playing");
          } else {
            thisVid.pause();
            $(".video__wrapper").removeClass("video_playing").addClass("video_paused");
          }
        });
    }

    if($(".video__wrapper").length > 0) {
        document.getElementById('paymyemivideo').addEventListener('ended',videoEnded,false);
        function videoEnded() {
            $(".video__wrapper").removeClass("video_playing").addClass("video_paused");
        }
    }

    //Blog Dynamic Listing and Slider

    function createBlogSlick(slidesCount){
        showDots = (slidesCount < 3) ? false : true;
        $(".bloglisting_wrapper").slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            infinite: true,
            autoplay: true,
            arrows: false,
            dots: showDots,
            appendDots: $(".bloglisting_controls"),
            responsive: [{
                breakpoint: 992,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                    dots: true,
                }
            },{
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    dots: true,
                }
            }]
        });
    }
    
    var blog_api_url = 'https://paymyemi.net/Admin/PayMyEmiService.svc/GetBlogDetails';

    function createModalDialogs(modalID, blogTitle, blogDesc) {
        var modalHTML = '<div class="modal fade" id="modal_' + modalID + '">';
            modalHTML += '<div class="modal-dialog  modal-lg modal-dialog-scrollable">';

            modalHTML += '<div class="modal-content">';
            
            modalHTML += '<div class="modal-header"> <h5 class="modal-title">' + blogTitle + '</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">×</span> </button> </div>'; // Modal Header

            modalHTML += '<div class="modal-body">' + blogDesc + '</div>'; //Modal Body

            modalHTML += '</div>'; // .modal-content ends
          
            modalHTML += '</div>'; // .modal-dialog ends
            modalHTML += '</div>'; // .modal ends

            if (modalID == 0 ) { $("body").append('<div class="blog_modaldialogs"></div>'); }

            $(".blog_modaldialogs").append(modalHTML);
    }

    //Function creates HTML for each slide
    function createSlide(id,blogImagePath,blogTitle,blogDesc){
        var slideHTML ='<div class="blog_slide">';
            slideHTML += '<div class="blog_image embed-responsive embed-responsive-blog mb-3" style="background-image:url(' + blogImagePath + ');">';
            slideHTML += '<img class="embed-responsive-item" src="' + blogImagePath + '" />';
            slideHTML += '</div>'; //blog_image ends
            slideHTML += '<h4 class="blog_title">' + blogTitle + '</h4>';
            slideHTML += '<button type="button" class="bttn bttn-small site__transition" data-toggle="modal" data-target="#modal_' + id + '">Read More</button>'
            slideHTML += '</div>'; //blog_slide ends

        $(".bloglisting_wrapper").append(slideHTML);
        
        createModalDialogs(id, blogTitle, blogDesc);
    }

    //Check if blog section found on page
    if($(".blog_listing").length > 0) {

        $.getJSON(blog_api_url, function(jsonData) {
            var blog_count = Object.keys(jsonData['data']).length;

            //Check if found any blogs
            if(blog_count != 0) {
                for (var i = 0; i < blog_count; i++) {
                    var curData = jsonData['data'][i];
                    createSlide(i,curData.Image,curData.Title, curData.Description);             
                }

                //Once slides are appended create slick slider
                createBlogSlick(blog_count);
            }
        });
    }

    //Blog Dynamic Listing and Slider ENDS
});