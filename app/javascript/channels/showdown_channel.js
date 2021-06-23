import consumer from "./consumer"



document.addEventListener('turbolinks:load', () => {
  console.log("aaaaa")
  const id_element = document.getElementById("showdown-i")
  const sid = id_element.getAttribute("data-showdown-i")

  console.log( sid)
  consumer.subscriptions.create({ channel: "ShowdownChannel", showdown_id: sid  }, {
    connected() {
      console.log("Subscription created to Showdown channel")
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data)
    }
  });
  


} )

