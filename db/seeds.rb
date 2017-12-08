# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DB.each_with_index do |a, i|
  article = Article.create( title: a[:title], content: a[:content], photo: a[:photo], rating: a[:rating] )

  COMMENTS[i].each do |c|
    article.comments.create( content: c )
  end
end