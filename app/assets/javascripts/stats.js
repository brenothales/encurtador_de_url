// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(".stats.shortened").ready(function() {

  $('#shorturl').popover('show');

  $('body').click(function(){
    $('#shorturl').popover('hide')
  });
  var range = document.createRange();
  var selection = window.getSelection();
  range.selectNodeContents(document.getElementById('shorturl'));

  selection.removeAllRanges();
  selection.addRange(range);

});


$(".stats.index").ready(function() {
  $("#url").attr('size', $("#url").attr('placeholder').length);
});
