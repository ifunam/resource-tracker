import Ember from 'ember';

export default Ember.ObjectController.extend({
  model: function(params) {
    return this.store.fetchById('project', params.slug);
  }
});
