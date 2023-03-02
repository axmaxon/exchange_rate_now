// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"

import "bootstrap/dist/js/bootstrap"
import "bootstrap/dist/css/bootstrap"
import "stylesheets/application"

import AirDatepicker from "air-datepicker";
import localeRu from "air-datepicker/locale/ru";
import "air-datepicker/air-datepicker.css";

Rails.start()
Turbolinks.start()

document.addEventListener('DOMContentLoaded', function() {
  const datepickerEl = document.querySelector('#datepicker');

  new AirDatepicker(datepickerEl, {
    minDate: new Date(),
    locale: localeRu,
    timepicker: true
  });
});
