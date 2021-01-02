class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do #index
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :"landmarks/index"
  end
  
  get '/landmarks/new' do #new form
    erb :"/landmarks/new"
  end

  post '/landmarks' do #create
    Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    redirect to "/landmarks/:id"
  end

  get '/landmarks/:id' do #show page
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  post '/landmarks/:id' do #edit landmark
    @landmark = Landmark.find(params[:id])
    @landmark.name = params["landmark"]["name"]
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

end