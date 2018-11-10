class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/recipes/new' do

  end

  get '/recipes/:id' do
    @recipes = Recipe.find_by(id: params[:id])
    erb :show
  end

  post '/recipes' do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    if @recipe.save
      redirect '/recipes/:id'
    else
      redirect '/failure'
    end
    erb :index
  end

  get '/recipes/:id/edit' do
    @recipes = Recipe.find_by(id: params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time[:cook_time])
    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id/delete' do

  end

end
