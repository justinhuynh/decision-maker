var selectedChoiceId;
var count = 0;

$(".choice-panel").on("click", function(event) {
  event.preventDefault();
  if ($(this).hasClass("selected")) {
    $(this).removeClass("selected");
  } else {
    $(".choice-panel").removeClass("selected");
    $(this).addClass("selected");
  }
  selectedChoiceId = $(this).attr("id");
});

$(".submit-query").on("click", function(event) {
  event.preventDefault();
  var questionId = $(this).data("questionId");
  var queryId = $(this).data("queryId");
  var rating = $("input#query_rating").val();
  var request = $.ajax({
    method: "POST",
    url: ("/questions/" + questionId + "/queries/" + queryId),
    data: {
      query: {
        selected_choice_id: selectedChoiceId,
        rating: rating
      },
      _method: "PATCH"
    },
    dataType: "json"
  });
  request.success(function(data) {
    count++;
    var flashMessage = $("<div>", {
      class: "small-12 small-centered columns flash flash-success",
      text: data.message + " (" + count + ")\nSelection: " + data.choice + ", Rating: " + data.rating
    });
    var flashContainer = $(".flash-container");
    flashContainer.empty();
    flashMessage.appendTo(flashContainer);
  });
});
