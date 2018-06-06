#Rosalind Problem 17 - Mortal Fibonacci Rabbits
#Population after n-months with rabbits only living m-months
#Rabbit matures in 1 month then produces 1 pair each subsequent month
#Rabbit pair essentially can only produce for m-1 months

data = split(readline("rosalind_fibd.txt"))
n = parse(Int,data[1])
m = parse(Int,data[2])

function mortalFib(n,m)

    #Array of size m, with population[i] = number of rabbits of age i-1
    population = fill(0,(1,m))

    #Month 1:
    #population[1] = 1
    #population[2:] = 0
    #No pair can produce yet, not old enough, no processing needed

    #Month 2:
    population[1] = 0
    population[2] = 1
    #A pair is old enough, will reproduce in subsequent month

    #Iterate for n-2 months, first 2 months done already(1 1)
    for i in range(1,1,n-2)
        population = cat(1,sum(population[2:m]),population[1:m-1])
    end

    return sum(population)
end

print(mortalFib(n,m))

#Let n = 6 and m = 3, then:
#Month 1: [1,0,0] -> 1
#Month 2: [0,1,0] -> 1
#Month 3: [1,0,1] -> 2
#Month 4: [1,1,0] -> 2
#Month 5: [1,1,1] -> 3
#Month 6: [2,1,1] -> 4

#In order to get the new population, we must consider the number of newborns and number of rabbits that will die
#The number of newborns is equal to the number of rabbits 1 month or older, that is population[2:m]
#The number of rabbits that will die(start of next month so they reproduce now) is the number of rabbits at population[m]

#So the new population array is the array of pop[1:m-1] shifted to the right by 1 position with pop[1] = sum from pop[2:m]
#Instead of doing m-2 shifts which is computationally expensive,
#We recreate our array by concatenating the sum(pop[2:m]) with the array pop[1:m-1]
