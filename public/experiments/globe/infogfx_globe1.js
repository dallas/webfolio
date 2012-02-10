(function($) {
  var animateWithSpritely,
      insertGlobe,
      initScrubbables,
      initPauseButtons,
      initPlayButtons,
      namespace   = 'infogfx',
      classPrefix = '.' + namespace,
      globeClass  = classPrefix + '_globe',
      idPrefix    = '#' + namespace,
      globeId     = idPrefix + '_globe';

  $(function() {
    insertGlobe();

    if (Modernizr.cssanimations && Modernizr.csstransform) {
      /* Have Everything! :) */

      console.log('the world is my oyster!');

      initScrubbables();
    } else if (Modernizr.cssanimations && !Modernizr.csstransform) {
      /* Don't have CSS transform property */

      console.log('cannot transform');

      /* Insert a background image for the shadow? */
      initScrubbables();
    } else if (!Modernizr.cssanimations && Modernizr.csstransform) {
      /* Don't have CSS animations */

      console.log('cannot animate');

      /* Animate with JavaScript */
      // animateWithSpritely();
    } else {
      /* Don't have Anything! :( */

      console.log('cannot do anything');

      /* Insert a background image for the shadow? */
      /* Animate with JavaScript */
      // animateWithSpritely();
    }
  });

  insertGlobe = function() {
    $(globeId).append("<span class='infogfx_globe_wrapper'><span class='infogfx_globe infogfx_scrubbable' /></span><span class='infogfx_globe_shadow' />")
      .append("<menu class='infogfx_controls'><li class='infogfx_play infogfx_active'><a href='#play'>play</a></li><li class='infogfx_pause'><a href='#pause'>pause</a></li></menu>");
  }

  initScrubbables = function() {
    initPauseButtons();
    initPlayButtons();
    $(classPrefix + '_controls').find(classPrefix + '_pause').click(function(e) {
      e.preventDefault();

      console.log('pausing');
    });
  }

  initPauseButtons = function() {
    $(classPrefix + '_controls').find(classPrefix + '_pause').click(function(e) {
      e.preventDefault();

      $(this).closest(classPrefix)
        .find(classPrefix + '_scrubbable')
        .css({ '-webkit-animation-play-state': 'paused' });
    })
  }

  initPlayButtons = function() {
    $(classPrefix + '_controls').find(classPrefix + '_play').click(function(e) {
      e.preventDefault();

      $(this).closest(classPrefix)
        .find(classPrefix + '_scrubbable')
        .css({ '-webkit-animation-play-state': 'running' });
    })
  }

  animateWithSpritely = function() {
    $(globeId).find('span').sprite({ fps: 6, no_of_frames: 12 });
  }
})(jQuery.noConflict());
