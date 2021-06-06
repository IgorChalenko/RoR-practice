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


const addButton = document.getElementById('btn'),
      options = document.getElementById('option');
const optionText = `<div class="col-4 mb-3">
                    <%= f.fields_for :poll_options do |option| %>
                      <%= option.text_field :option_name, placeholder: 'Option', class: "form-control" %>
                    <% end %>
                    </div>`;
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