import DS from 'ember-data';

export default DS.Model.extend({
  key: DS.attr('string'),
  name: DS.attr('string'),
  deposited_budget: DS.attr('string'),
  committed_budget: DS.attr('string'),
  spent_budget: DS.attr('string'),

  project: DS.belongsTo('project'),
});
