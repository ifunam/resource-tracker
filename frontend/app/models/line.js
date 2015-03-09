import DS from 'ember-data';

export default DS.Model.extend({
  key: DS.attr('string'),
  name: DS.attr('string'),
  deposited_budget: DS.attr('string'),
  committed_budget: DS.attr('string'),
  spent_budget: DS.attr('string'),
  key_and_name: DS.attr('string'),

  project: DS.belongsTo('project'),
  expenditures: DS.hasMany('expenditure', {async: true}),
  has_expenditures: DS.attr('boolean')
});
