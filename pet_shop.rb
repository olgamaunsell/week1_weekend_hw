#
def pet_shop_name(pet_shop)
  # Receives 1 parameter - pet shop hash
  # Returns pet shop name from pet shop hash
  return pet_shop[:name]
end

def total_cash(pet_shop)
  # Receives 1 parameter - pet shop hash
  # Returns total cash value from pet shop hash
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,amount)
  # Receives 2 parameters:
  # Input 1 - pet shop hash
  # Input 2 - cash amount (can be positive or negative)
  # Cash amount is added to total cash # amount in pet shop hash
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  # Receives 1 parameter - pet shop hash
  # Returns number of pets of sold held in pet shop hash

  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,number_of_pets)
  # Receives 2 parameters:
  # Input 1 - pet shop hash
  # Input 2 - number of pets to be added
  # Adds number of pets to the pets sold held in pet shop hash
  pet_shop[:admin][:pets_sold] += number_of_pets
end

def stock_count(pet_shop)
  # Receives 1 parameter - pet shop hash
  # Counts and returns the number of pets in pet shop hash
  stock_count = 0
  pets = pet_shop[:pets]
  for pet in pets
    stock_count += 1
  end
  return stock_count
end

def pets_by_breed(pet_shop, breed)
  # Receives 2 parameters:
  # Input 1 - pet shop hash
  # Input 2 - breed of pet
  # Counts and returns the number of pets
  # in pet shop hash that match the breed of pet

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
  # Receives 2 parameters:
  # Input 1 - pet shop hash
  # Input 2 - pet name
  # Returns pet hash if Input 2(pet name) matches a pet name
  # in the pets array within the pet shop hash

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
  # Receives 2 parameters:
  # Input 1 - pet shop hash
  # Input 2 - pet name
  # delete pet hash from pets array if Input 2(pet name)
  # matches pet name in pets array within the pet shop hash
  pets = pet_shop[:pets]
  for pet in pets
    if pet[:name] == pet_name
      pets.delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  # Receives 2 parameters:
  # Input 1 - pet shop hash
  # Input 2 - new pet hash
  # adds new pet hash to pets array within the pet shop hash
  pets = pet_shop[:pets]
  pets.push(new_pet)
end

def customer_pet_count(customer)
  # Input parameter is a customer hash
  # Function to count the number of pets
  # within a pets array in the customer hash

  return cust_pet_count = customer[:pets].count()

end

def add_pet_to_customer(customer, new_pet)
  # Input parameter 1: customer hash
  # Input parameter 2: new pet hash
  # Function to add a new pet to the pets array for that customer hash
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, pet_wanted)
  # Receives 2 parameters:
  # Input 1 - customer hash
  # Input 2 - pet wanted hash
  # Returns true - if the customer's cash amount is greater
  # than or equal to the price of the pet wanted
  # Otherwise returns false

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
  # If the value of the pet hash is empty then function terminates

  # Checks if the customer can afford the pet.
  # If the customer can afford the pet then:
  # 1. Adds pet to the customer
  # 2. Increases by 1 the admin[:pets_sold] value in the pet_shop hash
  # 3. Updates the admin[:total_cash] value with the price of the pet_type

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
