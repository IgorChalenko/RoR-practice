import consumer from "./consumer"


  const pollChannel = consumer.subscriptions.create("PollChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
      
      console.log("Connected to the poll room!");
    },
    received(data) {
      let mess = document.createElement('span'),
          col = document.createElement('div');
      col.classList.add('col', 'mb-4')    
      mess.classList.add('bg-info', 'rounded-pill', 'text-white', 'p-2');
      mess.innerHTML = data.message;
      col.insertAdjacentElement('afterbegin', mess);
      document.querySelector('#chat_holder').insertAdjacentElement('beforeend', col)

    console.log(data); 
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },
    speak(message) {
      this.perform('speak', { message: message })
    }
  });
export default pollChannel;