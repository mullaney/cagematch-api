# frozen_string_literal: true

ActiveAdmin.register Cagematch do
  menu parent: 'Cagematch Resources'

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
