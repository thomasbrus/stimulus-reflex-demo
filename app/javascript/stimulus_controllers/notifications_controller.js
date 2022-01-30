import ApplicationController from './application_controller';

export default class extends ApplicationController {
  static targets = ['template'];

  add(message) {
    this.element.appendChild(this.templateTarget.content.cloneNode(true));

    $(this.element.lastElementChild)
      .html((_, html) => html.replace('{{message}}', message))
      .slideDown();
  }
}
