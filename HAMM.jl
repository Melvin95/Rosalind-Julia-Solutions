#Rosalind Problem 16 - Counting Point Mutations

dataset = readlines("rosalind_hamm.txt")
dnaS1 = dataset[1]
dnaS2 = dataset[2]

c = 0
for i in range(1,length(dnaS1))
    if(dnaS1[i]!=dnaS2[i])
        c += 1
    end
end

print(c)
