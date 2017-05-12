
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){

////Click a button and set the desired block to hit or miss. need some logic to teel if the class is a ship or not.
// if a ship is hit change the class to hit
// might need some ajax later once routes are ready
/// need to have the block id that will be shot at

  $('.block').on('click',function(){

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


    if(block.attr('class').split(' ')[1] == 'empty'){
      block.removeClass('empty').addClass('miss');
    }
    if(block.attr('class').split(' ')[1] == 'ship'){
      block.removeClass('ship').addClass('hit');
    }
  })
})
