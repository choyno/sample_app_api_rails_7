json.array! @posts  do |post|
  json.title post.title
  json.desciption post.description
end
