$ ->
 $('a.load-more-artists').on 'inview', (e, visible) ->
   return unless visible

   $.getScript $(this).attr('href')