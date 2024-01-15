class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :move_to_index, only:[:edit]

  def index  # indexアクションを定義した
    @prototype = Prototype.includes(:user)
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new()
    @comments = @prototype.comments.includes(:user)

  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
  else
    render :edit, status: :unprocessable_entity
  end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path, notice: 'Prototype was successfully destroyed.'
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == prototype.user_id
      redirect_to action: :index
    end
  end
  
end
