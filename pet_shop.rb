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

def find_pet_by_name(pet_shop, pet_name)
  #return pet hash if parameter pet_name matches a pet name in pets array

  pets = pet_shop[:pets]
  for pet in pets
    if pet[:name] == pet_name
      return pet
    end
  end
  # if no pet match found return nil
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  # delete pet hash from pets array if pet_name matches pet name in array
  pets = pet_shop[:pets]
  for pet in pets
    if pet[:name] == pet_name
      pets.delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  #adds new pet hash to pets array
  pets = pet_shop[:pets]
  pets.push(new_pet)
end

def customer_pet_count(customer)
  # Input parameter is a customer hash within a customers array
  # Function to count the number of pets within a pets array in the customer hash

  return cust_pet_count = customer[:pets].count()

end

def add_pet_to_customer(customer, new_pet)
  # Input parameter 1: customer hash within a customers array
  # Input parameter 2: new pet hash
  # Function to add a new pet to the pets array for that customer hash
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, pet_wanted)

  customer_cash = customer[:cash]

  if customer_cash >= pet_wanted[:price]
    return true
  else
    return false
  end

end

def sell_pet_to_customer(pet_shop, pet, customer)
  # This functions receives 3 parameters:
  # Input 1: pet_shop hash
  # Input 2: pet hash
  # Input 3: customer hash
  #
  # This function calls 3 functions:
  # 1. Adds pet to the customer
  # 2. Increases by 1 the admin[:pets_sold] value in the pet_shop hash
  # 3. Updates the admin[:total_cash] value with the price of the pet_type
  #pet = find_pet_by_name(pet_shop, pet)

  if pet == nil
    return
  end

  customer_can_afford_pet = customer_can_afford_pet(customer, pet)

  if (customer_can_afford_pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet[:price])
  end

end
