data = readline("rosalind_iev.txt")
arr = split(data)
a = parse(Int,arr[1])
b = parse(Int,arr[2])
c = parse(Int,arr[3])
d = parse(Int,arr[4])
e = parse(Int,arr[5])
f = parse(Int,arr[6])

#AA-AA  100%
#AA-Aa  100%
#AA-aa  100%
#Aa-Aa  75%
#Aa-aa  50%
#aa-aa  0%


function expectedChildren(a,b,c,d,e,f)
  expected=0.0

  A=2*a*1
  B=2*b*1
  C=2*c*1
  D=2*d*0.75
  E=2*e*0.5
  F=2*e*0

  expected=A+B+C+D+E+F

  print(expected)
end

expectedChildren(a,b,c,d,e,f)
