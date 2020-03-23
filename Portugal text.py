# Carlos Pedro Gonçalves (2015)
# Instituto Superior de Ciências Sociais e Políticas (ISCSP), University of Lisbon
# cgoncalves@iscsp.ulisboa.pt
#
# Subject Matter: Lecture Materials on Artificial Intelligence for Decision Making
#
# Game Theory classes:
# - Class player
# - Class game
#
# The player class introduces an artificial agent that implements the decision 
# process of game theory based on Nash decision making process);
#
# The game class (defines the structure of the game and calculates the pure strategies Nash Equilibrium of a game).
# 
# For more details and lecture materials (in Portuguese) see: 
# https://sites.google.com/site/autonomouscomputingsystems/lectures-in-portuguese/decision-support-methods
#
# For implementations of the classes see:
# - Prisoner Dilemma (2 person): http://pythonfiddle.com/prisoner-dilemma/
# - Prisoner Dilemma (3 person): http://pythonfiddle.com/three_person-prisoner-dilemma



class player:
    
    def __init__(self,name,order,strategySpace,payoffs,choice,suboptimal,strategies,state,gameplay):
        self.name = name
        self.order = order
        self.strategySpace = strategySpace
        self.payoffs = payoffs
        self.choice = choice
        self.suboptimal = suboptimal
        self.strategies = strategies
        self.state = state
        self.gameplay = gameplay


    def processGame(self,G):
        for i in range(0,len(G)):
            X = G[i]
            if X[0] == self.name:
                for j in range(1,len(X)):
                    Branch = X[j]
                    Alternative = list(Branch)
                    del Alternative[len(Alternative) - 1]
                    self.strategySpace = self.strategySpace + [tuple(Alternative)]
                    self.payoffs = self.payoffs + [Branch[len(Branch) - 1]]
        
    def evaluate(self):
        X = []
        for i in range(0,len(self.strategySpace)):            
            Alternative1 = self.strategySpace[i]
            for j in range(0,len(self.strategySpace)):
                Alternative2 = self.strategySpace[j]
                if Alternative1 != Alternative2:
                    if len(Alternative1) == len(Alternative2):
                        Compare = 0
                        for k in range(0,len(Alternative1) - 1):
                            if Alternative1[k] == Alternative2[k]:
                                Compare = Compare + 0
                            else:
                                Compare = Compare + 1
                        if Compare == 0:
                            PayoffCompare = [self.payoffs[i],self.payoffs[j]]
                            M = max(PayoffCompare)
                            if self.payoffs[i] == M:
                                self.choice = Alternative1
                                X = X + [self.choice]
                            else:
                                self.suboptimal = self.suboptimal + [Alternative1]
                            if self.payoffs[j] == M:
                                self.choice = Alternative2
                                X = X + [self.choice]
                            else:
                                self.suboptimal = self.suboptimal + [Alternative2]
            
        X = set(X)
        self.suboptimal = set(self.suboptimal)
        self.strategies = list(X - self.suboptimal)
        print "\nStrategies selected by ", self.name,":"
        print self.strategies
        for l in range(0,len(self.strategies)):
            strategy = self.strategies[l]
            for m in range(0,len(strategy)):
                O = self.order[m]
                self.state[O] = strategy[m]
            self.gameplay = self.gameplay + [tuple(self.state)]
                    
        
        

class game:
    def __init__(self,players,structure,optimal):
        self.players = players
        self.structure = structure
        self.optimal = optimal

    def Nash(self,GP):
        Y = set(GP[0])
        for i in range(0,len(GP)):
            X = set(GP[i])
            Y = Y & X
        self.optimal = list(Y)
        if len(self.optimal) != 0:
          print "\nThe pure strategies Nash equilibria are:"
          for k in range(0,len(self.optimal)):
              print self.optimal[k]
        else:
            print "\nThis game has no pure strategies Nash equilibria!"
