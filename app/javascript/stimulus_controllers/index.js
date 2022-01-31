import { application } from './application';
import ApplicationController from './application_controller';
import NotificationController from './notification_controller';
import NotificationsController from './notifications_controller';
import StimulusReflex from 'stimulus_reflex';

application.register('notification', NotificationController);
application.register('notifications', NotificationsController);

StimulusReflex.initialize(application, { controller: ApplicationController, isolate: true, debug: true });
