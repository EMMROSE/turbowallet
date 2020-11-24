class InvestmentsController < ApplicationController
  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(investment_params)

    if @investment.save && params[:commit] == 'Créer la position'
      redirect_to root_path
      flash[:notice] = "Votre position a bien été enregistré."
    elsif @investment.save && params[:commit] == 'Créer une autre position'
      redirect_to new_investment_path
      flash[:notice] = "Votre position a bien été enregistré."
    else
      render :new
      flash[:alert] = "Veuillez compléter le formulaire s'il vous plaît."
    end
  end

  # def edit
  #   @product = Product.find(params[:id])
  # end

  # def update
  #   @product = Product.find(params[:id])
  #   if @product.update(product_params)
  #     redirect_to selection_path(@product.selection)
  #   else render :edit
  #   end
  # end

  # def destroy
  #   @product = Product.find(params[:id])
  #   @product.destroy
  #   redirect_to selection_path(@product.selection)
  # end

  # def sold_status
  #   product = Product.find(params[:id])
  #   product.status = "vendu"
  #   product.save
  #   redirect_to selection_path(product.selection)
  # end

  # def tosell_status
  #   product = Product.find(params[:id])
  #   product.status = "à vendre"
  #   product.save
  #   redirect_to selection_path(product.selection)
  # end

  # def return_status
  #   product = Product.find(params[:id])
  #   product.status = "retourné"
  #   product.save
  #   redirect_to selection_path(product.selection)
  # end

  # def edit_price
  #   @product = Product.find(params[:id])
  # end

  # def change_price
  #   @product = Product.find(params[:id])
  #   @product.update(price_params)
  #   @product.save
  #   redirect_to selection_path(@product.selection)
  #   flash[:notice] = "Votre prix a bien été modifié."
  # end

  private

  def investment_params
    params.require(:investment).permit(:name, :isin, :emetteur, :quantity, :price)
  end
end
