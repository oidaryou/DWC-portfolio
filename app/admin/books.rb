ActiveAdmin.register Book do
  permit_params :genre_id, :title, :synopsis, :image

  form do |f|
    f.inputs do
      f.input :genre_id
      f.input :title
      f.input :synopsis
      f.attachment_field :image
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :genre_id, :synopsis, :image_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :genre_id, :synopsis, :image_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
