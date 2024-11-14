class Task < ApplicationRecord
  belongs_to :project

  enum status: { pending: 0, in_progress: 1, completed: 8 }

  before_save :set_progress_based_on_status
  
  
  private

  def set_progress_based_on_status
    if status == "pending"
      self.progress = 0
    elsif status == "in_progress" && progress < 1
      self.progress = 1
    elsif status == "in_progress" && progress > 7
      self.progress = 7
    elsif status == "completed"
      self.progress = 8
    end
  end
end
