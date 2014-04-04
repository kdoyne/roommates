

var addUserToHouse = function() {

  var addDiv = function(){
    $("span#join_house").after("<div id=house>");
    $("div#house").append("<input id=find_house>")
      .append("<button>Submit</button>");
    $("button").on("click", search)
  };

  var search = function(){
    var data = {
      query: $("input").val()
    } 
    $.ajax({ url:"/houses",data: data}).done(function(response){
      console.log(response.street_address)
      $("div#house").after("<ul>");
      $("ul").after("<li>");
      $("li").text(response.street_address +", "+ response.city +", "+ response.state)
        .append($("<button id='confirm'>Confirm</button>"));
        $("button#confirm").on("click", addHouse)
      });
  }

  var render = function(){
    addDiv();
  };

  $("span#join_house").on("click", render)

}
