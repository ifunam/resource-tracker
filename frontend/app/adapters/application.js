import DS from 'ember-data';
export default DS.RESTAdapter.extend({
  namespace: 'api/v1'
  // host: 'https://presupuestos.fisica.unam.mx:443'
});

