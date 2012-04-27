(function() {

  $(function() {
    return $(".ratelink").click(function() {
      var clicked_link, theid;
      clicked_link = $(this);
      theid = $(this).attr("theid");
      $.ajax({
        type: "POST",
        url: "/videos/" + theid + "/vote_up",
        dataType: "text",
        success: function(output) {
          return clicked_link.parent().parent().find(".vote_tally").empty().append(output);
        }
      });
      return false;
    });
  });

}).call(this);
