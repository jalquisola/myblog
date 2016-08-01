namespace :currency do
  desc 'Get current Peso Value'
  task :posb => :environment do
    require 'nokogiri'
    require 'open-uri'
    url = "http://www.posb.com.sg/personal/rates-online/foreign-currency-foreign-exchange.page?pid=sg-posb-pweb-homepage-forex-txtmore-"
    doc = Nokogiri::HTML(open(url))
    selling = doc.css("tr.filter_Philippine_Peso td.column-3").text.to_f
    quantity = doc.css("tr.filter_Philippine_Peso th.column-2").text.to_f
    date_text = doc.css("div.otherCurrency p.subtle").text
    rate = quantity/selling

    date =  date_text.match(/[0-9]*\/[0-9]*\/[0-9]*/)[0]
    time =  date_text.match(/[0-9]*\:[0-9]*\s*(a|p)?m/)[0]
    file = Rails.root.join('lib', 'assets', 'sgd_to_peso.csv')

    str = "#{rate}, #{date}, #{time}\n"
    puts str
    a = File.foreach(file).grep(str)

    if a.blank?
      open(file, 'a') do |f|
        f << str
      end
    end
  end
end
