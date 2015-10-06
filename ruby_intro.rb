
# Part 1

def sum arr

  length = arr.length 
  
  return 0 if length == 0

  answer = 0
  
  while length > 0  
    length -= 1
    answer += arr[length]
  end

  return answer
  
end

def max_2_sum arr

  length = arr.length

  return 0 if length == 0

  return arr[0] if length == 1

  if arr[0] > arr[1] 
    max_1 = arr[0]
    max_2 = arr[1]
  else
    max_1 = arr[1]
    max_2 = arr[0]
  end

 
  while length > 2

    length -= 1
    x = arr[length]

    if max_2 < x 
      if max_1 < x
        max_2 = max_1;
        max_1 = x;
      else
        max_2 = x;
      end
    end
     
  end
  
  return max_1+max_2
  
end

def sum_to_n? arr, n

  length = arr.length
  
  return false if length <= 1

  for index_1 in 0..length-1
    for index_2 in index_1+1..length-1
      return true if n == arr[index_1] + arr[index_2]
    end
  end
  
  return false
  
end

# Part 2

def hello(name)

  "Hello, " + name

end

def starts_with_consonant?(s) 

   return false if s.length == 0
  
   first = s[0]

   return false if first < 'A' || (first > 'Z' && first < 'a') || first > 'z'

   arrc = ["a","e","i","o","u","A","E","I","O","U"]

   return false if arrc.index(first) != nil

   return true
  
end

def binary_multiple_of_4? s

  length = s.length  
  
  return false if length == 0
  
  return false if s[length-1] != '0'

  return false if length > 1 && s[length-2] != '0'

  for index in 0..length-3 do
    return false if s[index] != '0' && s[index] != '1' 
  end

  return true

end

# Part 3

class BookInStock

  def initialize(isbn,price)
    if isbn.length == 0 
      raise ArgumentError.new("isbn string is empty")
    else
      @isbn = isbn
    end

    if price <= 0 
      raise ArgumentError.new("price is wrong")
    else
      @price = price
    end
  end
  
  def isbn
    @isbn
  end

  def price
    @price
  end

  def isbn=(isbn)
    @isbn = isbn
  end

  def price=(price)
    @price = price
  end

  def price_as_string
    "$"+format("%0.2f",@price)
  end

end





