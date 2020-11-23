class PositionsController < ApplicationController
  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    @position.user = @user
    if @position.save
      redirect_to root_path
      flash[:notice] = "Votre dernière position a bien été enregistrée."
    else
      render :new
      flash[:alert] = "Veuillez compléter le formulaire s'il vous plaît."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def position_params
    params.require(:position).permit(:isin, :quantity, :price, :emetteur, :user_id)
  end
end
