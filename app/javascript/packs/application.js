// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import polChannel from '../channels/poll_channel'
import pollChannel from "../channels/poll_channel"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require('./add_button_script/script');

document.addEventListener('DOMContentLoaded', () => {
  const btn = document.querySelector('#button-addon2'),
        input = document.querySelector('#message_input');

  btn.addEventListener('click', (e) => {
    e.preventDefault();
    let message = input.value;
    if (message.length > 0) {
      pollChannel.speak(message);
      input.value = "";
    }    
  });
})
       
