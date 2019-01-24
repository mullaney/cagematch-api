# frozen_string_literal: true

ActiveAdmin.register Fight do
  permit_params :tagline, :cagematch_id, :season, :notes,
                :start_time, :is_exhibition, :winner_id

  filter :season
  filter :cagematch

  index do
    id_column
    column :cagematch
    column :season
    column :start_time
    column :winner
    column :is_exhibition
    actions
  end

  form do |f|
    f.object.cagematch_id ||= 1
    f.object.start_time ||= f.object.last_start_time + 7.days
    inputs 'Details' do
      input :season
      input :start_time
      input :tagline
      input :notes
    end
    actions
  end
end
