get '/search' do

  erb #search_bar_page
end

get '/search/:id' do

  erb :'search/show'
end

get '/search/all' do

  erb :'search/'
end
