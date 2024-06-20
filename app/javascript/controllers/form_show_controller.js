import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-edit"
export default class extends Controller {
  static targets = ["showForm"]

  connect() {
  }

  activar() {
    console.log('funcionando');
    this.showFormTarget.classList.toggle("d-none")
  }
}
