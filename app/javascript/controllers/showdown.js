import Controller from "stimulus"
import consumer from "../channels/consumer";


export default class extends Controller {
    static targets = ['presence']
    connect() {
        console.log("I m in controller")
    }
    
}