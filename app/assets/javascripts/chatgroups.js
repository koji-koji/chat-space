$(function(){
  function buildSearch(data) {
    $.each(data, function(i, users){
        $(search_class).append(
          `<li class="search" id ="${users.id}" data-id="${users.id}">
            ${users.name}
            <span class="search--add">
              追加
            </span>
          </li>`).data('id', users.id)
      });
  };
  var input_name = '.chat-group-form__member--right__input';
  var search_class = '.chat-group-form__member--right__search';

  $(input_name).keyup(function(e) {
    e.preventDefault();
    var textField = $(input_name)
    var input = textField.val()
    $.ajax({
      type: 'GET',
      url: '/chatgroups/search',
      data: ('keyword=' + input),
      dataType: 'json'
    })
    .done(function(data) {
      $(search_class).find('li').remove();
      buildSEARCH(data)
      if($(input_name).val().trim() === ""){
        $(search_class).find('li').remove();
      };
    })
    .fail(function(error){
      alert('error')
    });
  });
  $(document).on("click", '.search--add' , function(){
    var group_member = $(this).parent()
    $('#member').append(group_member)
    $(this).text("削除").removeClass("search--add").addClass("search--added")
    var id = $(this).parent().data('id')
    var add = `<input type="hidden" name="chatgroup[user_ids][]" value = "${id}" ></input>`
    $(this).append(add)
    $(this).on("click", function(){
      $(this).parent().remove()
    });
  });
});
