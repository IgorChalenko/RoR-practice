// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `bin/rails generate channel` command.

import { createConsumer } from "@rails/actioncable"

createConsumer('http://127.0.0.1:3000/cable'); 

export default createConsumer()

