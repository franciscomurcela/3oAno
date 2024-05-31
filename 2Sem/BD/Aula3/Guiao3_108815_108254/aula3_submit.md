# BD: Guião 3


## ​Problema 3.1
 
### *a)*

```
<p><u>sublinhado(primary key)</u> <em>foreign key </em> </p>
<p>Cliente: <u>nif</u>, nome, endereço, num_carta </p>
<p>Balcão: <u>numero</u>, nome, endereço</p>
<p>Veículo: <u>matrícula</u>, ano, marca, <em>tipo_veiculo_codigo</em></p>
<p>Aluguer: <u>numero</u>, duração, data, <em>cliente_nif</em>, <em>balcão_num</em>, <em>veiculo_matricula</em></p>

<p>Tipo_veiculo: <u>código</u>, ArCondicionado, designação</p>
<p>Similaridade: <u><em>TV_codigo, TV_codigo2</em></u> </p>

<p>Ligeiro: <u>TipoVeiculo_Codigo</u>, Combustivel, Portas, NumLugares</p>
<p>Pesado: <u>TipoVeiculo_Codigo</u>, Peso, Passageiros</p>


```


### *b)* 

```
Cliente
Chaves Candidatas: nif, num_carta
Primary Keys:nif
Foreign Keys: -

Balcão
Chaves Candidatas: Número
Primary Keys: Número
Foreign Keys: -

Veículo: 
Chaves Candidatas: Matrícula, tipo_veiculo_codigo
Primary Keys: Matrícula
Foreign Keys: tipo_veiculo_codigo

Aluguer: 
Chaves Candidatas: numero, cliente_nif, balcão_num, veiculo_matricula
Primary Keys: numero
Foreign Keys: cliente_nif, balcão_num, veiculo_matricula

Tipo_veiculo: 
Chaves Candidatas: Código
Primary Keys: Código
Foreign Keys: -

Similaridade: 
Chaves Candidatas: TV_codigo, TV_codigo2
Primary Keys: TV_codigo + TV_codigo2
Foreign Keys: TV_codigo + TV_codigo2



```


### *c)* 

![ex_3_1c!](ex_3_1c.jpg "AnImage")


## ​Problema 3.2

### *a)*

```

<p><u>sublinhado(primary key)</u> <em>foreign key </em> <strong> key parcial </strong></p> 

<p>Airport: <u>Airport_code</u>, City, State, Name, Airplane_type_name</p>

<p>Airplane_type: <u>Type_name</u>, Max_seats, Company, Airport_Airport_code</p>

<p>Airplane: <u>Airplane_id</u>, Total_no_of_seats, <strong>Airplane_type_name</strong></p>

<p>Flight: Number, Airline, Weekdays</p>

<p>Flight_leg(weak): <u><em>Flight_Number</em>, <strong>Leg_no </strong> , Airport_Departure, Airport_Arrival</u></p>

<p>Leg_Instance(weak): <u><em>FlightLeg-FlightNumber, Flight_Leg_no, Airport_Scheduled_departure, Airport_Scheduled_arrival , Airplane_Airplane_Id</em></u>, <strong>Date</strong>, No_of_avail_seats </p>
	
<p>Seat(weak):<u> FlightLeg_FlightNumber, Flight_Leg_no, Flight_Airport_Scheduled_departure, Flight_Airport_Scheduled_arrival, Date, Airplane_Airplane_Id, <strong>Seat_no</strong></u>, Cost_name, Cphone</p>

<p>Fare: Restrictions, Amount, <strong>Code</strong>, <em>Flight_Number</em></p>

```


### *b)* 

```
Airport
Keys Candidatas: Airport_code,Name
Primary Key(s): Airport_code
Foreign Key(s): -


Airplane_type 
Keys Candidatas:Type_name
Primary Key(s):Type_name
Foreign Key(s):-

Airplane
Keys Candidatas:Airplane_id,Airplane_type_name
Primary Key(s):Airplane_id
Foreign Key(s):Airplane_type_name

Flight
Keys Candidatas:Number
Primary Key(s):Number
Foreign Key(s):-

Flight_leg
Keys Candidatas:
Primary Key(s):
Foreign Key(s):Flight-Number, Leg_no , Airport_Departure. Airport_Arrival (tudo primary)

Leg_Instance
Keys Candidatas:
Primary Key(s):
Foreign Key(s):FlightLeg-FlightNumber, Flight_Leg_no, Airport_Scheduled_departure, Airport_Scheduled_arrival ,Date, Airplane_Airplane_Id(primary), No_of_avail_seats
	
Seat
Keys Candidatas:
Primary Key(s):
Foreign Key(s):FlightLeg-FlightNumber, Flight_Leg_no, Flight_Airport_Scheduled_departure, Flight_Airport_Scheduled_arrival, Date, Airplane_Airplane_Id, Seat_no(primary), Cost_name, Cphone

Fare
Keys Candidatas:
Primary Key(s):
Foreign Key(s):Restrictions, Amount, Code, Flight-Number

```


### *c)* 

![ex_3_2c!](ex_3_2c.jpg "AnImage")


## ​Problema 3.3


### *a)* 2.1

![ex_3_3_a!](ex_3_3a.jpg "AnImage")

### *b)* 2.2

![ex_3_3_b!](ex_3_3b.jpg "AnImage")

### *c)* 2.3

![ex_3_3_c!](ex_3_3c.jpg "AnImage")

### *d)* 2.4

![ex_3_3_d!](ex_3_3d.jpg "AnImage")