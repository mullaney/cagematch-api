# frozen_string_literal: true

ActiveAdmin.register Team do
  permit_params :name, :tagline, :cagematch_id
end
