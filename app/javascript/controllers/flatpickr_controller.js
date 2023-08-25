import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {

  static targets = [ "startDate", "endDate" ]

  connect() {

    flatpickr(this.startDateTarget, {})
    flatpickr(this.endDateTarget, {})

    console.log("stimulus trigegred");
    console.log("value " & this.startDateTarget.value);
  }

  calculate_age(){
    console.log("calculate...");
  }
}
