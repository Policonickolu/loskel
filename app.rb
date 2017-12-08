require "sinatra"
require "sinatra/activerecord"

require_relative "database"

require "./models/article"
require "./models/comment"

enable :sessions

set :database, {adapter: "sqlite3", database: "postapp"}



["/", "/articles"].each do |path|
  get path do

    @articles = Article.all

    erb :index
  end
end

get "/article/:id" do

  @article = Article.find(params[:id])

  erb :show
end

put "/article/:id/vote" do

  @article = Article.find(params[:id])
  @article.rating ||= 0
  @article.rating += 1
  @article.save

  redirect "/article/#{params[:id]}"

end

post "/article/:article_id/comments" do

  if params[:content] != ""
  
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.article_id = params[:article_id]
    @comment.save
  
  end

  redirect "/article/#{params[:article_id]}"
  
end

get "/oink/*" do

  if session[:oink]
    session[:oink] = false
  else
    session[:oink] = true
  end


  redirect request.path_info.split("/oink/")[1]

end