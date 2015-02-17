import Ember from 'ember';
import startApp from '../../tests/helpers/start-app';

var App;

startApp.module('Integration - Landing Page', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, 'destroy');
  }
});

startApp.test('Should welcome me to Resource Tracker Ember', function() {
  visit('/').then(function() {
    startApp.equal(find('h2#title').text(), 'Welcome to Resource Tracker Ember');
  });
});

startApp.test('Should allow navigating back to root from another page', function() {
  visit('/about').then(function() {
    click('a:contains("Home")').then(function() {
      startApp.notEqual(find('h3').text(), 'About');
    });
  });
});
