#Given an array 'a',create a product array where product[i]==product of all elements except a[i]
#Time-complexity: O(n), Space-complexity: O(n),Auxiliary-space: O(1)

def product_array(a)
    len=a.length
    product=Array.new(len,0) # Initilaize product array elements to 1
    result=1
    
    #Loop to calculate the product of all elements of array
    for i in 0...len
        result*=a[i]
    end
    
    # If result is not zero, to avoid division by zero
    if result != 0
        #Lopp to calculate
        for i in 0...len
            product[i]=result/a[i]
        end
    end
  
    return product
end

product_array([1,2,3,4,5,6])  # => [720, 360, 240, 180, 144, 120]
