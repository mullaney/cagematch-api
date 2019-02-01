# frozen_string_literal: true

ActiveAdmin.register Fight do
  permit_params :tagline, :cagematch_id, :season_id, :notes,
                :start_time, :is_exhibition, :winner_id

  filter :season
  filter :cagematch

  index do
    id_column
    column :cagematch
    column :season
    column :start_time
    column :location
    column :winner
    actions
  end

  form do |f|
    f.object.cagematch_id ||= 1
    f.object.start_time ||= f.object.last_fight.start_time + 7.days
    f.object.is_exhibition ||= false
    f.object.location ||= f.object.last_fight.location
    f.object.season_id ||= f.object.last_fight.season_id
    inputs 'Details' do
      input :season
      input :start_time
      input :tagline
      input :notes
      input :is_exhibition
      input :location
    end
    actions
  end
end
