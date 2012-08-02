# Toggle the grouped by year manifestations/actions
jQuery ->
	$('.hide_show').click ->
		yeargroup_to_toggle = $(this).data('year')
		el = $("div.manif-resume[data-year='" + yeargroup_to_toggle + "']");
		el.slideToggle();