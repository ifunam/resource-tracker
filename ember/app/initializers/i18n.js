var TRANSLATIONS = {
  'project.key': 'Identificador',
  'project.financing_source': 'Fuente de financiamiento',
  'project.name': 'Nombre',
  'project.sponsor': 'Patrocinador',
  'project.start_date': 'Fecha de inicio',
  'project.end_date': 'Fecha de término',
  'project.authorized_budget': 'Presupuesto autorizado',
  'project.deposited_budget': 'Presupuesto depositado',
  'project.committed_budget': 'Presupuesto comprometido',
  'project.spent_budget': 'Presupuesto gastado',

  'line.key': 'Clave',
  'line.name': 'Partida',
  'line.deposited_budget': 'Presupuesto depositado',
  'line.committed_budget': 'Presupuesto comprometido',
  'line.spent_budget': 'Presupuesto gastado',

  'expenditure.date': 'Fecha',
  'expenditure.motive': 'Motivo',
  'expenditure.amount': 'Cantidad',
  'expenditure.condition': 'Situación'
};

export default {
  name: 'i18n',
  initialize: function() {
    Ember.I18n.locale = 'es';
    Ember.I18n.translations = TRANSLATIONS;
  }
};
