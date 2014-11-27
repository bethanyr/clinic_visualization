app = angular.module("CV", ["ngRoute", "ngResource", "ui.bootstrap"] )

app.config([
  "$httpProvider", function(provider) {
    return provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
]);