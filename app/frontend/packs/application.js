import Rails from "@rails/ujs"
import 'bootstrap/dist/js/bootstrap'
import 'styles/application.scss'
import 'air-datepicker/dist/js/datepicker.min'
import 'air-datepicker/dist/js/i18n/datepicker.cs'
import '../scripts/datetime'
import '../scripts/map'

const images = require.context('../images', true)
Rails.start()