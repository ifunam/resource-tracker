import Ember from 'ember';

export default Ember.Route.extend({
  afterModel: function(model, transition) {
    return model.get('expenditures').then(function(result) {
      this.set('expenditures', result.content);
    }.bind(this));

  },
  setupController: function(controller, model) {
    this._super(controller, model);
    controller.set('meta', this.store.metadataFor('expenditure').meta);
  }
});
