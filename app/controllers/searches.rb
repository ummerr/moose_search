get '/search/?' do
  if current_user
    erb :'search/main'
  else
    redirect "/"
  end
end



post '/search' do
  if current_user
    @new_search = Search.create(params[:search])
    current_user.searches << @new_search
    redirect "/search/#{@new_search.id}"
  else
    redirect "/"
  end

end

get '/search/all' do
  if current_user
    user = User.find(current_user[:id])
    @searches = []
    user.searches.all_by_date.each do |search|
      @searches << search
    end
    erb :'search/all'
  else
    redirect "/"
  end

end

get '/search/:id' do |id|
  if current_user
    @search = Search.find(id)
    erb :'search/show'
  else
    redirect "/"
  end
end

delete '/search/:id' do |id|

  if current_user
    @search = Search.find(id)
    @search.destroy
    redirect "/search/all"
  else
    redirect "/"
  end

end




