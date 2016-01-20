@Bootstrap =
  init: ->
    @popover()
    @datetimepicker()
    @tooltip()

  popover: ->
    $('[data-toggle="popover"]').popover trigger: 'hover'

  datetimepicker: ->
    $('.bs-datetimepicker').setMask('datetime').datetimepicker()
    $('.bs-timepicker').setMask('time').datetimepicker format: 'LT'
    $('.bs-datepicker').setMask('date').datetimepicker format: 'DD/MM/YYYY'

  tooltip: ->
    $('.bs-tooltip').tooltip()
