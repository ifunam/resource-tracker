import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return this.store.find('project');
  },
  actions: {
    error: function(response) {
      if (response.jqXHR.status === 423) {
        return this.transitionTo('login');
      }
    }
  }
});

