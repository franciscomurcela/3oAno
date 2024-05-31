import math
import functools
#Exercicio 4.1
impar = lambda x: x % 2 != 0

#Exercicio 4.2
positivo = lambda x: x>0

#Exercicio 4.3
comparar_modulo = lambda x,y: abs(x)<abs(y)

#Exercicio 4.4
cart2pol = lambda x,y: (math.sqrt(x**2+y**2),math.atan2(y,x))

#Exercicio 4.5
ex5 = lambda f,g,h: lambda x,y,z: h(f(x,y),g(y,z))

#Exercicio 4.6
def quantificador_universal(lista, f):
    return lambda lista: all(map(f, lista))
    
#Exercicio 4.8
def subconjunto(lista1, lista2):
    return all(item in lista2 for item in lista1)

#Exercicio 4.9
def menor_ordem(lista, f):
    if len(lista)==1 : return lista[0]
    
    cauda=menor_ordem(lista[1:],f)
    if f(lista[0],cauda):
        return lista[0]
    return cauda


#Exercicio 4.10
def menor_e_resto_ordem(lista, f):
    if len(lista)==1 : return (lista[0],[])
    
    cauda=menor_e_resto_ordem(lista[1:],f)
    if f(lista[0],cauda[0]):
        return (lista[0],cauda[1]+[cauda[0]])
    return (cauda[0],[lista[0]]+cauda[1])

    
    


#Exercicio 5.2 
def ordenar_seleccao(lista, ordem):
    if len(lista) <=1:
        return lista
    else:
        return ordenar_seleccao([e for e in lista[1:] 
                                if ordem(e, lista[0])], ordem)+[lista[0]]+ordenar_seleccao([e for e in lista[1:]
                                                                                            if not ordem(e, lista[0])], ordem)
    
