require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  output = []

  cart.each do |grocery_item|
    item_name = grocery_item[:item]
    item_price = grocery_item[:price]
    item_clearance = grocery_item[:clearance]
    item_count = grocery_item[:count]

    coupons.each do |coupon_item|
      coupon_name = coupon_item[:item]
      coupon_number = coupon_item[:num]
      coupon_cost = coupon_item[:cost]

      if item_name == coupon_name

        discount_name = "#{item_name} W/COUPON"
        not_discount_items = item_count - coupon_number
        discounted_items = item_count - not_discount_items

        not_discounted_price = item_price * not_discount_items
        discounted_price = coupon_cost / discounted_items

        discount_object = {}
        discount_object[:item] = discount_name
        discount_object[:price] = discounted_price.round(2)
        discount_object[:clearance] = item_clearance
        discount_object[:count] = discounted_items

        output.push(discount_object)

        non_discount_object = {}
        non_discount_object[:item] = item_name
        non_discount_object[:price] = not_discounted_price
        non_discount_object[:clearance] = item_clearance
        non_discount_object[:count] = not_discount_items

        output.push(non_discount_object)

      else
        output.push(grocery_item)
      end
    end
  end

  return output
end


def apply_clearance(cart)

  cart.each do |grocery_item|
    item_name = grocery_item[:item]
    item_price = grocery_item[:price]
    item_clearance = grocery_item[:clearance]
    item_count = grocery_item[:count]

    if item_clearance == true
      discount_price = (item_price - (item_price * 0.20)).round(2)
      grocery_item[:price] = discount_price
    end

  end
  return cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
  total = 0
  
  new_cart = consolidate_cart(cart)
  check_coupons = apply_coupons(new_cart)
  binding.pry
  
  return total
  
end
