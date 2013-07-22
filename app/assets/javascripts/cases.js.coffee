# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
     $('#gallery a').data({'colorboxWidth': '100px;'})
     $('#datepicker').datepicker()
     $('.dropdown-toggle').dropdown()
     $('#civil, #criminal').hide()
     $('#case_cause').change(-> if $('#case_cause option:selected').text().indexOf('civil') > -1 then $('#civil').show() $('#criminal').hide()  else $('#criminal').show() $('#civil').hide())

