import Ember from 'ember';
import startApp from '../../tests/helpers/start-app';

var App;

startApp.module('Integration - About Page', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, 'destroy');
  }
});

startApp.test('Should welcome me to Resource Tracker Ember', function() {
  visit('/').then(function() {
    click("a:contains('About')").then(function() {
      startApp.equal(find('h3').text(), 'About');
    });
  });
});
