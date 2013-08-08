# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
     $("<img id=ajaxloader, src=assets/ajaxloader.gif/>").animate({"position": "absolute", "top":"40%", "left":"45%"}).hide().appendTo("document")
     $('#gallery a').fancybox({padding: 5, maxWidth: 600, minWidth:500,'type': 'image', openEffect  : 'elastic', })
     $('.datepicker').datepicker({ dateFormat: 'dd-mm-yy' })
     $('.dropdown-toggle').dropdown()
     $('#civil, #criminal').hide()
     $('#case_cause_id').change(-> if $('#case_cause_id option:selected')
     .text().indexOf('civil') > -1 then $('#civil').show() $('#criminal')
     .hide()  else $('#criminal')
     .show() $('#civil').hide())
     $('#judges_tokens').tokenInput("/judges.json", {crossDomain: false})
     $("#training_search").on "ajax:success", (e, data, status, xhr) -> $("#reports").html(data)
     $("#cases_search").on "ajax:success", (e, data, status, xhr) -> $("#cases").html(data)
     $("#training_session_search").on "ajax:success", (e, data, status, xhr) -> $("#training_sessions").html(data)
     $("#judges_cases").on "ajax:success", (e, data, status, xhr) -> $("#cases_for_judges").html(data)
     $("#judges_trainings").on "ajax:success", (e, data, status, xhr) -> $("#trainings_for_judges").html(data)
     $("#participants_search").on "ajax:success", (e, data, status, xhr) -> $("#participants").html(data)
     $("#causes_search").on "ajax:success", (e, data, status, xhr) -> $("#causes").html(data)
     $.ready("page:fetch", $('#ajaxloader').fadeIn())
     $.ready("page:recieve", $('#ajaxloader').fadeOut())   
     $(document).on 'ajax:before ajaxStart page:fetch', -> $('#ajaxloader').fadeIn()
     $(document).on 'ajax:complete ajaxComplete page:change', -> $('#ajaxloader').fadeOut()
     
     

