
import Turbolinks from "turbolinks"

Turbolinks.start()

const addButton = document.querySelector('#btn'),
      options = document.querySelector('#option');
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