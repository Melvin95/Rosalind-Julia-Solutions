function Motif(s,t)
    sLen = length(s)
    tLen = length(t)
    index = 1
    while(index<(sLen-tLen))
       k = search(s,t,index)
       if(k==(0:-1))
          break
       else
          print(k[1]," ", )
	  index = k[1]+1
       end
    end
end

s = readlines("rosalind_subs.txt")[1]
t = readlines("rosalind_subs.txt")[2]
Motif(s,t)
