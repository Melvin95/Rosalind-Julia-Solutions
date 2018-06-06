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

#Returns array consisting of values from dictionary
function getValues(dict)
    arr = []
    for rna in dict
        push!(arr,rna[2])
    end
    return arr
end

values = getValues(dict)

function calcRnaPossibilities(s)
    c = 3      #Stop codons
    for character in s
        c *= (count(i->(i==string(character)),values))

        if(c>=1000000)
            c = mod(c,1000000)
        end

    end
    return c
end

s = readline("rosalind_mrna.txt")
print( calcRnaPossibilities(s) )
