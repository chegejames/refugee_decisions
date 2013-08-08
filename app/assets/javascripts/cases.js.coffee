# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
     $('#gallery a').fancybox({padding: 5, maxWidth: 600, minWidth:500,'type': 'image', openEffect  : 'elastic', })
     $('.datepicker').datepicker({ dateFormat: 'dd-mm-yy' })
     $('.dropdown-toggle').dropdown()
     $('#civil, #criminal').hide()
     $('#case_cause_id').change(-> if $('#case_cause_id option:selected')
     .text().indexOf('civil') > -1 then $('#civil').show() $('#criminal')
     .hide()  else $('#criminal')
     .show() $('#civil').hide())
     $('#judges_tokens').tokenInput("/judges.json", {crossDomain: false})
     $("#case_search").on "ajax:success", (e, data, status, xhr) -> $("#cases").html(data)  "ajax:error", (e, xhr, status, error) -> $("#cases").append "<p>We ARE SORRY AN ERROR OCCURED</p>"
     $("#training_search").on "ajax:success", (e, data, status, xhr) -> $("#reports").html(data)
     $("#training_session_search").on "ajax:success", (e, data, status, xhr) -> $("#training_sessions").html(data)
     $("#judges_cases").on "ajax:success", (e, data, status, xhr) -> $("#cases_for_judges").html(data)
     $("#judges_trainings").on "ajax:success", (e, data, status, xhr) -> $("#trainings_for_judges").html(data)
     $("#participants_search").on "ajax:success", (e, data, status, xhr) -> $("#participants").html(data)
     $("#causes_search").on "ajax:success", (e, data, status, xhr) -> $("#causes").html(data)
    
     
     
     

