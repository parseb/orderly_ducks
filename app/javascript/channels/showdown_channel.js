import consumer from "./consumer"



document.addEventListener('turbolinks:load', () => {
  console.log('was here')
  let id_element = document.getElementById("showdown-i")
  let sid = id_element.getAttribute("data-showdown-i")
  
  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })

  console.log( sid)

  consumer.subscriptions.create({ channel: "ShowdownChannel", sid: sid  }, {
    connected() {
      
      console.log("Connected to S_"+sid)
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
      console.log("DISCONNECTED")
    },
  
    received(message) {
      // Called when there's incoming data on the websocket for this channel
      
      let presence = message['data']['presence']
      let q= message['data']['q']
      let temp_transcript = message['temp_transcript']
      let plist = document.getElementById("presence_list")

      function append_html(presen){
        let html = ''
        console.log(presen)
        presen.forEach((p) => {
          html += '<li class="list-group-item present-item border-color:dodgeblue" id=' + p[1]+' >'+ p[0] +'</li> <br>'
        })
        plist.innerHTML = html
      }
      if (plist) {
        append_html(presence)
      }
      
    }
  });
  


} )

