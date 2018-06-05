dnaStr = readline("rosalind_dna.txt")
arrayDna = split(dnaStr,"")
a = [ count(numA->(numA=="A"), arrayDna)
 count(numC->(numC=="C"), arrayDna)
 count(numG->(numG=="G"), arrayDna)
 count(numT->(numT=="T"), arrayDna) ]
print(a)
