# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  picture     :string
#  category_id :integer
#

class Article < ApplicationRecord
  # pv
  is_impressionable

  # validation
  validates :title,       presence: true, length: { maximum: 40 }
  validates :body,        presence: true
  validates :category_id, presence: true

  # 画像アップ
  mount_uploader :picture, PictureUploader
  validate  :picture_size # カスタムバリデーション

  # アソシエーション
  belongs_to :category

  # タグ
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :label


  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 2.megabytes
        errors.add(:picture, "2MB以下にしてください(容量設定可能)")
      end
    end

end
