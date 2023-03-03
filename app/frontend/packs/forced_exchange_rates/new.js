import AirDatepicker from 'air-datepicker';
import localeRu from 'air-datepicker/locale/ru';
import 'air-datepicker/air-datepicker.css';

document.addEventListener('turbolinks:load', function() {
  const datepickerEl = document.querySelector('#datepicker');

  if (datepickerEl) {
    new AirDatepicker(datepickerEl, {
      minDate: new Date(),
      locale: localeRu,
      timepicker: true
    });
  }
});
