#Exercicio 1.1
def comprimento(lista):
	if lista==[]:
		return 0
	else:
		return 1+comprimento(lista[1:])
	pass

#Exercicio 1.2
def soma(lista):
	if lista==[]:
			return 0
	else: return lista[0]+soma(lista[1:])
	pass

#Exercicio 1.3
def existe(lista, elem):
	if lista==[]:
		return False
	elif lista[0]==elem:
		return True
	else: return existe(lista[1:], elem)
	pass

#Exercicio 1.4
def concat(l1, l2):
	if l2==[]:
		return l1
	else: return concat(l1+[l2[0]], l2[1:])
	pass

#Exercicio 1.5
def inverte(lista):
	if lista==[]:
		return []
	else: return inverte(lista[1:])+[lista[0]]
	pass

#Exercicio 1.6
def capicua(lista):
	if lista==[]:
		return True
	elif lista[0]==lista[-1]:
		return True and capicua(lista[1:-1])
	else: return False
	pass

#Exercicio 1.7
def concat_listas(lista):
	if lista==[]:
		return []
	return lista[0]+concat_listas(lista[1:])
	pass

#Exercicio 1.8
def substitui(lista, original, novo):
	if lista==[]:
		return []
	elif lista[0]==original:
		return [novo]+substitui(lista[1:], original, novo)
	else: return [lista[0]]+substitui(lista[1:], original, novo)
	pass
#Exercicio 1.9
def fusao_ordenada(lista1, lista2):
	if lista2 == []:
		return lista1
	elif lista1 == []:
		return lista2
	elif lista1[0] < lista2[0]:
		return [lista1[0]] + fusao_ordenada(lista1[1:], lista2)
	else:
		return [lista2[0]] + fusao_ordenada(lista1, lista2[1:])
	pass

#Exercicio 1.10
def lista_subconjuntos(lista):
	if lista==[]:
		return [[]]
	else:
		temp = lista_subconjuntos(lista[1:])
		return temp + [[lista[0]] + x for x in temp]
	pass


#Exercicio 2.1
def separar(lista):
	if lista == []:
		return ([], [])
	else: 
		a = lista[0][0]
		b = lista[0][1]
		new = separar(lista[1:])
		new = ([a]+ new[0], [b]+ new[1])
		return new
	pass

#Exercicio 2.2
def remove_e_conta(lista, elem):
	if elem not in lista:
		return ([], 0)
	prim=lista[0]
	resto, cont = remove_e_conta(lista[1:], elem)
	if prim==elem:
		return (resto, cont+1)
	else: return ([prim]+resto, cont)
	pass

#Exercicio 3.1
def cabeca(lista):
	if lista==[]:
		return None
	else: return lista[0]
	pass

#Exercicio 3.2
def cauda(lista):
	if lista.size()<2:
		return None
	else: return lista[1:]
	pass

#Exercicio 3.3
def juntar(l1, l2):
	if l1==[]:
		return []
	if l2==[]:
		return None
	if len(l1)==len(l2):
		return [(l1[0], l2[0])]+juntar(l1[1:],l2[1:])
	else: return None

		
	pass

#Exercicio 3.4
def menor(lista):
	if lista==[]:
		return None
	elif len(lista)==1:
		return lista[0]
	elif lista[0]<lista[1]:
		return menor([lista[0]]+lista[2:])
	else: return menor(lista[1:])
	
	pass

#Exercicio 3.6
def max_min(lista):
	if lista ==[]:
		return None
	elif len(lista)==1:
		return (lista[0], lista[0])
	else:
		maior, menor = max_min(lista[1:])
		if lista[0]>maior:
			maior = lista[0]
		if lista[0]<menor:
			menor = lista[0]
		return (maior, menor)
	pass
