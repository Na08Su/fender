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

class Article < ApplicationRecord
  # pv
  is_impressionable counter_cache: true

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
      if picture.size > 1.megabytes
        errors.add(:picture, "1MB以下にしてください(容量設定可能)")
      end
    end

end
