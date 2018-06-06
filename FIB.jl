function fibRab(months,offsprings)
 count = 2
 a = 1
 b = 1
 pairs = 1
 while count!=months
  pairs = b + (a*3)
  temp = b
  b = pairs
  a = temp
  count+=1
 end
 return pairs
end

data = readline("rosalind_fib.txt")
arr = split(data)
n = parse(Int,arr[1])
k = parse(Int,arr[2])
print(fibRab(n,k))
