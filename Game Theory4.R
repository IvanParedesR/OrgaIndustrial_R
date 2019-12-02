#############################################################
# This is the starting script to 'Spatial cooperation games'
#############################################################
https://tb.ethz.ch/education/learningmaterials/modelingcourse/level-2-modules/SCG.html
# Implements a non-spatial PD

### set parameters
n <- 1000  	# population size
b <- 2          # benefit    
c <- 1          # cost
num_gen <- 50   # number of generations
initfreq_coop <- 0.5 # initial frequency of cooperators

# calculate the number of competitions
num_comps <- num_gen * n

### pay-off matrix, i.e. what player 1 gets when playing against 2:
#
#                               player 2
#                       defect       cooperate
# player   defect          P             T   
#   1      cooperate       S             R   
#
# Prisoner's dilemma (PD): 	( R,  T,  S,  P ) = ( b-c,    b,  -c,   0 )

R <- b-c
T <- b
S <- -c
P <- 0

# calculate the maximum payoff difference, alpha
alpha = T-S

# construct pay-off matrix
rewards <- matrix(c(P, T, S, R), nrow=2, ncol=2, byrow=TRUE)

### Initialize population and result vectors

pop <- rbinom(n,1,initfreq_coop) # generate initial population vector (1's correspond to cooperators,
                                 # 0's correspond to defectors)

# Because population size is constant, it will be sufficient to record
# the frequency of just one type (e.g. cooperators)
stats <- numeric(num_comps+1)
stats[1] <- sum(pop)/n

### Simulate

# conduct competitions 
for (i in 1:num_comps+1) { 
    # pick four organisms for the comparisons
    x <- sample(n,4) 
    # compete organisms and calculate their payoffs
    P1 <- rewards[pop[x[1]]+1, pop[x[2]]+1]
    P2 <- rewards[pop[x[3]]+1, pop[x[4]]+1]

    # calculate the probability of replacement 
    w <- max(0,(P2-P1)/alpha)
    
    # now replace the first organism, if necessary
    if (w > runif(1)) {pop[x[1]] <- pop[x[3]]}
    	
    # record the frequency of cooperators
    stats[i] <- sum(pop)/n
}


### Plot proportion of cooperators in the population

# use time scale of competition interactions
time <- 0:num_comps
plot(time,stats, type="l",lwd=2, xlab="time (number of competitions)",ylab="Frequency of cooperators")
