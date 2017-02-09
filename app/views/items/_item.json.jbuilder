json.extract! item, :name, :description, :photo, :id

json.user do
  json.extract! item.user, :photo
end

json.up_votes item.votes_for.count

if user_signed_in?
  json.up_voted current_user.voted_for? item
end
