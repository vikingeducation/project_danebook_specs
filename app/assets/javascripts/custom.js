$( document ).ready(function() {
	
	$( "a.show-comment" ).click(function( event ) {
 		event.preventDefault();
 	});
  
  $('a.show-comment').click(function(){
  	$('#post-'+$(this).attr('id')+' .post-comment-wrapper').toggle('slow');
  });

});