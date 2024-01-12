class PrototypesController < ApplicationController

  def index  # indexアクションを定義した
    @prototype = Prototype.all
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)

    if @prototype.save
      redirect_to root_path, notice: 'Prototype was successfully created.'
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
  else
    render :edit, status: :unprocessable_entity
  end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path, notice: 'Prototype was successfully destroyed.'
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  
end
