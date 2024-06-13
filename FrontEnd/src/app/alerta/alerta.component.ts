import { CommonModule } from '@angular/common';
import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-bootstrap-toast',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="position-fixed bottom-0 end-0 p-3 custom-toast" style="z-index: 11">
      <div class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
          <img src="..." class="rounded me-2" alt="...">
          <strong class="me-auto">{{ title }}</strong>
          <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
          {{ message }}
        </div>
      </div>
    </div>
  `,
  styleUrls: []
})
export class AlertaComponent {
  @Input() title: string = 'Bootstrap';
  @Input() message: string = 'Hello, world! This is a toast message.';
  time: string = '11 mins ago';

  constructor() { }

  show(): void {
    const toast = document.getElementById('liveToast');
    if (toast) {
      toast.classList.add('show');
    }
  }

  hide(): void {
    const toast = document.getElementById('liveToast');
    if (toast) {
      toast.classList.remove('show');
    }
  }
}
