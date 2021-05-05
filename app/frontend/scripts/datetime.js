$(document).ready(function (){
    $('#event_datetime').datepicker({
        timepicker: true,
        altField: "dd.mm.yyyy hh:mm",
        timeFormat: "hh:ii",
        todayButton: new Date(),
        minDate: new Date()
    })
})