# frozen_string_literal: true

# app/admin/posts.rb
ActiveAdmin.register Post do
  permit_params :title, :author, :category, :text, :cagematch_id,
                :published_at, :admin_user_id

  filter :cagematch
  filter :title
  filter :author
  filter :published_at
  filter :created_at

  scope :all
  scope :published
  scope :unpublished

  action_item :publish, only: :show do
    unless post.published_at?
      link_to 'Publish', publish_admin_post_path(post), method: :put
    end
  end

  action_item :unpublish, only: :show do
    if post.published_at?
      link_to 'Unpublish', unpublish_admin_post_path(post), method: :put
    end
  end

  index do
    id_column
    column :cagematch
    column :title
    column :author
    column :excerpt
    column :published_at
    column :created_at
    actions
  end

  form do |f|
    f.object.admin_user ||= current_admin_user
    f.object.category ||= 'main'
    f.object.cagematch_id ||= 1
    inputs 'Details' do
      input :cagematch
      input :title
      input :author
      input :text
      input :admin_user_id,
            as: :select,
            collection: AdminUser.all.collect { |user| [user.email, user.id] }
      input :category,
            as: :select,
            collection: Post.select(:category).distinct.collect(&:category)
    end
    actions
  end

  member_action :publish, method: :put do
    post = Post.find(params[:id])
    post.update(published_at: Time.zone.now)
    redirect_to admin_post_path
  end

  member_action :unpublish, method: :put do
    post = Post.find(params[:id])
    post.update(published_at: nil)
    redirect_to admin_post_path
  end
end
