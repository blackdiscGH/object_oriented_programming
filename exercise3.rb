def clear_screen
	puts "\e[H\e[2J"
	puts "SALES TAX VERSION 1.0 **************************************************************************************"
	puts "Avinash Jham"
	puts "\n\n\n"
end



class ShoppingCart


	################################## CLASS LEVEL #################################################
	# CLASS VARIABLES
	@@shoppingcarts_count = 0

	# CLASS METHOD
	def self.shoppingcarts_count
		@@shoppingcarts_count
	end


	#..................................  INSTANCE LEVEL variables ........................................

	# INSTANCE VARIABLES
	#@itemDetails = Array.new { Array.new }

	

	# .................................................................................................

	# INSTANCE METHOD
	def initialize
		@@shoppingcarts_count += 1 	
		@ItemDetails = []
		@shopping_final_total = 0.00
		@sales_tax_total = 0.00
		@pre_sales_tax_total = 0.00

	end

	# INSTANCE METHOD
	def Add_Item(item,qty,price,type)
		# print item, " ", qty, " ", price, " ", type, "\n"
		subarray = []
		subarray.push(item)
		subarray.push(qty.to_f)
		subarray.push(price.to_f)
		subarray.push(type)
		@ItemDetails.push(subarray)

		#print "Item Details: " , @ItemDetails  , "\n"
		sleep(1)

	end

	# INSTANCE METHOD
	def calculatePrice

		#print " Starting Calculate Price......"
		@sales_tax_total = 0
		@shopping_final_total = 0
		@pre_sales_tax_total

		#print "These are the items in this basket: " , @itemDetails, "\n"


		@ItemDetails.each {|x|

			item = x[0]
			qty = x[1].to_i
			price = x[2].to_f
			type = x[3]
			sales = 0.00  # Sales
			tax = 0.00  # Tax

			#print "Item : "  ,  x  , "\n"

			print " #{qty} #{item} at #{price} \n"

			sales_tax_exempt_items = ["Book","Chocolates","Headache Pills","Chocolate Bar"]

				sales = qty * price

			unless sales_tax_exempt_items.include?(item)
				tax =   0.10 * sales
			else
				tax = 0
			end

				@pre_sales_tax_total += sales
				@sales_tax_total += tax
				@shopping_final_total += sales + tax
			

		}

		print "Pre Tax Total       :" , @pre_sales_tax_total.round(2) , "\n"
		print "Sales Tax:          :" , @sales_tax_total.round(2).to_s , "\n"
		print "Final Total         :", @shopping_final_total.to_f.round(2), "\n\n"


	end


end  ################################## END OF CLASS SHOPPING CART ###############################################





class Catalog

end



shoppingCart1 = ShoppingCart.new
# puts shoppingCart1.instance_variables
shoppingCart1.Add_Item("Book",1,12.49,"Domestic")
shoppingCart1.Add_Item("Music CD",1,14.99,"Domestic")
shoppingCart1.Add_Item("Chocolate Bar",1,0.85,"Domestic")
shoppingCart1.calculatePrice


shoppingCart2 = ShoppingCart.new
shoppingCart2.Add_Item("Chocolates",1,10.00,"Imported")
shoppingCart2.Add_Item("Perfume",1,47.50,"Imported")
shoppingCart2.calculatePrice

shoppingCart3 = ShoppingCart.new
shoppingCart3.Add_Item("Perfume",1,32.19,"Imported")
shoppingCart3.Add_Item("Perfume",1,20.89,"Domestic")
shoppingCart3.Add_Item("Headache Pills",1,9.75,"Domestic")
shoppingCart3.Add_Item("Chocolates",1,11.85,"Imported")
shoppingCart3.calculatePrice



