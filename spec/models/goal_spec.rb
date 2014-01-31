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

require 'spec_helper'

describe Goal do
  pending "add some examples to (or delete) #{__FILE__}"
end
