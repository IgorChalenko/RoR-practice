// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.addEventListener('DOMContentLoaded', () => {

  const addButton = document.querySelector('#btn'),
        options = document.querySelector('#options');
  
  let counter = 1;                    

  addButton.addEventListener('click', (e) => {
    e.preventDefault();
    if (counter <= 3) {
      options.insertAdjacentHTML('beforeend', optionText);
      counter++;
    } else {
      addButton.style.display = 'none';
    }
  });

});

