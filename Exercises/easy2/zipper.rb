def zip(arr1, arr2)
  result = []
  count = 0
  while count < arr1.size
    result << [arr1[count], arr2[count]]
    count += 1
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]