json.extract! product, :name, :tagline, :url, :id

json.user do
  json.extract! product.user, :avatar_url
end

json.up_votes product.votes_for.count

if user_signed_in?
  json.up_voted current_user.voted_for? product
end
