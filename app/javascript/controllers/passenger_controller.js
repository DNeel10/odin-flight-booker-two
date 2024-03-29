import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static targets = ["passengerInfo", "passengerRows", "passengerOutput"]
  static values = { passengerCount: Number }

  connect() {
    console.log(this.passengerCountValue)
  }

  add(e) {
    e.preventDefault;

    this.passengerCountValue++;
    const content = this.passengerRowsTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime().toString());
    this.passengerOutputTarget.insertAdjacentHTML('beforeend', content)
  }

  remove(e) {
    e.preventDefault

    if (this.passengerCountValue > 1) {
      this.passengerCountValue--;
      this.passengerInfoTarget.remove();
    } else {
      alert("You must have at least one passenger")
    }
  }
}
