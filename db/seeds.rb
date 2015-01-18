# 10.times do
#   e = User.new({name: Faker::Internet.user_name, email: Faker::Internet.safe_email})
#   3.times do
#     e.searches << Search.create({term: Faker::Address.state, youtube_url: "https://www.youtube.com/watch?v=XYQK3VAUN9Y", tweet_url: "https://twitter.com/AGoldmund/status/537332650537914368", reddit_url: "www.reddit.com"})
#   end
#   e.save
# end


# 11.times do
#   e = Entry.new({title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(50), author: Faker::Name.name})
#     3.times do
#      e.tags << Tag.find_or_create_by({tag_name: Faker::Hacker.adjective})
#     end
#     e.tags << Tag.find_or_create_by({tag_name: 'dAvi_dEnKo'})
#     e.tags = e.tags.uniq
#   e.save
# end
