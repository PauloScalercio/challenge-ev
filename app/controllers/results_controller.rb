class ResultsController < ApplicationController
  before_action :set_result, only: [ :show, :destroy ]
  before_action :set_competition, only: :create
  before_action :set_athlete, only: :create

  def index
    @results = Result.all
  end

  def show
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      render :show, status: :created, location: @result
    else
      render_error
    end
  end

  def destroy
    @result.destroy
    head :no_content
  end

  private

  def set_competition
    unless params[:competition_id].present?
      competition = Competition.new(name: params[:competition], unit:params[:unit])
      competition.max_attempts = params[:max_attempts] if params[:max_attempts].present?
      competition.win_definition = params[:win_definition] if params[:win_definition].present?
      competition.save!
      params[:competition_id] = competition.id
    end
  end

  def set_result
    @result = Result.find(params[:id])
  end

  def set_athlete
    unless params[:athlete_id].present?
      athlete = Athlete.new(name: params[:athlete])
      athlete.save!
      params[:athlete_id] = athlete.id
    end
  end

  def result_params
    params.permit(:competition_id, :athlete_id, :result_value)
  end

  def render_error
    render json: { errors: @result.errors },
      status: :unprocessable_entity
  end
end
