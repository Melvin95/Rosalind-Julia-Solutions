function Mendell(k,m,n)

total=k+m+n

#eg AA Aa aa

#Combinations
#1. AA & AA --- 0% recessive
#2. AA & Aa --- 0% recessive
#3. AA & aa ---0% recessive
#4. Aa & Aa ---25% recessive
#5. Aa & aa ---50% recessive
#6. aa & aa ---100% recessive

total = k+m+n

r_r = (n / total) * ((n - 1) / (total - 1))
h_h = (m / total) * ((m - 1) / (total - 1))
h_r = (m / total) * (n / (total - 1)) +
  (n / total) * (m / (total - 1))

recessive_total = 1-(r_r + h_h * 1/4 + h_r * 1/2)


print(recessive_total)
end

Mendell(18,27,17)
