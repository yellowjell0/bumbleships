
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){

  var thing = $('body').find('table')[1]
  $(thing).removeClass('n').addClass('bottom')
  $(thing).siblings('h1').text('Opponent Table')

  $('.n').find('.block').removeClass('overlay')

  $('.bottom').on('click','.block',function(){
    $(this).closest('tbody').find('.selected').removeClass('selected')
    $(this).addClass('selected')

    var first_num = $(this).attr("class").split("")[0];
    var second_num = $(this).attr("class").split("")[1];
    var together = first_num + second_num
    $("input[value='']").val(together)

  })

  $('form.fire-button').on('submit',function(e){
    e.preventDefault();
    var block = $(this).siblings('.bottom').find('.selected');
    $form = $(this)

    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize()
    })

    if(block.attr('class').split(' ')[1] == 'empty'){
      block.removeClass('overlay')
      block.removeClass('empty').addClass('miss');
    }
    if(block.attr('class').split(' ')[1] == 'ship'){
      block.removeClass('overlay')
      block.removeClass('ship').addClass('hit');
    }
  })
})
