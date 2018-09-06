class Article < ApplicationRecord
  validates :title,       presence: true, length: { maximum: 40 }
  validates :body,        presence: true
  validates :category_id, presence: true

  mount_uploader :picture, PictureUploader
  validate  :picture_size # カスタムバリデーション

  belongs_to :category


  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 2.megabytes
        errors.add(:picture, "2MB以下にしてください(容量設定可能)")
      end
    end

end
