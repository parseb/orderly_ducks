import consumer from "./consumer"



document.addEventListener('turbolinks:load', () => {
  console.log("aaaaa")
  let id_element = document.getElementById("showdown-i")
  let sid = id_element.getAttribute("data-showdown-i")

  console.log( sid)
  consumer.subscriptions.create({ channel: "ShowdownChannel", sid: sid  }, {
    connected() {
      console.log(consumer.subscriptions)
      console.log(message)
      console.log("in consumer, created")
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data)
      data
    }
  });
  


} )

