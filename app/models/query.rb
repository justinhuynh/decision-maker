class Query < ActiveRecord::Base
  searchkick
  after_create :set_recommendation

  belongs_to :user
  belongs_to :question
  belongs_to :selected_choice, class_name: "Choice"
  belongs_to :recommended_choice, class_name: "Choice"

  validates :question, presence: true
  validates :rating, numericality: { only_integer: true, allow_nil: true }
  validates :rating, inclusion: { in: 0..10, allow_nil: true }

  delegate :choices, :body, to: :question, prefix: false

  def selected
    selected_choice.description
  end

  def recommended
    recommended_choice.description
  end

  def search_data
    {
      body: question.body,
      choices: question.choices.map(&:description),
      selected_choice: (selected_choice.description unless selected_choice.nil?),
      recommended_choice: (recommended_choice.description unless recommended_choice.nil?),
      user_email: (user.email unless user.nil?),
      user_first_name: (user.first_name unless user.nil?),
      user_last_name: (user.last_name unless user.nil?),
      user_id: (user_id unless user_id.nil?),
      question_id: question_id,
      rating: rating,
      created_at: created_at,
      updated_at: updated_at,
      selected_choice_id: (selected_choice_id unless selected_choice_id.nil?),
      recommended_choice_id: (recommended_choice_id unless recommended_choice_id.nil?)
    }
  end

  private

  def set_recommendation
    recommender = Recommender.new(question)
    update_attributes(recommended_choice: recommender.recommendation)
  end
end
