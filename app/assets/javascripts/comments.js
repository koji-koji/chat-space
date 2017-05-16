$(function() {
  function buildHTML(data) {
    var html = "<div class = 'chat-contents__body__content__line clearfix'>" + "<div class = 'chat-contents__body__content__line__name'>"+ data.name + "</div>" + "<div class = 'chat-contents__body__content__line__time'>" + data.time + "</div>" + "</div>" + "<div class = 'chat-contents__body__content__message'>" + data.comment + "</div>"
    return html;
  }
  $('.chat-contents__type-message__button').on('click', function(e) {
    e.preventDefault();
    var textField = $('.chat-contents__type-message__box__message');
    var comment = textField.val();
    $.ajax({
      type: 'POST',
      url: window.location.href,
      data: {
        comments: {
          comment: comment
        }
      },
      dataType: 'json'
    })
    .done(function(data){
      var html = buildHTML(data);
      var show = $('<li class="comment" style = "list-style: none;">').append(html)
      $('.chat-contents__body__comments').append(show)
      textField.val('')
    })
    .fail(function(error){
      alert('error');
    });
  });
});
