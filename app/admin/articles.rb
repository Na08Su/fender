ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :title, :body, :picture, :category_id

# CKエディタのカスタマイズ参考
# https://www.anothersky.pw/2012/03/000130.html
  form do |f|
    f.input :title
    f.input :body, :as => :ckeditor
    f.input :picture

    f.input :category_id, :label => "カテゴリ", :as => :select, :collection => Category.all
    f.submit
  end
end
