ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

  ActiveAdmin.register Article do
    permit_params :title, :body, :picture
  end

  form do |f|
    f.input :title
    f.input :body, :as => :ckeditor
    f.input :picture
    f.submit
  end
end