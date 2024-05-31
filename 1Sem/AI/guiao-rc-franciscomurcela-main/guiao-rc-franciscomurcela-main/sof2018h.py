from bayes_net import *

bn = BayesNet()

variables = ['sc', 'pt', 'cp', 'fr', 'pa', 'cnl']

bn.add(None, [], 0)

bn.add('sc', [], 0.6)
bn.add('cp', [('sc', True), ('pa', False)], 0.01)
bn.add('cp', [('sc', True), ('pa', True)], 0.02)
bn.add('cp', [('sc', False), ('pa', False)], 0.001)
bn.add('cp', [('sc', False), ('pa', True)], 0.011)

bn.add('cnl', [('sc', False)], 0.001)
bn.add('cnl', [('sc', True)], 0.9)

bn.add('pt', [], 0.05)
bn.add('pa', ['pt', True], 0.25)
bn.add('pa', [('pt', False)], 0.004)
bn.add('fr', [('pt', False), ('pa', True)], 0.1)
bn.add('fr', [('pt', False), ('pa', False)], 0.01)
bn.add('fr', [('pa', True), ('pt', True)], 0.9)
bn.add('fr', [('pa', False), ('pt', True)], 0.9)

def individualProb(self, variable, prob):
    individual_prob=0.0
    for mothers in self.dependencies[variable].keys():
        individual_prob += self.jointProb([(variable, prob)] + list(mothers))
    return individual_prob

