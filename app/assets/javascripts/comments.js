$(function() {
  function buildHTML(data) {
    var html =  `
      <li class="comment" style = "list-style: none;">
        <div class = 'chat-contents__body__content__line clearfix'>
          <div class = 'chat-contents__body__content__line__name'>
            ${data.name}
          </div>
          <div class = 'chat-contents__body__content__line__time'>
            ${data.time}
          </div>
        </div>
        <div class = 'chat' data-comment-id = '${data.id}'>
        </div>
        <div class = 'chat-contents__body__content__message'>
            ${data.comment}
        </div>`
      console.log(data.id)
      if (data.image.url == null){
        html = $(html).append(`</li>`)
      } else {
        html = $(html).append(`<div class = 'chat-contents__body__content__image'><img src = '${data.image.url}' width="256" height="256"}</div>
      </li>`)
      }
    $('.chat-contents__body__comments').append(html)
  }


  function countup() {
    if ($('.chat').last(0).data('commentId') == null ){
      var lastId = 0
    } else {
      var lastId = $('.chat').last(0).data('commentId')
    }
    console.log(lastId)
    $.ajax({
      type: 'GET',
      url: window.location.href,
      data: {
        lastId: lastId
      },
      dataType: 'json'
    })
    .done(function(data) {
      $.each(data.comments, function(i, data){
        buildHTML(data)
      })
    });
  }
  setInterval(countup, 10000);


  $('.form').on("submit", function(e) {
    e.preventDefault();
    console.log(this)
    var formdata = new FormData($(this).get(0));
    $.ajax({
      type: 'POST',
      url: window.location.href,
      data: formdata,
      dataType: 'json',
      contentType: false,
      processData: false,
      disabled: false
    })
    .done(function(data){
      console.log("hoge")
      buildHTML(data);
      var textField = $('.chat-contents__type-message__box__message')
      $(textField).val('')
      $('.chat-contents__type-message__button').removeAttr("disabled");
      alert('送信が成功しました')
    })
    .fail(function(error){
      alert('error')
    });
  });
});
