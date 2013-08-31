# lib/tasks/populate.rake
#
# Rake task to populate development database with test data
# Run it with "rake db:populate"
# See Railscast 126 and the faker website for more information

namespace :db do
  desc "Erase and fill database"
  task populate: :environment do
    require 'faker'

    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke

    #create the 4 venues
    Venue.create!(name: 'Lost Society', telephone: '0207 652 6526', email: 'info@lostsociety.co.uk')
    Venue.create!(name: 'Lost Angel', telephone: '0207 622 2112', email: 'info@lostangel.co.uk')
    Venue.create!(name: 'Lost & Co', telephone: '0208 780 2235', email: 'info@lostputney.co.uk')
    Venue.create!(name: 'Ales & Tails', telephone: '0208 891 5413', email: 'info@alesandtails.co.uk')
    Venue.create!(name: 'External Events', telephone: '', email: '')

    #create the owner and director users
    User.create!(username: 'owner', role: 'director', password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'director', role: 'director', password: 'secret', password_confirmation: 'secret')

    #create a manager for each venue
    User.create!(username: 'society manager', role: 'manager', venue_id: 1, password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'angel manager', role: 'manager', venue_id: 2, password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'co manager', role: 'manager', venue_id: 3, password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'ales manager', role: 'manager', venue_id: 4, password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'events manager', role: 'manager', venue_id: 5, password: 'secret', password_confirmation: 'secret')

    #create a supervisor for each venue
    User.create!(username: 'society supervisor', role: 'supervisor', venue_id: 1, password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'angel supervisor', role: 'supervisor', venue_id: 2, password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'co supervisor', role: 'supervisor', venue_id: 3, password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'ales supervisor', role: 'supervisor', venue_id: 4, password: 'secret', password_confirmation: 'secret')

    #create a bartenders for each venue
    User.create!(username: 'society bartender', role: 'bartender', venue_id: 1, password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'angel bartender', role: 'bartender', venue_id: 2, password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'co bartender', role: 'bartender', venue_id: 3, password: 'secret', password_confirmation: 'secret')
    User.create!(username: 'ales bartender', role: 'bartender', venue_id: 4, password: 'secret', password_confirmation: 'secret')

    #create product_categories
    ProductCategory.create!(name: 'Beer', description: "")
    ProductCategory.create!(name: 'Brandy', description: "An alcoholic liquor distilled from wine or fermented fruit juice.")
    ProductCategory.create!(name: 'Champagne/Sparkling', description: "A sparkling white wine made from a blend of grapes, especially Chardonnay and pinot, produced in Champagne.")
    ProductCategory.create!(name: 'Gin', description: "A colorless alcoholic beverage made by distilling or redistilling rye or other grain spirits and adding juniper berries or aromatics such as anise, caraway seeds, or angelica root as flavoring.")
    ProductCategory.create!(name: 'Liqueur', description: "Liqueurs are flavored spirits prepared by infusing certain woods, fruits, or flowers, in either water or alcohol, and adding sugar, etc. Others are distilled from aromatic or flavoring agents.")
    ProductCategory.create!(name: 'Mixers', description: "")
    ProductCategory.create!(name: 'Puree', description: "")
    ProductCategory.create!(name: 'Red Wine', description: "Wine having a red color derived from skins of dark-colored grapes.")
    ProductCategory.create!(name: 'Rose Wine', description: "Pinkish table wine from red grapes whose skins were removed after fermentation began.")
    ProductCategory.create!(name: 'Rum', description: "Distilled from cane juice, or from the scummings of the boiled juice, or from treacle or molasses, or from the lees of former distillations. Also, sometimes used colloquially as a generic or a collective name for intoxicating liquor.")
    ProductCategory.create!(name: 'Tequila', description: "An alcoholic liquor distilled from the fermented juice of the Central American century plant Agave tequilana.")
    ProductCategory.create!(name: 'Vermouth', description: "A sweet or dry fortified wine flavored with aromatic herbs and used chiefly in mixed drinks.")
    ProductCategory.create!(name: 'Vodka', description: "Originally distilled from fermented wheat mash but now also made from a mash of rye, corn, or potatoes.")
    ProductCategory.create!(name: 'Whiskey/Bourbon', description: "distilled from grain, potatoes, etc., especially in Scotland, Ireland, and the United States. In the United States, whisky is generally distilled from maize, rye, or wheat, but in Scotland and Ireland it is often made from malted barley.")
    ProductCategory.create!(name: 'White Wine', description: "Any wine of a clear, transparent color, bordering on white, as Madeira, sherry, Lisbon, etc.; -- distinguished from wines of a deep red color, as port and Burgundy.")
    ProductCategory.create!(name: 'Condiment', description: "Substance that is added to some cocktails to impart a particular flavor and/or enhance its flavor")

    #create some products for each category
      #1-Beer
      Product.create!(name: 'Brahma', description: "", quantity: '330', measure: 'ML', product_category_id: 1)
      Product.create!(name: 'Peroni', description: "", quantity: '330', measure: 'ML', product_category_id: 1)
      Product.create!(name: 'Estrella', description: "", quantity: '330', measure: 'ML', product_category_id: 1)

      #2-Brandy
      Product.create!(name: 'Courvoisier', description: "", quantity: '700', measure: 'ML', product_category_id: 2)

      #3-Champagne/Sparkling
      Product.create!(name: 'Prosecco Carpenè Malvolti', description: "Fine and continuous bubbles, the wine is fruity and appealing with a floral and fresh fruit bouquet and a lingering finish", quantity: '750', measure: 'ML', product_category_id: 3)
      Product.create!(name: 'Moutard Cuvée Réserve Nv', description: "A full, creamy Chardonnay palate leading through to a fresh, clean and fruity finish.", quantity: '750', measure: 'ML', product_category_id: 3)
      Product.create!(name: 'Perrier Jouet Grand Brut Nv', description: "Made from a blend of Chardonnay, Pinot Noir and Pinot Meunier, this is a well-balanced and fine Champagne with an inviting fragrance and a lingering flavour.", quantity: '750', measure: 'ML', product_category_id: 3)

      #4-Gin
      Product.create!(name: 'Beefeater', description: "", quantity: '700', measure: 'ML', product_category_id: 4)

      #5-Liqueur
      Product.create!(name: 'Crème de Pêche', description: "", quantity: '1000', measure: 'ML', product_category_id: 5)

      #6-Mixers
      Product.create!(name: 'Lemon Juice', description: "", quantity: '1000', measure: 'ML', product_category_id: 6)
      Product.create!(name: 'Lime Juice', description: "", quantity: '1000', measure: 'ML', product_category_id: 6)
      Product.create!(name: 'Tomato Juice', description: "", quantity: '1000', measure: 'ML', product_category_id: 6)
      Product.create!(name: 'Pineapple Juice', description: "", quantity: '1000', measure: 'ML', product_category_id: 6)
      Product.create!(name: 'Apple Juice', description: "", quantity: '1000', measure: 'ML', product_category_id: 6)
      Product.create!(name: 'Orange Juice', description: "", quantity: '1000', measure: 'ML', product_category_id: 6)
      Product.create!(name: 'Cranberry Juice', description: "", quantity: '1000', measure: 'ML', product_category_id: 6)

      #7-Puree
      Product.create!(name: 'Peach Puree', description: "", quantity: '1000', measure: 'ML', product_category_id: 7)
      Product.create!(name: 'Raspberry Puree', description: "", quantity: '1000', measure: 'ML', product_category_id: 7)
      Product.create!(name: 'Strawberry Puree', description: "", quantity: '1000', measure: 'ML', product_category_id: 7)
      Product.create!(name: 'Coconut Puree', description: "", quantity: '1000', measure: 'ML', product_category_id: 7)

      #8-Red Wine
      Product.create!(name: 'Santo Isidro, Portugal', description: "A flavoursome wine made from the Castelao grape. Soft on the palate with suggestions of fresh raspberries and violets. Round, smooth and well balanced.", quantity: '750', measure: 'ML', product_category_id: 8)
      Product.create!(name: 'Le Bosq Rouge, France', description: "An easy drinking Southern French style with a fresh aroma of damsons, juicy and spicy on the palate.", quantity: '750', measure: 'ML', product_category_id: 8)
      Product.create!(name: 'El Tidon, Cab. Sauvignon and Tempranillo, Spain', description: "Warm, earthy and mellow aromas with spice and ripe blackberry fruit with toasted wood in the background. Fruity and smooth.", quantity: '750', measure: 'ML', product_category_id: 8)

      #9-Rose Wine
      Product.create!(name: 'Pinot Grigio Blush, Di Venezie, Italy', description: "Fresh and fruity with an off-dry finish.", quantity: '750', measure: 'ML', product_category_id: 9)
      Product.create!(name: 'Domaine Serge Laloue, Sancerre Rose, Loire, France', description: "Fresh notes of minerality with lovely freshness and elegance.", quantity: '750', measure: 'ML', product_category_id: 9)

      #10-Rum
      Product.create!(name: 'Santa Teresa', description: "", quantity: '700', measure: 'ML', product_category_id: 10)

      #11-Tequila
      Product.create!(name: 'El Jimador', description: "", quantity: '700', measure: 'ML', product_category_id: 11)

      #12-Vermouth
      Product.create!(name: 'Noilly Prat', description: "", quantity: '700', measure: 'ML', product_category_id: 12)
      Product.create!(name: 'Martini Rosso', description: "", quantity: '700', measure: 'ML', product_category_id: 12)

      #13-Vodka
      Product.create!(name: 'Stolichnaya', description: "", quantity: '700', measure: 'ML', product_category_id: 13)

      #14-Whiskey/Bourbon
      Product.create!(name: 'Jim Beam', description: "", quantity: '700', measure: 'ML', product_category_id: 14)
      Product.create!(name: 'Cutty Sark', description: "", quantity: '700', measure: 'ML', product_category_id: 14)
      Product.create!(name: 'Jim Beam Red Stag', description: "", quantity: '700', measure: 'ML', product_category_id: 14)
      Product.create!(name: 'Pikesville Straight Rye', description: "", quantity: '700', measure: 'ML', product_category_id: 14)

      #15-White Wine
      Product.create!(name: 'Novita, Trebbiano, Italy', description: "A light, dry and fresh wine with hints of citrus and a touch of melon and green apple.", quantity: '750', measure: 'ML', product_category_id: 15)
      Product.create!(name: 'Cuvée Le Bosq Blanc, France', description: "Fruity nose of citrus and passion fruit, lovely fresh aromatics and a clean, well-balanced freshness.", quantity: '750', measure: 'ML', product_category_id: 15)
      Product.create!(name: 'Hazy View, Chenin Blanc, South Africa', description: "Fresh and aromatic aromas with crisp acidity, finishing on a long, fruity note", quantity: '750', measure: 'ML', product_category_id: 15)

      #16-Condiment
      Product.create!(name: 'Black Pepper', description: "", quantity: '0', measure: 'grinds', product_category_id: 16)


    #create 3 suppliers and 1 for week shopping
    Supplier.create!(name: Faker::Name.name, telephone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email )
    Supplier.create!(name: Faker::Name.name, telephone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email )
    Supplier.create!(name: Faker::Name.name, telephone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email )
    Supplier.create!(name: 'purchases during the week', telephone: '', email: '' )


    #create 500 fake purchases
    50.times do
      from = Time.local(2010, 1, 1)
      to =  Time.now
      Purchase.create!(
        supplier_id: 1 + rand(Supplier.all.count - 1),       # -1 to not include purchases during the week
        venue_id: 1 + rand(Venue.all.count - 1),             # -1 to not include External Events
        no: Faker::Number.number(5),
        date: Time.at(from + rand * (to.to_f - from.to_f))   # rand is between 0 and 1
      )                                                      # to - from is the difference in time
    end                                                      # rand 0 result from | rand 1 result today

    #create 500 purchase_lines
    500.times do
      PurchaseLine.create!(
        purchase_id: 1 + rand(Purchase.all.count),
        product_id: 1 + rand(Product.all.count),
        quantity: 1 + rand(10),
        price: (5 + rand * (50 - 5)).round(2)                # price between 5 and 50
      )                                                      # rand 0 result 5 | rand 1 result 50
    end

    #create beverage_categories
    BeverageCategory.create!(name: 'Beers', description: "")
    BeverageCategory.create!(name: 'Brandy Based', description: "")
    BeverageCategory.create!(name: 'Champagnes/Sparkling', description: "")
    BeverageCategory.create!(name: 'Classic Cocktails', description: "")
    BeverageCategory.create!(name: 'House Cocktails', description: "")
    BeverageCategory.create!(name: 'Gin Based', description: "")
    BeverageCategory.create!(name: 'Liqueur Based', description: "")
    BeverageCategory.create!(name: 'Rum Based', description: "")
    BeverageCategory.create!(name: 'Vermouth Based', description: "")
    BeverageCategory.create!(name: 'Vodka Based', description: "")
    BeverageCategory.create!(name: 'Whiskey Based', description: "")
    BeverageCategory.create!(name: 'Wines', description: "")

    #create beverages
      #17-Beers
        #Brahma
        Beverage.create!(name: 'Brahma', glass: '', garnish: '', description: "", method: "", beverage_category_id: 17)
        #recipe
          Recipe.create!(beverage_id: 1, product_id: Product.where(name: 'Brahma').first.id, quantity: 330)

        #Peroni
        Beverage.create!(name: 'Peroni', glass: '', garnish: '', description: "", method: "", beverage_category_id: 17)
        #recipe
          Recipe.create!(beverage_id: 2, product_id: Product.where(name: 'Peroni').first.id, quantity: 330)

        #Brahma
        Beverage.create!(name: 'Estrella', glass: '', garnish: '', description: "", method: "", beverage_category_id: 17)
        #recipe
          Recipe.create!(beverage_id: 3, product_id: Product.where(name: 'Estrella').first.id, quantity: 330)

      #18-Brandy Based
        #Single Courvoisier
        Beverage.create!(name: 'Single Courvoisier', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 18)
          #recipe
          Recipe.create!(beverage_id: 4, product_id: Product.where(name: 'Courvoisier').first.id, quantity: 25)

        #Double Courvoisier
        Beverage.create!(name: 'Double Courvoisier', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 18)
          #recipe
          Recipe.create!(beverage_id: 5, product_id: Product.where(name: 'Courvoisier').first.id, quantity: 50)

      #19-Champagnes/Sparkling
        #Prosecco Carpenè Malvolti glass 125ml
        Beverage.create!(name: 'Prosecco Carpenè Malvolti - Glass', glass: 'flute', garnish: '', description: "", method: "", beverage_category_id: 19)
        #recipe
          Recipe.create!(beverage_id: 6, product_id: Product.where(name: 'Prosecco Carpenè Malvolti').first.id, quantity: 125)

        #Prosecco Carpenè Malvolti bottle 750ml
        Beverage.create!(name: 'Prosecco Carpenè Malvolti - Bottle', glass: '', garnish: '', description: "", method: "", beverage_category_id: 19)
        #recipe
          Recipe.create!(beverage_id: 7, product_id: Product.where(name: 'Prosecco Carpenè Malvolti').first.id, quantity: 750)

      #20-Classic Cocktails
        #beline
        Beverage.create!(name: 'Beline', glass: 'Flute', garnish: '', description: "", method: "Puree and liqueur in ice. Stir, add Prosecco and strain.", beverage_category_id: 20)
          #recipe
          Recipe.create!(beverage_id: 8, product_id: Product.where(name: 'Peach Puree').first.id, quantity: 25)
          Recipe.create!(beverage_id: 8, product_id: Product.where(name: 'Crème de Pêche').first.id, quantity: 10)
          Recipe.create!(beverage_id: 8, product_id: Product.where(name: 'Prosecco Carpenè Malvolti').first.id, quantity: 100)
        #Blood Mary
        Beverage.create!(name: 'Blood Mary', glass: 'Catalina', garnish: 'Celery Stick, Lemon and Lime', description: "", method: "Ingredients in ice. Shake lightly and strain.", beverage_category_id: 20)
          #recipe
          Recipe.create!(beverage_id: 9, product_id: Product.where(name: 'Stolichnaya').first.id, quantity: 50)
          Recipe.create!(beverage_id: 9, product_id: Product.where(name: 'Lemon Juice').first.id, quantity: 25)
          Recipe.create!(beverage_id: 9, product_id: Product.where(name: 'Tomato Juice').first.id, quantity: 70)
          Recipe.create!(beverage_id: 9, product_id: Product.where(name: 'Black Pepper').first.id, quantity: 6)

      #21-House Cocktails
        #Black Cherry Manhattan
        Beverage.create!(name: 'Black Cherry Manhattan', glass: 'Martini', garnish: 'Black Cherry', description: "", method: "Ingredients in ice. Stir and double strain.", beverage_category_id: 21)
          #recipe
          Recipe.create!(beverage_id: 10, product_id: Product.where(name: 'Jim Beam Red Stag').first.id, quantity: 25)
          Recipe.create!(beverage_id: 10, product_id: Product.where(name: 'Pikesville Straight Rye').first.id, quantity: 25)
          Recipe.create!(beverage_id: 10, product_id: Product.where(name: 'Noilly Prat').first.id, quantity: 10)

      #22-Gin Based
        #Single Beefeater
        Beverage.create!(name: 'Single Beefeater', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 22)
          #recipe
          Recipe.create!(beverage_id: 11, product_id: Product.where(name: 'Beefeater').first.id, quantity: 25)

        #Double Beefeater
        Beverage.create!(name: 'Double Beefeater', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 22)
          #recipe
          Recipe.create!(beverage_id: 12, product_id: Product.where(name: 'Beefeater').first.id, quantity: 50)

      #23-Liqueur Based
        #Single Crème de Pêche
        Beverage.create!(name: 'Single Crème de Pêche', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 23)
          #recipe
          Recipe.create!(beverage_id: 13, product_id: Product.where(name: 'Crème de Pêche').first.id, quantity: 25)

        #Double Crème de Pêche
        Beverage.create!(name: 'Double Crème de Pêche', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 23)
          #recipe
          Recipe.create!(beverage_id: 14, product_id: Product.where(name: 'Crème de Pêche').first.id, quantity: 50)

      #24-Rum Based
        #Single Santa Teresa
        Beverage.create!(name: 'Single Santa Teresa', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 24)
          #recipe
          Recipe.create!(beverage_id: 15, product_id: Product.where(name: 'Santa Teresa').first.id, quantity: 25)

        #Double Santa Teresa
        Beverage.create!(name: 'Double Santa Teresa', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 24)
          #recipe
          Recipe.create!(beverage_id: 16, product_id: Product.where(name: 'Santa Teresa').first.id, quantity: 50)

      #25-Vermouth Based
        #Single Martini Rosso
        Beverage.create!(name: 'Single Martini Rosso', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 25)
          #recipe
          Recipe.create!(beverage_id: 17, product_id: Product.where(name: 'Martini Rosso').first.id, quantity: 25)

        #Double Martini Rosso
        Beverage.create!(name: 'Double Martini Rosso', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 25)
          #recipe
          Recipe.create!(beverage_id: 18, product_id: Product.where(name: 'Martini Rosso').first.id, quantity: 50)

      #26-Vodka Based
        #Single Stolichnaya
        Beverage.create!(name: 'Single Stolichnaya', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 26)
          #recipe
          Recipe.create!(beverage_id: 19, product_id: Product.where(name: 'Stolichnaya').first.id, quantity: 25)

        #Double Stolichnaya
        Beverage.create!(name: 'Double Stolichnaya', glass: 'Rocks', garnish: '', description: "", method: "", beverage_category_id: 26)
          #recipe
          Recipe.create!(beverage_id: 20, product_id: Product.where(name: 'Stolichnaya').first.id, quantity: 50)


    #create menu
    Menu.create!(name: 'Winter Menu', description: '', current: true)
      #menu lines
      MenuLine.create!(menu_id: 1, beverage_id: 1, price: 3.9)   #Brahma
      MenuLine.create!(menu_id: 1, beverage_id: 2, price: 3.9)   #Peroni
      MenuLine.create!(menu_id: 1, beverage_id: 3, price: 3.9)   #Estrella
      MenuLine.create!(menu_id: 1, beverage_id: 4, price: 4.5)   #Single Courvoisier
      MenuLine.create!(menu_id: 1, beverage_id: 5, price: 7.25)  #Double Courvoisier
      MenuLine.create!(menu_id: 1, beverage_id: 6, price: 6.20)  #Prosecco Carpenè Malvolti - Glass
      MenuLine.create!(menu_id: 1, beverage_id: 7, price: 30)    #Prosecco Carpenè Malvolti - Bottle
      MenuLine.create!(menu_id: 1, beverage_id: 8, price: 8.5)   #Beline
      MenuLine.create!(menu_id: 1, beverage_id: 9, price: 8.5)   #Blood Mary
      MenuLine.create!(menu_id: 1, beverage_id: 10, price: 8.5)  #Black Cherry Manhattan
      MenuLine.create!(menu_id: 1, beverage_id: 11, price: 4.5)  #Single Beefeater
      MenuLine.create!(menu_id: 1, beverage_id: 12, price: 7.25) #Double Beefeater
      MenuLine.create!(menu_id: 1, beverage_id: 13, price: 4.5)  #Single Crème de Pêche
      MenuLine.create!(menu_id: 1, beverage_id: 14, price: 7.25) #Double Crème de Pêche
      MenuLine.create!(menu_id: 1, beverage_id: 15, price: 4.5)  #Single Santa Teresa
      MenuLine.create!(menu_id: 1, beverage_id: 16, price: 7.25) #Double Santa Teresa
      MenuLine.create!(menu_id: 1, beverage_id: 17, price: 4.5)  #Single Martini Rosso
      MenuLine.create!(menu_id: 1, beverage_id: 18, price: 7.25) #Double Martini Rosso
      MenuLine.create!(menu_id: 1, beverage_id: 19, price: 4.5)  #Single Stolichnaya
      MenuLine.create!(menu_id: 1, beverage_id: 20, price: 7.25) #Double Stolichnaya


    Menu.create!(name: 'Summer Menu', description: '', current: false)
    Menu.create!(name: 'Autumn Menu', description: '', current: false)
    Menu.create!(name: 'Spring Menu', description: '', current: false)

  end
end
