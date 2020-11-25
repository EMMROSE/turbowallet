class InvestmentsController < ApplicationController

  require 'open-uri'
  require 'nokogiri'


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

  def parsing
    require 'open-uri'
    require 'nokogiri'

    @investments = Investment.all
    @investments.each do |investment|
      # if investment.emetteur == "SG"
        url = "https://live.euronext.com/en/product/structured-products/DE000SD09RZ3-XMLI"
        html_file = open(url).read
        html_doc = Nokogiri::HTML(html_file)
        result = html_doc.search("div.date-header span.data-60").text
        investment.value = result.to_f
        raise
        investment.save
      # elsif investment.emetteur == "BNP"
      #   url = "https://bourse.societegenerale.fr/retail/Products-ProductSearcgQuick/q-#{investment.isin}"
      #   html_file = open(url).read
      #   html_doc = Nokogiri::HTML(html_file)
      #   result = html_doc.search('.productPriceBid .hidePush').text.strip
      #   result = result.gsub(",", ".")
      #   investment.value = result.to_f
      #   investment.save
      # else
      #   url = "https://fr.citifirst.com/FR/Produits/Turbos/#{investment.name}/#{investment.isin}/"
      #   html_file = open(url).read
      #   html_doc = Nokogiri::HTML(html_file)
      #   result = html_doc.search('.Ask .Value').span.to_s
      #   raise
      #   result = result.gsub(",", ".")
      #   investment.value = result.to_f
      #   investment.save
      # end
    end
    redirect_to root_path
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
