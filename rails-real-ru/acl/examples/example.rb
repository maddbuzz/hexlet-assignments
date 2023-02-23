# gem "pundit"

# rails g pundit:install

# class ApplicationController < ActionController::Base
#   include Pundit::Authorization
# end

# class PostPolicy
#   attr_reader :user, :post

#   def initialize(user, post)
#     @user = user
#     @post = post
#   end

#   def update?
#     user.admin? || !post.published?
#   end
# end

# или

# class PostPolicy < ApplicationPolicy
#   def update?
#     user.admin? || !record.published?
#   end
# end

# class PostsController < ActionController
#   def update
#     @post = Post.find(params[:id])
#     authorize @post
#     if @post.update(post_params)
#       redirect_to @post
#     else
#       render :edit
#     end
#   end

# Вторым параметром можно передать имя привилегии, которое нужно проверить, если имя экшена отличается
# def publish
#   @post = Post.find(params[:id])
#   authorize @post, :update?
#   @post.publish!
#   redirect_to @post
# end
# end


# Если нет конкретного инстанса для которого нужно проверить права, можно проверить права по имени класса
# class PostPolicy < ApplicationPolicy
#   def admin_list?
#     user.admin?
#   end
# end

# def admin_list
#   authorize Post # we don't have a particular post to authorize
#   # Rest of controller action
# end

# Использование политики в шаблоне
# <% if policy(@post).update? %>
#   <%= link_to "Edit post", edit_post_path(@post) %>
# <% end %>

# <% if policy(Post).new? %>
#   <%= link_to "Create post", new_post_path %>
# <% end %>
