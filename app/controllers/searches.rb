get '/search' do

  erb :'search/main'
end

get '/search/:id' do

  erb :'search/show'
end

get '/search/all' do

  erb :'search/'
end
