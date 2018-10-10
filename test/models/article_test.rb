# == Schema Information
#
# Table name: articles
#
#  id                :bigint(8)        not null, primary key
#  title             :string(255)
#  body              :text(65535)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  picture           :string(255)
#  category_id       :bigint(8)
#  desc              :text(65535)
#  impressions_count :integer          default(0)
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
