$( document ).ready(function() {
	
	$( "a.show-comment" ).click(function( event ) {
 		event.preventDefault();
 	});
  
  $('a.show-comment').click(function(){
  	comment_id = $(this).attr('id');
  	$('#post-'+comment_id+' .post-comment-wrapper').toggle('slow');
  });

});