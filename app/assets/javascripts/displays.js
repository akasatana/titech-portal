$(function(){
  var text;
  $('.draggable').draggable({
    opacity: '0.5',
    helper: 'clone',
    start: function(event, ui){
      text = $(this).text();
    }
  });
  $('.draggable').hover(
    function(){
      $(this).addClass('hover');
    },
    function(){
      $(this).removeClass('hover');
    }
    );
  $('.droppable').droppable({
    accept: '.draggable',
    hoverClass: 'hover',
    drop: function(event, ui){
      $(this).val(text);
    }
  });
});