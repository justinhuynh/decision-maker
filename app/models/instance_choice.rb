class InstanceChoice < ActiveRecord::Base
  belongs_to :instance
  belongs_to :choice

  validates :instance, presence: true
  validates :choice, presence: true

  validates :instance_id, uniqueness: { scope: :choice_id }

  accepts_nested_attributes_for :choice
end
