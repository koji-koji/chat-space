$(function() {
  function buildHTML(comments) {
    var html = $('<li class="comments">').append('comments');
    return html;
  }
  $('.chat-contents__type-message__button').on('click', function(e) {
    e.preventDefault();
    var textField = $('.chat-contents__type-message__box__message');
    var comment = textField.val();
    console.log(comment);
    var test =  {comments: { comment: comment}};
    console.log(test);
    $.ajax({
      type: 'POST',
      url: '/chatgroups/106/comments',
      data: {
        comments: {
          comment: comment
        }
      },
      dataType: 'json'
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      textField.val('')
    })
    .fail(function(error){
      console.log(error);
      alert('error');
    });
  });
});
