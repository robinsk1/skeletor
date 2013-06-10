
$(document).ready ->
  $('a.load-more-artists').on 'inview', (e, visible) ->
    return unless visible
    $.getScript $(this).attr('href')

  $container = $("#content")
  $container.isotope
    filter: "*"
    animationOptions:
      duration: 750
      easing: "linear"
      queue: false

  #   add randomish size classes
  $container.find('.element').each ->
    $this = $(this)
    number = parseInt( $this.find('.number').text(), 10 )
    if number % 7 % 2 is 1
      $this.addClass('width2')
    if number % 3 is 0
      $this.addClass('height2')

  $container.isotope
    itemSelector : '.element'
    masonry :
      columnWidth : 120
    masonryHorizontal :
      rowHeight: 120
    cellsByRow :
      columnWidth : 240
      rowHeight : 240
    cellsByColumn :
      columnWidth : 240
      rowHeight : 240

    getSortData :
      symbol : ($elem) ->
        return $elem.attr('data-symbol')
      category : ($elem)  ->
        return $elem.attr('data-category')
      number : ($elem) ->
        return parseInt( $elem.find('.number').text(), 10 )
      weight : ($elem) ->
        return parseFloat( $elem.find('.weight').text().replace( /[\(\)]/g, '') )
      name : ($elem) ->
        return $elem.find('.name').text()

  $optionSets = $('#options .option-set')
  $optionLinks = $optionSets.find('a')

  $optionLinks.click ->
    $this = $(this);
  #   don't proceed if already selected
    if $this.hasClass('selected')
      return false
    $optionSet = $this.parents('.option-set')
    $optionSet.find('.selected').removeClass('selected')
    $this.addClass('selected')

  #   make option object dynamically, i.e. { filter: '.my-filter-class' }
    options = {}
    key = $optionSet.attr('data-option-key')
    value = $this.attr('data-option-value')
  #   parse 'false' as false boolean
    value = value is 'false' ? false : value
    options[ key ] = value
    if key is 'layoutMode' and typeof changeLayoutMode is 'function'
  #   changes in layout modes need extra logic
      changeLayoutMode( $this, options )
    else
  #   otherwise, apply new options
      $container.isotope( options )
      return false

  #           change layout
  isHorizontal = false
  changeLayoutMode = ($link, options) ->
    wasHorizontal = isHorizontal
    isHorizontal = $link.hasClass('horizontal')

    if wasHorizontal isnt isHorizontal
  #     orientation change
  #     need to do some clean up for transitions and sizes
      w = $container.width()
      style = isHorizontal ? height: '80%', width: w : width: 'auto'
  #     stop any animation on container height / width
      $container.filter(':animated').stop()
  #     disable transition, apply revised style
      $container.addClass('no-transition').css( style )
      setTimeout $container.removeClass('no-transition').isotope( options ), 100
    else
      $container.isotope( options )

  # change size of clicked element
  $container.delegate '.element', 'click', ->
    $(this).toggleClass('large')
    $container.isotope('reLayout')

  #  toggle variable sizes of all elements
  $('#toggle-sizes').find('a').click ->
    $container
      .toggleClass('variable-sizes')
      .isotope('reLayout')
    return false

  $('#insert a').click ->
    $newEls = $( fakeElement.getGroup() )
    $container.isotope( 'insert', $newEls )
    return false

  $('#append a').click ->
    $newEls = $( fakeElement.getGroup() )
    $container.append( $newEls ).isotope( 'appended', $newEls )
    return false

  $sortBy = $('#sort-by')

  $('#shuffle a').click ->
    $container.isotope('shuffle')
    $sortBy.find('.selected').removeClass('selected')
    $sortBy.find('[data-option-value="random"]').addClass('selected')
    return false







