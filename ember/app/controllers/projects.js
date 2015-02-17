import Ember from 'ember';

export default Ember.Controller.extend({
  loadingMore: false,
  page: 1,
  total_pages: null,
  hasMore: (function() {
    Ember.Logger.log(this.get('total_pages'));
    return this.get('page') < this.get('total_pages');
  }).property('page', 'total_pages'),

  actions: {
    loadMore: function() {
      var _this = this;
      var query = {
        page: this.get('page') + 1,
      };
      this.set('loadingMore', true);
      this.get('store').find('project', query).then(function(data) {
        _this.set('loadingMore', false);
        _this.get('model').pushObjects(data.get('model'));
        _this.incrementProperty('page');
        _this.set('total_pages', data.get('meta.total_pages'));
      }, function() {
        _this.set('loadingMore', false);
      });

    }
  }
});
