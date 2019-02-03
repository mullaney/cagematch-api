# frozen_string_literal: true

ActiveAdmin.register Season do
  menu parent: 'Cagematch Resources'

  permit_params :name, :cagematch_id
end
