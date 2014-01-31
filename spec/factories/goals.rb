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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
  end
end
