get '/search' do

  erb :'search/main'
end

get '/search/:id' do
  @search = Search.find(id)
  erb :'search/show'
end

post '/search' do
  new_search = Search.new(params[:search])
  current_user.searches << new_search

  redirect '/search/#{new_search.id}'
end

# get '/search/:name' do
#   @
# end

get '/search/all' do
  @searches = Search.all

  erb :'search/all'
end
