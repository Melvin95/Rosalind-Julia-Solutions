#Reading FASTA file
using FastaIO
function getFastaRecords(fn)
    recs=[]
    FastaReader(fn) do fr
        for(desc, seq) in fr
            push!(recs,seq)
        end
    end
    return recs
end

recs = getFastaRecords("rosalind_cons.fasta")

s = length(recs)

stringSize = length(recs[1])

string =""
p = ['A','C','G','T']
m =[]

for k in range(1,1,4)
    num = []
    for i in range(1,1,stringSize)
        c = 0
        for j in range(1,1,s)
            string *= recs[j][i]
        end
        c = count(l->( (l=='A'&&k==1)  || (l=='C'&&k==2) || (l=='G'&&k==3) || (l=='T'&&k==4)  ),string)
        push!(num,c)
        string = ""
    end
    push!(m, (p[k],num) )
end


consensus = ""
for f in range(1,1,stringSize)
    a = m[1][2][f]
    c = m[2][2][f]
    g = m[3][2][f]
    t = m[4][2][f]
    maxNum = max(a,c,g,t)
    if(maxNum==a)
        consensus = consensus*"A"
    elseif(maxNum==c)
        consensus = consensus*"C"
    elseif(maxNum==g)
        consensus = consensus*"G"
    else
        consensus = consensus*"T"
    end
end


print(consensus)

println()
for b in range(1,1,4)
    print(m[b][1],": ")
    for a in range(1,1,stringSize)
        print(m[b][2][a]," ")
    end
    println()
end
