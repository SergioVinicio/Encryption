# -*- coding: utf-8 -*-
"""
Created on Mon Oct 16 08:40:09 2017

@author: gaestrada
"""

Index_List = [(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e'),(6,'f'),(7,'g'),(8,'h'),(9,'i'),(10,'j'),(11,'k'),(12,'l'),(13,'m'),(14,'n'),(15,'o'),(16,'p'),(17,'q'),(18,'r'),(19,'s'),(20,'t'),(21,'u'),(22,'v'),(23,'w'),(24,'x'),(25,'y'),(26,'z')]
Index_Dict = dict(Index_List)
Prime_List = [2,3,5,7,11,13]

def Determine_Divisibility(number):
    factors = []
    for i in Prime_List:
        result = number % i
        while result == 0 :
            factors.append(i)
            number = number/i
            result = number % i
    return factors
        

    
godel_number = 1613472000

from collections import Counter

values = list(Counter(Determine_Divisibility(godel_number)).values())


password = []
for a in values:
    value = Index_Dict.get(a)
    password.append(value)


print(password)