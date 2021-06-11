import consumer from "./consumer"

consumer.subscriptions.create({ channel: "PollChannel", room: "Poll room" });

// consumer.subscriptions.create({ channel: "PollChannel", room: "Poll room" }, {
//   received(data) {
//     this.appendLine(data)
//   },