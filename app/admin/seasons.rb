# frozen_string_literal: true

ActiveAdmin.register Season do
  permit_params :name, :cagematch_id
end
