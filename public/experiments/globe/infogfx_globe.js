var gfx;
gfx || (gfx = {});

gfx.Globe = (function($) {
  var frames, globe, globes, setupFrames, setupGlobe, setupSlider;

  frames = [
    { info:0, slide:0,     time:0   },
    { info:1, slide:60,    time:18  },
    { info:2, slide:110,   time:22  },
    { info:3, slide:160,   time:35  },
    { info:4, slide:210,   time:64  },
    { info:5, slide:260,   time:76  },
    { info:6, slide:310,   time:89  },
    { info:7, slide:360,   time:104 },
    { info:8, slide:410,   time:120 },
    { info:8, slide:false, time:120 },
    { info:8, slide:false, time:120 },
    { info:8, slide:false, time:120 },
    { info:8, slide:false, time:120 }
  ];

  $(function() {
    globe = $('#infogfxGlobe');
    setupGlobe();
    setupFrames();
    setupSlider();
    frames.play();
  });

  setupFrames = function() {
    $.each(frames, function(i) {
      this.duration   || (this.duration   = 1500);
      this.transition || (this.transition = 250);
      this.globe      || (this.globe      = i * -490 + 'px 0');
      this.slide      || (this.slide      = i * 50);
      this.time       || (this.time       = i * 18);

      this.play = function(callback) { frames.moveTo(this, callback); }

      this.playWithNext = function() {
        var next = frames[i + 1];
        if (next) { this.play(next.playWithNext.bind(next)); } else { this.play(); }
      }
    });

    frames.play = function() {
      var cur       = frames.current || (frames.current = 0),
          curFrame  = frames.currentFrame || (frames.currentFrame = frames[cur]);

      curFrame.playWithNext();
    }

    frames.pause = function() {
      console.log('pause.');
    }

    frames.rw = function() {
      console.log('rewind.');
    }

    frames.ff = function() {
      console.log('fast-forward.');
    }

    frames.moveTo = function(frame, callback) {
      if (frame.globe) {
        var viz = globes.filter(':visible').css('z-index', 1),
            hid = globes.filter(':hidden').css('z-index', 0);

        hid.css({ display:'block', opacity:1, backgroundPosition: frame.globe });
        viz.animate({ opacity:0 }, frame.transition, function() { $(this).css('display', 'none'); });

        if (frame.info) {
          var viz   = globe.find('.g-info li:visible'),
              info  = globe.find('.g-info li:eq(' + frame.info + ')');

          if (!viz.is(info)) {
            var animateIn = function() {
              info.css({ opacity:0, display:'block' }).animate({ opacity:1 }, frame.transition);
            };

            if (viz.length > 0) {
              viz.animate({ opacity:0 }, frame.transition / 2, function() {
                $(this).css('display', 'none');
                animateIn();
              });
            } else { animateIn(); }
          }
        }

        if (callback) { setTimeout(callback, frame.duration); }
      }
    }
  }

  setupGlobe = function() {
    globe.find('.gfx-globe').after('<div class="gfx-globe" />');
    globes = globe.find('.gfx-globe');
    globes.eq(1).css('display', 'none');
  }

  setupSlider = function() {
    globe.find('.g-slide').hover(function() {
      var span = $(this).find('span'), top = parseInt(span.css('top'));
      span.css({ opacity:0, display:'block', top:top + 10 })
        .animate({ opacity:1, top:top }, 120);
    }, function() {
      var span = $(this).find('span'), top = parseInt(span.css('top'));
      span.animate({ opacity:0, top:top - 10 }, 120, function() {
        $(this).css({ display:'none', top:top });
      });
    });
  }

  return frames;
})(jQuery);
