
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/articles' do #index shows all of the objects
    @articles = Article.all
    erb :index
  end
  
  
  get '/articles/new' do
    erb :new
  end
  
  post '/article' do 
    @article = Article.new
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    @article
    redirect "/articles/#{@article.id}"
  end
  
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end
  
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end 
  
  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    @article
    redirect "/articles/#{@article.id}"
  end
  
  delete '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect '/articles'
  end
  

end

