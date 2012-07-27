(function(){
  jQuery.fn.tap = function(fn /* [callback_arg], [callback_arg], [...] */) {
    var args = jQuery.makeArray(arguments);
    args.unshift();

    fn.apply(this, args);
    return this;
  };
}());

var $selected;

$(function() {
  $("#show a").click(function() {
    $(this).siblings().removeClass("current");
    $(this).addClass("current");
    $selected = $(this);

    var category = $(this).attr("data-category");
    var count;
    if(category) {
      $("#leader-board tr").hide();
      $("#leader-board tr." + category).show()
        .tap(function() { count = this.length; })
        .removeClass("even").filter("tr:odd").addClass("even");
    } else {
      $("#leader-board tr").show()
        .tap(function() { count = this.length; })
        .removeClass("even").filter("tr:odd").addClass("even");
    }
    $("#teams_count").html(count + " Teams");

    return false;
  });

  $selected = $("#show a:first-child");
  $selected.click();
  pickLeaders();
  pickWinners();

  // window.setInterval("refreshLeaderBoard()", 60 * 1000);
});

function refreshLeaderBoard() {
  $("#teams").load("/leader-board.js", function() {
    $selected.click();
    pickLeaders();
  });
}

function pickLeaders() {
  var a_leader = $("#leader-board tr.A").first().find("td:nth-child(3)").text();
  var b_leader = $("#leader-board tr.B").first().find("td:nth-child(3)").text();
  var m_leader = $("#leader-board tr.M").first().find("td:nth-child(3)").text();
  var f_leader = $("#leader-board tr.F").first().find("td:nth-child(3)").text();
  var t_leader = $("#leader-board tr.T").first().find("td:nth-child(3)").text();
  
  $("#a_leader").html(a_leader);
  $("#b_leader").html(b_leader);
  $("#m_leader").html(m_leader);
  $("#f_leader").html(f_leader);
  $("#t_leader").html(t_leader);
}

function pickWinners() {
  var a_winners = $("#leader-board tr.A").slice(0, 3).find("td:nth-child(3)").map(function() { return $(this).text(); }).toArray();
  var b_winners = $("#leader-board tr.B").slice(0, 3).find("td:nth-child(3)").map(function() { return $(this).text(); }).toArray();
  var s_winners = $("#leader-board tr.S").slice(0, 3).find("td:nth-child(3)").map(function() { return $(this).text(); }).toArray();
  var m_winners = $("#leader-board tr.M").slice(0, 3).find("td:nth-child(3)").map(function() { return $(this).text(); }).toArray();
  var f_winners = $("#leader-board tr.F").slice(0, 3).find("td:nth-child(3)").map(function() { return $(this).text(); }).toArray();
  var t_winners = $("#leader-board tr.T").slice(0, 3).find("td:nth-child(3)").map(function() { return $(this).text(); }).toArray();
  
  $("#a_winners").html("<b>" + a_winners.join("</b><br/><b>") + "</b>");
  $("#b_winners").html("<b>" + b_winners.join("</b><br/><b>") + "</b>");
  $("#s_winners").html("<b>" + s_winners.join("</b><br/><b>") + "</b>");
  $("#m_winners").html("<b>" + m_winners.join("</b><br/><b>") + "</b>");
  $("#f_winners").html("<b>" + f_winners.join("</b><br/><b>") + "</b>");
  $("#t_winners").html("<b>" + t_winners.join("</b><br/><b>") + "</b>");
}
