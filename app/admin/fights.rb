# frozen_string_literal: true

ActiveAdmin.register Fight do
  menu parent: 'Cagematch Resources'

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
    f.inputs 'Details' do
      f.input :season
      f.input :start_time
      f.input :tagline, hint: 'Optional: a subtitle for a particular fight, i.e. The Rumble in the Jungle'
      f.input :notes
      f.input :is_exhibition, hint: 'For fights that should not end up in the regular season stats'
      f.input :location
      f.input :winner_id,
              as: :select, collection: Team.order('lower(name) ASC').map { |t| [t.name, t.id] },
              label: 'Winner',
              hint: 'If the winner is from the previous week, leave this blank'
    end
    actions
  end
end
