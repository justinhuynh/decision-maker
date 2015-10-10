var choiceRowCount = 1;

$(".answer-choices").on("click", ".add-choice", function(event) {
  event.preventDefault();
  choiceRowCount++;
  var newChoiceRow = '<div class="row collapse choice-row"><div class="small-2 large-1 columns"><a href="#" class="button prefix round remove-choice alert">-</a></div><div class="small-8 large-10 columns"><input placeholder="Enter an answer choice" type="text" name="question[choices_attributes][' + choiceRowCount + '][description]" id="question_choices_attributes_'+ choiceRowCount + '_description" /></div><div class="small-2 large-1 columns"><a href="#" class="button postfix round add-choice success">+</a></div></div>';
  $(newChoiceRow).hide().appendTo(".answer-choices").slideDown();//.fadeIn(300);
});

$(".answer-choices").on("click", ".remove-choice", function(event) {
  event.preventDefault();
  $(this).closest(".choice-row").slideUp();
});

$(".enter-question").on("click", function(event) {
  event.preventDefault();
  $(".init-choice-row").each(function(index) {
    $(this).slideDown();//.delay(400*index).fadeIn(300);
  });
});
