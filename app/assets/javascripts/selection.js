var selectedChoiceId;
var count = 0;

$(".main-content-container").on("click", ".choice-panel", function(event) {
  event.preventDefault();
  if ($(this).hasClass("selected")) {
    $(this).removeClass("selected");
  } else {
    $(".choice-panel").removeClass("selected");
    $(this).addClass("selected");
  }
  selectedChoiceId = $(this).attr("id");
});

$(".main-content-container").on("click", ".submit-query", function(event) {
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
    }
  });
});
