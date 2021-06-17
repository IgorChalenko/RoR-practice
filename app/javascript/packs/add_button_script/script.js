document.addEventListener('DOMContentLoaded', () => {

  const addButton = document.querySelector('#btn'),
        options = document.querySelector('#options');
        
  
  let counter = 2;           

  addButton.addEventListener('click', (e) => {
    const optionArray = document.querySelectorAll('[name*="[vote_option]"]');
    e.preventDefault();
    if (optionArray.length < 5) {
      const col = document.createElement('div');
      const input = `<input id="poll_options_attributes_${counter}_vote_option" class="form-control" placeholder="Option"
      type="text" name="poll[options_attributes][${counter}][vote_option]"></input>
      <input id="poll_options_attributes_${counter}__destroy" type="checkbox" value="1"
      name="poll[options_attributes][${counter}][_destroy]"></input>`;
      
      col.classList.add('col-4');
      col.innerHTML = input;
      options.insertAdjacentElement('beforeend', col);
      
      counter++;
      if (counter == 5) {
        addButton.style.display = 'none';
      }
      
    }
  });

});