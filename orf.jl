#--------------------------RNA CODON DICTIONARY----------------------------------------------

dict = Dict( "UUU" => "F" , "CUU" => "L", "AUU" => "I", "GUU" => "V",
"UUC"=> "F",      "CUC"=> "L",      "AUC"=> "I",   "GUC"=> "V",
"UUA"=> "L",  "CUA"=> "L",  "AUA"=> "I",  "GUA"=> "V",
"UUG"=> "L",  "CUG"=> "L",  "AUG"=> "M",  "GUG"=> "V",
"UCU"=> "S",  "CCU"=> "P",  "ACU"=> "T",  "GCU"=> "A",
"UCC"=> "S",  "CCC"=> "P",  "ACC"=> "T",  "GCC"=> "A",
"UCA"=> "S",  "CCA"=> "P",  "ACA"=> "T",  "GCA"=> "A",
"UCG"=> "S",  "CCG"=> "P",  "ACG"=> "T",  "GCG"=> "A",
"UAU"=> "Y",  "CAU"=> "H",  "AAU"=> "N",  "GAU"=> "D",
"UAC"=> "Y",  "CAC"=> "H",  "AAC"=> "N",  "GAC"=> "D",
"UAA"=> "Stop",   "CAA"=> "Q",      "AAA"=> "K",      "GAA"=> "E",
"UAG"=> "Stop",   "CAG"=> "Q",      "AAG"=> "K",      "GAG"=> "E",
"UGU"=> "C",      "CGU"=> "R",      "AGU"=> "S",      "GGU"=> "G",
"UGC"=> "C",      "CGC"=> "R",      "AGC"=> "S",      "GGC"=> "G",
"UGA"=> "Stop",   "CGA"=> "R",      "AGA"=> "R",      "GGA"=> "G",
"UGG"=> "W",      "CGG"=> "R",      "AGG"=> "R",      "GGG"=> "G" )

#---------------------------------------------------------------------------------------------


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

seq = replace(getFastaRecords("rosalind_orf.fasta")[1][2],"T","U") #DNA to RNA

final = []

#Reverse complement
function reverseComplement(seq)
    #A-T
    #C-G
    r = reverse(seq)
    s = ""
    for i in range(1,1,length(r))
        if(r[i]=='A')
            s=s*"U"
        elseif(r[i]=='U')
            s=s*"A"
        elseif(r[i]=='C')
            s=s*"G"
        elseif(r[i]=='G')
            s=s*"C"
        end
    end
    return s
end


#Splits sequence into codons
function frame(seq)
        codons = map(join,[ seq[i:i+2] for i in 1:3:length(seq)-2 ])
        return codons
end


#Returns list of positions where the start codon occurs
function findStartPositions(codons)
    startPos = []
    for i in range(1,1,length(codons))
        if(codons[i]=="AUG")
            push!(startPos,i)
        end
    end
    return startPos
end

#Finds the next Stop codon given a start index and sequence
function findClosestStopCodon(start,codons)
    num = -1
    len = length(codons)
    index = start
    while(index<len && num==-1)
        if(dict[codons[index]]=="Stop")
            num = index
        end
        index += 1
    end
    return num
end

#Returns ORF sequences
function orfSeq(codons)
    startPos = findStartPositions(codons)
    orfs = []
    if(length(startPos)!=0)
        for i in range(1,1,length(startPos))
            string = ""
            stopIndex = findClosestStopCodon(startPos[i],codons)
            if(stopIndex!=-1 && stopIndex>startPos[i])
                for j in range(startPos[i],1,stopIndex-1)
                    if(dict[codons[j]]=="Stop")
                        break
                    else
                        string *= dict[codons[j]]
                    end
                end
            end
            if(string!="" && !contains(==,final,string))
                push!(final,string)
            end
        end
    end
    return orfs
end


frame1 = frame(seq)
frame2 = frame(seq[2:length(seq)])
frame3 = frame(seq[3:length(seq)])

rev = reverseComplement(seq)

frame1r = frame(rev)
frame2r = frame(rev[2:length(rev)])
frame3r = frame(rev[3:length(rev)])

orfSeq(frame1)
orfSeq(frame2)
orfSeq(frame3)
orfSeq(frame1r)
orfSeq(frame2r)
orfSeq(frame3r)

for display in range(1,1,length(final))
    println(final[display])
end
