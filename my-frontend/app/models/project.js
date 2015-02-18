import DS from 'ember-data';

export default DS.Model.extend({
  key: DS.attr('string'),
  financing_source: DS.attr('string'),
  name: DS.attr('string'),
  sponsor: DS.attr('string'),
  start_date: DS.attr('date'),
  end_date: DS.attr('date'),
  authorized_budget: DS.attr('string'),
  deposited_budget: DS.attr('string'),
  committed_budget: DS.attr('string'),
  spent_budget: DS.attr('string'),

  lines: DS.hasMany('line', {async: true})
});
