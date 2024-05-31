# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
π Pname,Ssn,Fname,Lname (
	(project) ⨝
  	 Pnumber=Pno works_on ⨝
			Essn=Ssn (employee)
)


```


### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
γ Pnumber,Pname;sum(Hours)->horas (employee ⨝Ssn=Essn (project ⨝Pnumber=Pno works_on))
```


### *d)* 

```
... Write here your answer ...
```


### *e)* 

```
π Fname,Minit,Lname (σ Pno=null (employee ⟕Ssn=Essn works_on))
```


### *f)* 

```
... Write here your answer ...
```


### *g)* 

```
funcionarios_dependentes = employee ⨝Ssn=Essn dependent

numero_dependentes = γ Ssn,Fname,Minit,Lname;count(Dependent_name)->dependentes (funcionarios_dependentes)

π Ssn,Fname,Minit,Lname (σ dependentes>2 (numero_dependentes))
```


### *h)* 

```
... Write here your answer ...
```


### *i)* 

```

proj_func = project ⨝ Pno=Pnumber (employee ⨝ Ssn=Essn works_on)

departamento_loc = π department.Dnumber,Dname,Dlocation (department ⨝ department.Dnumber=dept_location.Dnumber dept_location)

π Ssn,Fname,Minit,Lname,Address (σ dept_location.Dlocation≠'Aveiro' ∧ project.Plocation='Aveiro' (proj_func ⨝ Dno=Dnumber departamento_loc))

```


## ​Problema 5.2

### *a)*

```
π nome (σ numero=null (fornecedor ⟕ (nif=fornecedor) encomenda))
```

### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
total_prods_enc = γ numEnc; count(numEnc)-> total_product (item)

γ avg(total_product)-> numero_medio_produtos (total_prods_enc)
```


### *d)* 

```
... Write here your answer ...
```


## ​Problema 5.3

### *a)*

```
π numUtente,nome (σ numPresc = null (paciente ⟕ prescricao))

```

### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
presc_farmacia = farmacia ⨝nome=farmacia prescricao

γ nome;count(numPresc)->prescricoes_processadas (presc_farmacia)

```


### *d)* 

```
... Write here your answer ...
```

### *e)* 

```
presc_farmacia = farmacia ⨝nome=farmacia prescricao

farmaceutica_farmaco_farm = π presc_farmaco.numPresc, numRegFarm, nomeFarmaco, nome (presc_farmaco ⨝prescricao.numPresc=presc_farmaco.numPresc (presc_farmacia))

Farmaceutica_farmaco_farm_nome = π presc_farmaco.numPresc, farmaceutica.nome, nomeFarmaco, farmacia.nome (farmaceutica ⨝numReg=numRegFarm farmaceutica_farmaco_farm)

γ farmacia.nome,farmaceutica.nome;count(farmaceutica.nome)->vendas (Farmaceutica_farmaco_farm_nome)
```

### *f)* 

```
presc_paciente = prescricao ⨝prescricao.numUtente=paciente.numUtente paciente

med_paciente = π numSNS,medico.nome,paciente.nome (medico ⨝numSNS=numMedico (presc_paciente))

γ paciente.nome;count(medico.nome)->num_medicos (med_paciente)
```
