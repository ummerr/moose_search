get '/search' do

  erb :'search/main'
end

get '/search/:id' do
  @search = Search.find(id: params[:id])
  erb :'search/show'
end

post '/search' do
  new_search = Search.create(params[:search])
  current_user.searches << new_search

  redirect '/search/#{new_search.id}'
end

get '/search/all' do
  @searches = current_user.searches
  erb :'search/all'
end
