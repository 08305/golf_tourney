window.GolfTournament = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    GolfTournament.players = new GolfTournament.Collections.Players();
    GolfTournament.users.fetch({
      success: function() {
        new GolfTournament.Routers.Router({
          $rootEl: $("#content"),
          players: GolfTournament.players
        });
        Backbone.history.start();
      }
    });
  }
};
