import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function(params) {
    return this.store.find('projects', params.slug);
  },
  afterModel: function() {
    this.set('meta', this.store.metadataFor('line').meta);
  },
  setupController: function(controller, model) {
    controller.set('model', model);
    controller.set('meta', this.get('meta'));
  }
});
