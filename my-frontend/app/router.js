import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType,
  redirect: function () {
    this.transitionTo('projects');
  }
});

Router.map(function() {
  this.route('application');
  this.resource('projects', function() {
    this.route('show', {path: ':project_id'});
    this.resource('lines', function() {
      this.route('show', {path: ':line_id'});
    });
  });
  this.route('login');
});

export default Router;
