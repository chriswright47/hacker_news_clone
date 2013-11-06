$(document).ready(function() {
  $(document).on('click', '.post_vote', function() {
    var post_id = $(this).data('post-id');
    $(this).replaceWith('<i></i>');
    $.post('/post_vote', {post_id: post_id} );
  });

    $(document).on('click', '.comment_vote', function(){
      var comment_id = $(this).data('comment-id');
      $(this).replaceWith('<i></i>');
      $.post('/comment_vote', {comment_id: comment_id});
    });
});
