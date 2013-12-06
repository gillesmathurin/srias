# Toggle the grouped by year manifestations/actions
jQuery ->
  $('.hide_show').tooltip('toggle')
  # Show the current year manifestations
  $('.hide_show').first().tooltip('hide')
  # Get the number of years
  yearLength = $('.hide_show').length
  # show the year's manifestations on click
  $('.hide_show').click ->
    yeargroup_to_toggle = $(this).data('year')
    el = $("div.manif-resume[data-year='" + yeargroup_to_toggle + "']");
    el.slideToggle();
  # Hide the given year manifestations
  hideYearContent = (yearElement) ->
    yeargroup_to_toggle = $(yearElement).data('year')
    el = $("div.manif-resume[data-year='" + yeargroup_to_toggle + "']")
    el.hide();
  # Hide all the years manifestations
  hideYearContent yearElement for yearElement in $('.hide_show')[1..yearLength]
