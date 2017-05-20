$(function(){
  $('.chat-group-form__member--right__input').keyup(function(e) {
    e.preventDefault();
    var textField = $('.chat-group-form__member--right__input')
    var input = textField.val()
    $.ajax({
      type: 'GET',
      url: "/chatgroups/search",
      data: ('keyword=' + input),
      dataType: 'json'
    })
    .done(function(data) {
      $('.chat-group-form__member--right__search').find('li').remove();
      $(data).each(function(i, users){
        $('.chat-group-form__member--right__search').append(
          `<li class="search" id ="${users.id}" data-id="${users.id}">
            ${users.name}
            <span class="search--add">
              追加
            </span>
          </li>`).data('id', users.id)
      })
      if($('.chat-group-form__member--right__input').val().trim() === ""){
        $('.chat-group-form__member--right__search').find('li').remove();
      }
      })
      .fail(function(error){
        alert('error')
    });
  });
  $(document).on("click", '.search--add' , function(){
  var group_member = $(this).parent()
  $(this).parent().parent().siblings('.chat-group-form__field--right').append(group_member)
  $(this).text("削除").addClass("search--added")



  var id = $(this).parent().data('id')
  var add = `<input type="hidden" name="chatgroup[user_ids][]" value = "${id}" ></input>`
  $(this).append(add)
  $(this).on("click", function(){
    $(this).parent().remove()
  })
});
});


