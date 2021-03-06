ActiveAdmin.register Post do
  permit_params :title, :content, :photo

  form partial: 'form'

  show do |t|
    attributes_table do
      row :title
      row :content
      row :photo do |ad|
        image_tag url_for(ad.photo) if ad.photo.attached?
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :photo, as: :file
    end
    f.actions
  end
end
