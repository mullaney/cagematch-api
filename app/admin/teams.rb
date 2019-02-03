# frozen_string_literal: true

ActiveAdmin.register Team do
  menu parent: 'Cagematch Resources'

  permit_params :name, :tagline, :cagematch_id
end
