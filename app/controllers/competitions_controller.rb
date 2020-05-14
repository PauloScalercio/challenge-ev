class CompetitionsController < ApplicationController
  before_action :set_competition, only: [ :show, :update, :finish, :destroy ]

  def index
    @competitions = Competition.all
  end

  def show
  end

  def create
    @competition = Competition.new(competition_params)
    if @competition.save
      render :show, status: :created, location: @competition
    else
      render_error
    end
  end

  def update
    if @competition.update(competition_params)
      render :show
    else
      render_error
    end
  end

  def finish
    @competition.define_finish
    render :show
  end

  def destroy
    @competition.destroy
    head :no_content
  end

  private

  def set_competition
    @competition = Competition.find(params[:id])
  end

  def competition_params
    params.permit(:name, :unit, :win_definition, :max_attempts, :finished)
  end

  def render_error
    render json: { errors: @competition.errors },
      status: :unprocessable_entity
  end
end
