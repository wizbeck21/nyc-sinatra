class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do #index
    @figures = Figure.all
    @landmarks = Landmark.all
    erb :"figures/index"
  end

    get '/figures/new' do #new
      erb :"figures/new"
    end

    post '/figures' do #create
      @figure = Figure.create(params["figure"])
      unless params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end
      unless params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end
      @figure.save
      redirect to "/figures/#{@figure.id}"
    end

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :"figures/show"
    end

    get '/figures/:id/edit' do
      @figure = Figure.find(params[:id])
      erb :"figures/edit"
    end

    patch '/figures/:id' do
      @figure = Figure.find_by_id(params[:id])
      @figure.update(params[:figure])

      unless params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end
      unless params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:name])
      end

      @figure.save
      redirect to "/figures/#{@figure.id}"
    end


      

end