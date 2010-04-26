var amount, counter, inProgress, w
amount      = null;
counter     = 0;
inProgress  = false;
w           = 160;

$(function() {
  $('.scroller li').each(function() {
    $(this).css({position:'absolute', top:0, left:(w * counter++) + 'px'});
  });

  $('a[href=#next]').click(function(e) {
    e.preventDefault();
    move('next');
  });

  $('a[href=#previous]').click(function(e) {
    e.preventDefault();
    move('prev');
  });

  $('a[rel=gallery][target!=_blank]').colorbox();
});

move = function(dir) {
  if (inProgress) return false;
  inProgress  = true;
  amount      = dir == 'next' ? -w : w;

  if (dir == 'prev') $('.scroller li:last').css('left', -w).prependTo('.scroller');

  $('.scroller li').each(function() {
    $(this).animate({left:'+=' + amount}, 300, 'swing', function() {
      if ($(this).position().left < 0) {
        $(this).css('left', w * ($('.scroller li').length - 1)).appendTo('.scroller');
      }

      inProgress = false;
    });
  });
}
