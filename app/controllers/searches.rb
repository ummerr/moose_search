get '/search' do

  erb :'search/main'
end

get '/search/:id' do
  erb :'search/show'
end

post '/search' do
  new_search = Search.new(params[:search])
  current_user.searches << new_search
  @search = Search.find(new_search.id)

  redirect '/search/#{new_search.id}'
end

# get '/search/:name' do
#   @
# end

get '/search/all' do
  @searches = Search.all

  erb :'search/all'
end
