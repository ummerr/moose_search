get '/search/?' do

  erb :'search/main'
end



post '/search' do
  @new_search = Search.create(params[:search])
  current_user.searches << @new_search

  redirect "/search/#{@new_search.id}"
end

get '/search/all' do
  @user = User.find(current_user[:id])

  @searches = @user.searches
  erb :'search/all'
end

get '/search/:id' do |id|
  p params
  @search = Search.find(id)
  erb :'search/show'
end




