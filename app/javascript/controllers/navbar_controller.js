import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'menu' ];

  toggleMobileMenu(event) {
    this.menuTarget.classList.toggle('hidden');

    event.preventDefault();
  }
}
