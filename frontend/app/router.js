import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.resource('projects', function() {
    this.route('show', {path: ':project_id'}, function() {
      this.resource('lines');
      this.resource('lines.show', {path: 'lines/:line_id'}, function() {
        this.resource('expenditures');
      });
    });
  });

});

export default Router;
