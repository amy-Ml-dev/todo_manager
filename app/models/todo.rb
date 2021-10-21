class Todo < ActiveRecord::Base
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true
  belongs_to :user

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def due_today?
    due_date == Date.today
  end

  def self.overdue
    where("due_date < ? and completed= ?", Date.today, false)
  end
  def self.completed
    where(completed: true)
  end
  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end
end
