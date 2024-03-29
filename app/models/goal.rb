# == Schema Information
#
# Table name: goals
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  body         :text
#  author_id    :integer          not null
#  is_private   :boolean          default(FALSE), not null
#  is_completed :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Goal < ActiveRecord::Base
  attr_accessible :title, :body, :author_id, :is_private

  validates :title, :author, presence: true
  validates :is_completed, :is_private, inclusion: { in: [true, false] }, allow_nil: true

  belongs_to :author, class_name: "User", foreign_key: :author_id, inverse_of: :goals

  def private?
    self.is_private
  end

  def completed?
    self.is_completed
  end

end
