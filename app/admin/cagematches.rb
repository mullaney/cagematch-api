ActiveAdmin.register Cagematch do
  permit_params :title, :slug, :description

  filter :title
  filter :slug

  index do
    id_column
    column :title
    column :slug
    actions
  end
end
