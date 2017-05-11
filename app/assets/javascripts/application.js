// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){

  ////Click a button and set the desired block to hit or miss. need some logic to teel if the class is a ship or not.
  // if a ship is hit change the class to hit
  // might need some ajax later once routes are ready
  /// need to have the block id that will be shot at
$('.fire-button').on('click',function(){
  $block = $(this)
})

})
