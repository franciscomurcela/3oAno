# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
SELECT * FROM authors
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
SELECT au_fname, au_lname, phone FROM authors
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
... Write here your answer ...
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
SELECT au_fname as first_name, au_lname as last_name, phone as telephone FROM authors
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
... Write here your answer ...
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT * FROM publishers 
  WHERE pub_name LIKE '%Bo%';
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
... Write here your answer ...
```

### *h)* Número total de vendas de cada editora; 

```
SELECT pub_name, SUM(qty) as sales
FROM ((sales join titles on sales.title_id = titles.title_id)
      join publishers on titles.pub_id = publishers.pub_id)
GROUP BY pub_name
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
... Write here your answer ...
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
SELECT distinct title
FROM ((titles join sales on titles.title_id = sales.title_id) join stores on sales.stor_id = stores.stor_id)
WHERE stores.stor_name = 'Bookbeat';
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
... Write here your answer ...
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
SELECT type, pub_id, avg(price) as average_price, sum(sales.qty) as sales
FROM (titles join sales on titles.title_id = sales.title_id)
GROUP BY titles.type, titles.pub_id 
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
... Write here your answer ...
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
SELECT title, au_fname as first_name, au_lname as last_name, ytd_sales*price*royalty/100 as earnings
 FROM (( titleauthor join titles on titleauthor.title_id = titles.title_id) join authors on titleauthor.au_id = authors.au_id)
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
... Write here your answer ...
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
SELECT title, ytd_sales, CONCAT(authors.au_fname, ' ', authors.au_lname) as author, ytd_sales*price*royalty/100 as auth_revenue, ytd_sales*price-royalty*price*ytd_sales/100 as publisher_revenue
    FROM (( titleauthor join titles on titleauthor.title_id = titles.title_id) join authors on titleauthor.au_id = authors.au_id)
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
... Write here your answer ...
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
SELECT stor_name as store_name
FROM (stores join sales on stores.stor_id = sales.stor_id) 
GROUP BY stor_name
HAVING sum(sales.qty) > avg(sales.qty);
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
... Write here your answer ...
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
SELECT publishers.pub_name, stores.stor_name
FROM publishers CROSS JOIN stores
WHERE NOT EXISTS (
    SELECT 1
    FROM sales
    JOIN titles ON sales.title_id = titles.title_id
    WHERE titles.pub_id = publishers.pub_id AND sales.stor_id = stores.stor_id
)
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT Ssn, Fname, Minit, Lname, Pno
FROM(employee, works_on)
WHERE (works_on.Essn = employee.Ssn)
ORDER BY Pno
```

##### *b)* 

```
... Write here your answer ...
```

##### *c)* 

```
SELECT project.Pname, sum(works_on.Hours) as h_semanais
FROM project, works_on
WHERE works_on.Pno = project.Pnumber
GROUP BY project.Pname
```

##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
SELECT Fname,Lname
FROM employee left outer join works_on on Ssn=Essn
WHERE Essn = null
```

##### *f)* 

```
... Write here your answer ...
```

##### *g)* 

```
SELECT Fname, Lname, count(Dependent_name) as number
FROM employee join dependent on Ssn=Essn
GROUP BY Fname, Lname
HAVING count(Dependent_name) > 2;
```

##### *h)* 

```
... Write here your answer ...
```

##### *i)* 

```
SELECT DISTINCT Fname, Lname, Address
FROM employee join works_on on Ssn=Essn join project on Pno=Pnumber join dept_location on Dno=Dnumber
WHERE Plocation='Aveiro' and Dlocation!='Aveiro';
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT nome
FROM fornecedor left join encomenda on nif=encomenda.fornecedor
WHERE encomenda.fornecedor = NULL
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
SELECT avg(cast(prod_encomenda as float)) as media_prod_encomenda
FROM (
    SELECT numEnc, COUNT(codProd) as prod_encomenda
    FROM item
    GROUP BY numEnc
) as total_produtos
```


##### *d)* 

```
... Write here your answer ...
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT nome
FROM paciente left outer join prescricao on paciente.numUtente=prescricao.numUtente
WHERE prescricao.numUtente = null
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
SELECT nome, count(numPresc) as presc_processadas
FROM farmacia join prescricao on nome=farmacia
GROUP BY nome
```


##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
SELECT farmacia,nome,count(nomeFarmaco) as farmaco_vend_farm from prescricao,presc_farmaco,farmaceutica
WHERE prescricao.dataProc != null and presc_farmaco.numPresc = prescricao.numPresc and numReg=numRegFarm
GROUP BY farmacia,nome
ORDER BY  farmacia
```

##### *f)* 

```
... Write here your answer ...
```
