import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {

  static targets = [ "startDate", "endDate", "total", "price" ]

  connect() {

    flatpickr(this.startDateTarget, {})
    flatpickr(this.endDateTarget, {})

    console.log("stimulus trigegred");
    console.log("value " & this.startDateTarget.value);
  }

  // to add disconnect function in case of performace issues

  calculate() {
    const startDate = new Date(this.startDateTarget.value);
    const endDate = new Date(this.endDateTarget.value);

    if ( !isNaN(startDate) && ! isNaN(endDate)) {

      const diff = endDate - startDate;
      const daysDiff = Math.round(
        diff /  (1000 * 60 * 60 * 24)
      )
      const value = daysDiff * parseInt(this.priceTarget.innerText,10);
      this.totalTarget.innerText =  `Total will be ${daysDiff} days x ${this.priceTarget.innerText} price/day = ${value}`;
      this.totalTarget.classList.remove("d-none")
    }
  }
}
