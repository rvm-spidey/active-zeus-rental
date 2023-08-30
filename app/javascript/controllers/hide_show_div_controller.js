import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-show-div"
export default class extends Controller {

  static targets = ["current", "previous", "currentbtn", "previousbtn"]

  connect() {
    console.log("hide show triggered")
  }

  show_current(event) {

    event.preventDefault();

    this.previousTarget.classList.add("d-none")
    this.currentTarget.classList.remove("d-none")

    this.styling_previous();
    this.currentbtnTarget.classList.remove("btn-outline-secondary")
    this.currentbtnTarget.classList.add("btn-secondary")
  }

  show_previous(event) {

    event.preventDefault();

    this.currentTarget.classList.add("d-none")
    this.previousTarget.classList.remove("d-none")

    this.styling_current();
    this.previousbtnTarget.classList.remove("btn-outline-secondary")
    this.previousbtnTarget.classList.add("btn-secondary")
  }

  styling_current(){
    this.currentbtnTarget.classList.remove("btn-secondary")
    this.currentbtnTarget.classList.add("btn-outline-secondary")
  }

  styling_previous(){
    this.previousbtnTarget.classList.remove("btn-secondary")
    this.previousbtnTarget.classList.add("btn-outline-secondary")
  }

  manage_visibility(target1, target2){
    target1.classList.add("d-none")
    target2.classList.remove("d-none")
  }

}
