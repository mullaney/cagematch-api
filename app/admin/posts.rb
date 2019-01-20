ActiveAdmin.register Post do
  permit_params :title, :author, :category, :text, :cagematch_id, :published_at, :admin_user_id

  filter :cagematch
  filter :title
  filter :author
  filter :published_at
  filter :created_at

  scope :all
  scope :published
  scope :unpublished

  action_item :publish, only: :show do
    link_to "Publish", publish_admin_post_path(post), method: :put unless post.published_at?
  end

  action_item :unpublish, only: :show do
    link_to "Unpublish", unpublish_admin_post_path(post), method: :put if post.published_at?
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

  form title: 'Create/Edit a blog post' do |f|
    f.object.admin_user ||= current_admin_user
    f.object.category ||= 'main'
    f.object.cagematch_id = 1
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
            collection: Post.select(:category).distinct.collect { |post| post.category }
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
