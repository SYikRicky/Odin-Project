def merge(arr, left_subarr, right_subarr)
  i = 0 # pointer of left array
  j = 0 # pointer of right array
  k = 0 # pointer of result array

  while i < left_subarr.length and j < right_subarr.length
    if left_subarr[i] < right_subarr[j]
      arr[k] = left_subarr[i]
      i += 1
    else
      arr[k] = right_subarr[j]
      j += 1
    end
    k += 1
  end

  # when left subarr still have element that haven't put in the arr
  while i < left_subarr.length
    arr[k] = left_subarr[i]
    k += 1
    i += 1
  end

  # when right subarr still have element that haven't put in the arr
  while j < right_subarr.length
    arr[k] = right_subarr[j]
    k += 1
    j += 1
  end

  return arr
end

def merge_sort(arr)
  n = arr.length

  if n <= 1
    return arr
  end

  mid = n / 2
  left_subarr = arr[0...mid]
  right_subarr = arr[mid...n]
  left_subarr = merge_sort(left_subarr)
  right_subarr = merge_sort(right_subarr)
  merge(arr, left_subarr, right_subarr)
  
  return arr
end


testing = [9, 6, 10, 4, 7]
p merge_sort(testing)
