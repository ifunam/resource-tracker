import DS from 'ember-data';

export default DS.Model.extend({
  key: DS.attr('string'),
  financing_source: DS.attr('string'),
  name: DS.attr('string'),
  agreement: DS.attr('string'),
  sponsor_abbrev: DS.attr('string'),
  sponsor_name: DS.attr('string'),
  start_date: DS.attr('date'),
  end_date: DS.attr('date'),
  authorized_budget: DS.attr('string'),
  deposited_budget: DS.attr('string'),
  committed_budget: DS.attr('string'),
  spent_budget: DS.attr('string'),
  sponsor_full_name: DS.attr('string'),
  agreement_and_name: DS.attr('string'),
  lines: DS.hasMany('line', {async: true}),
  has_lines: DS.attr('boolean')
});
