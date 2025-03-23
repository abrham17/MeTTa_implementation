;Create a relational database in MeTTa. Represent the data tuples as facts
;and the constraints on the data tuples as rules. Suitable examples might be
;from stock in a department store or records in a personnel office.



;Products
(Product NikeStussy Shoes 10 2500)
(Product Laptop Eletronics 15 45000)
(Product bluetooth Eletronics 20 300)
(Product Mug (Home and appliance) 15 200)

;Customer
(Customer Abrhame Premium)
(Customer Leul Regular)
(Customer Eyob Premium)

;Supplier
(Supplier (Beyond Eletronics) Eletronics)
(Supplier (Shewa Shoes) Shoes)
(Supplier (Saba Home appliance) (Home and appliance))
; Categories
(Categories Eletronics)
(Categories Shoes)
(Categories (Home and appliance))

(= (Check_Price_Of_Product $name)
    (match &self (Product $name $category $quantity $price)
        (if (< $price 0)
            (println "Error: Product" $name "has an invalid price.")
            (println "The price of" $name "is valid.")
        )
    )
)

(= (Check_Quantity_Of_Product $name)
   (match &self (Product $name $category $quantity $price)
      (if (> $quantity 0)
          (trace! ("The quantity of" $name "is" $quantity) $quantity))
      ))

(= (customer_order $name $orderQuantity)
    (= quantity (Check_Quantity_Of_Product $name))
    (if (> (- quantity $orderQuantity) 0)
       (println "The order is complete"))
    (println "The order is not complete due to insufficent quantity")
)


!(Check_Price_Of_Product NikeStussy)
!(customer_order NikeStussy 4)