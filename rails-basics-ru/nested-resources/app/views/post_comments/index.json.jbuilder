# frozen_string_literal: true

json.array! @post_comments, partial: 'post_comments/post_comment', as: :post_comment
