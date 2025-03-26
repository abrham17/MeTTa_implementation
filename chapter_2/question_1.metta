;Create a relational database in MeTTa. Represent the data tuples as facts
;and the constraints on the data tuples as rules. Suitable examples might be
;from stock in a department store or records in a personnel office.


; Products
(Product NikeStussy Shoes 10 2500)
(Product Laptop Eletronics 15 45000)
(Product bluetooth Eletronics 20 300)
(Product Mug (Home and appliance) 15 200)

; Customer
(Customer Abrhame Premium)
(Customer Leul Regular)
(Customer Eyob Premium)

; Supplier
(Supplier (Beyond Eletronics) Eletronics)
(Supplier (Shewa Shoes) Shoes)
(Supplier (Saba Home appliance) (Home and appliance))

; Categories
(Categories Eletronics)
(Categories Shoes)
(Categories (Home and appliance))

; Check Price of Product
(= (Check_Price_Of_Product $name)
    (match &self (Product $name $category $quantity $price)
        (if (< $price 0)
            ( "Error: Product" $name "has an invalid price.")
            ( "The price of" $name "is valid.")
        )
    )
)

; Check Quantity of Product
(= (Check_Quantity_Of_Product $name)
   (match &self (Product $name $category $quantity $price)
      (if (> $quantity 0)
            ( "The amount of Quantity is" $quantity)
            ( "Error: Quantity is not available for" $name)
      )
))

; Run tests
!(Check_Price_Of_Product NikeStussy)
!(Check_Quantity_Of_Product NikeStussy)  
