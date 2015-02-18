import DS from 'ember-data';

export default DS.Model.extend({
  date: DS.attr('date'),
  name: DS.attr('string'),
  motive: DS.attr('string'),
  amount: DS.attr('string'),
  condition: DS.attr('string'),

  line: DS.belongsTo('line'),
});
