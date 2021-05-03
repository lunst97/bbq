import Rails from "@rails/ujs"
import 'bootstrap/dist/js/bootstrap'
import '../styles/application.scss'
import '../scripts/datepicker'
import '../scripts/datepicker.min'
import '../scripts/i18n/datepicker.cs'
const images = require.context('../images', true)
Rails.start()

$(document).ready(function (){
    $('#event_datetime').datepicker({
        timepicker: true,
        altField: "dd.mm.yyyy hh:mm",
        timeFormat: "hh:ii",
        todayButton: new Date(),
        minDate: new Date()
    })
})