#
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

# def total_price(pet_shop)
#   total_cash = 0
#   pets = pet_shop[:pets]
#   for pet in pets
#     total_cash += pet[:price]
#   end
#   return total_cash
# end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,number_of_pets)
  pet_shop[:admin][:pets_sold] += number_of_pets
end

def stock_count(pet_shop)
  stock_count = 0
  pets = pet_shop[:pets]
  for pet in pets
    stock_count += 1
  end
  return stock_count
end

def pets_by_breed(pet_shop, breed)

  same_breed_array = []
  pets = pet_shop[:pets]
  for pet in pets
    if pet[:breed] == breed
      same_breed_array << pet[:breed]
    end
  end
  return same_breed_array

end
