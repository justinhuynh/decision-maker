module FillIn
  def fill_in_question
    question = "What should I have for lunch?"
    fill_in "Question", with: question
  end

  def fill_in_answers
    answer_fields = [
      "question_choices_attributes_0_description",
      "question_choices_attributes_1_description",
      "question_choices_attributes_2_description"
    ]

    fill_in answer_fields[0], with: "Valid Option 1"
    fill_in answer_fields[1], with: "Valid Option 2"
    fill_in answer_fields[2], with: "Valid Option 3"
  end
end

RSpec.configure do |config|
  config.include FillIn
end
