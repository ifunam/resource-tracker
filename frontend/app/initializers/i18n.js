import Ember from 'ember';

var TRANSLATIONS = {
  'project.key': 'Identificador',
  'project.financing_source': 'Fuente de financiamiento',
  'project.name': 'Nombre',
  'project.agreement': 'Convenio',
  'project.sponsor_name': 'Patrocinador',
  'project.sponsor_abbrev': 'Patrocinador',
  'project.start_date': 'Fecha de inicio',
  'project.end_date': 'Fecha de término',
  'project.authorized_budget': 'Presupuesto autorizado',
  'project.deposited_budget': 'Presupuesto depositado',
  'project.committed_budget': 'Presupuesto comprometido',
  'project.spent_budget': 'Presupuesto gastado',
  'project.balance': 'Saldo',
  'project.agreement_and_name': 'Proyecto',
  'project.sponsor_full_name': 'Patrocinador',
  'project.one': 'Información del proyecto',
  'project.others': 'Proyectos vigentes',

  'line.key': 'Partida',
  'line.name': 'Nombre',
  'line.deposited_budget': 'Presupuesto depositado',
  'line.committed_budget': 'Presupuesto comprometido',
  'line.spent_budget': 'Presupuesto gastado',
  'line.key_and_name': 'Partida',
  'line.one': 'Información de la partida',
  'line.others': 'Partidas',

  'expenditure.date': 'Fecha',
  'expenditure.motive': 'Motivo',
  'expenditure.amount': 'Cantidad',
  'expenditure.status': 'Situación',
  'expenditure.one': 'Gasto',
  'expenditure.other': 'Gastos',

  'user.login': 'Usuario',
  'user.password': 'Contraseña',
  'user.actions.login': 'Entrar',
  'user.actions.logout': 'Salir',

  'actions.back': 'Regresar'
};

export default {
  name: 'i18n',
  initialize: function() {
    Ember.I18n.locale = 'es';
    Ember.I18n.translations = TRANSLATIONS;
  }
};
