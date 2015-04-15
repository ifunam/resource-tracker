import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function(params) {
    return this.store.find('projects', params.slug);
  },
  afterModel: function() {
    console.log(this.store.metadataFor('expenditure').meta);
    this.set('meta', this.store.metadataFor('expenditure').meta);
  },
  setupController: function(controller, model) {
    controller.set('model', model);
    controller.set('meta', this.get('meta'));
  }
});
