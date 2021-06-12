import consumer from "./consumer"


  consumer.subscriptions.create( { channel: "PollChannel", id: '1'}, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("Connected to the poll room!");
    },
    received(data) {
      data => { sent_by: "Paul", body: "This is a cool chat app." }
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    }
  });


