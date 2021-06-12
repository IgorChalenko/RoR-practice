import consumer from "./consumer"


  consumer.subscriptions.create( { channel: "PollChannel", room: '1'}, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("Connected to the poll room!");
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    }
  });


