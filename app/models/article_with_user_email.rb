class ArticleWithUserEmail < ActiveType::Object
  attribute :user_id
  attribute :user_email
  attribute :title
  attribute :body
end
