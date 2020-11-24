class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  require 'open-uri'
  require 'nokogiri'

  before_action :parsing

  private

  def parsing
    Investment.all.each do |investment|
      if investment.emetteur == "SG"
        url = "https://bourse.societegenerale.fr/retail/Products-ProductSearcgQuick/q-#{investment.isin}"
        html_file = open(url).read
        html_doc = Nokogiri::HTML(html_file)
        result = html_doc.search('.productPriceBid .hidePush').text.strip
        result = result.gsub(",", ".")
        investment.value = result.to_f
        investment.save
        # puts element.attribute('href').value
      elsif investment.emetteur == "BNP"
        # BNP
      else
        # citi
      end
    end
  end

end
