# Отображаемые поля: id, email, address, 
# full_name (состоит из полей first_name и last_name разделённых пробелом)
# и posts
json.extract! user, :id, :email, :address
json.full_name "#{user.first_name} #{user.last_name}"
# json.posts user.posts, :id, :title
json.posts(user.posts, partial: 'api/v1/users/posts', as: :post)
