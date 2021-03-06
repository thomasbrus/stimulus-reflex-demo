class Todo < ApplicationRecord
  belongs_to :todo_list, required: false
  belongs_to :assignee, required: false

  scope :completed, -> { where.not(completed_at: nil) }
  scope :not_completed, -> { where(completed_at: nil) }

  def completed?
    completed_at.present?
  end

  def completed=(value)
    self.completed_at = value ? Time.now : nil
  end
end
