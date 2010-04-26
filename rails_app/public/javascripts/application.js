var w = 160;

$(function() {
  initializeScroller();
  $('a[href=#next]').click(next);
  $('a[href=#previous]').click(previous);
});

next = function() { move('next'); return false; }
previous = function() { move('prev'); return false; }

move = function(dir) {
  if (window.inProgress) { return false; }
  window.inProgress = true;
  var amount = dir == 'next' ? -w : w;
  if (dir == 'prev') preMove();
  $('.scroller li').each(function() {
    $(this).animate({left:'+=' + amount}, 500, 'swing', endMove);
  });
}

preMove = function() {
  $('.scroller li:last').css('left', -w).prependTo('.scroller');
}

endMove = function() {
  if ($(this).position().left < 0) {
    $(this).css('left', w * ($('.scroller li').length - 1)).appendTo('.scroller');
  }
  window.inProgress = false;
}

initializeScroller = function() {
  var counter = 0;
  $('.scroller li').each(function() {
    $(this).css({position:'absolute', top:0, left:(w * counter++) + 'px'});
  });
}
