#Reading FASTA file
using FastaIO
function getFastaRecords(fn)
    recs=[]
    FastaReader(fn) do fr
        for(desc, seq) in fr
            push!(recs,(desc,seq))
        end
    end
    return recs
end

recs = getFastaRecords("rosalind_gc.fasta")

s = length(recs)
min = 0.000
id = ""

for i in range(1,1,s)
    id = recs[i][1]
    dnaLen = length(recs[i][2])
    GC = count(i->(i=='G' || i=='C'), recs[i][2])
    perc = GC/dnaLen
    if(perc>min)
        min = perc
    end
end

println(id)
println(round(min*100.000,6))
