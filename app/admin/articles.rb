ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :title, :body, :picture, :category_id, :label_list

# CKエディタのカスタマイズ参考
# https://www.anothersky.pw/2012/03/000130.html
  form do |f|
    f.input :title
    f.input :body, :as => :ckeditor
    f.input :label_list, :label => '関連するタグ(,カンマ区切り)'
    f.input :picture
    # アソシエーションのセレクト https://stackoverflow.com/questions/15491789/rails-activeadmin-custom-association-select-box
    f.input :category_id, :label => "カテゴリ", :as => :select, :collection => Category.all
    f.submit
  end
  # binding.pry
end
