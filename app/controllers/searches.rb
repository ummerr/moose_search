get '/search/' do

  erb #search_bar_page
end

get '/search' do

  erb :'searches/all'
end

get '/search/:string' do |string|
    search = Youtube.new
    @result = search.youtube_search(string)
  erb :'searches/all'

end

