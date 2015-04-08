import Ember from 'ember';
import DS from 'ember-data';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';
import config from './config/environment';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: config.modulePrefix,
  podModulePrefix: config.podModulePrefix,
  Resolver: Resolver,
  ApplicationSerializer: DS.ActiveModelSerializer.extend({})
});

Ember.Handlebars.registerBoundHelper('formatted-date', function(value) {
  return moment(value).format('YYYY-MM-DD');
});

Ember.Handlebars.registerBoundHelper('current-date', function() {
  return moment().format('YYYY-MM-DD');
});

Ember.Handlebars.registerBoundHelper('current-year', function() {
  return moment().format('YYYY');
});

loadInitializers(App, config.modulePrefix);

export default App;
