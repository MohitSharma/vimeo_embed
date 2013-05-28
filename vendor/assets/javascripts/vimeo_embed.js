$('.vimeo_embed_partial_video').live('click', function() {
   $(this).hide();
   var parent = $(this).parent();
   $(".vimeo_embed_main_video iframe", parent).attr('src', $(".vimeo_embed_main_video iframe", parent).attr('src') + '?autoplay=1');
   $(".vimeo_embed_main_video", parent).show();
});