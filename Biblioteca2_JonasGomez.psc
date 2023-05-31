//Menu Biblioteca
//Aplicacion que gestiona los libros de una biblioteca
//Realizar procesos introducir, listar, eliminar , salir
//Introducir los libros uno a uno guardandolos en la memoria
//Listar todos los libros que almacene la biblioteca
//Eliminar cualquier libro conservando el resto de libros

SubProceso visualizar(codigo por valor, digito por valor, autor por valor)
	Segun codigo Hacer
		1:
			Escribir "Biblioteca vacía";
		2:
			Escribir "Datos guardados";
		3:
			Escribir "Datos no se guardaron";
		4:
			Escribir "No existe libro ", digito;
		5:
			Escribir "Datos libro ", digito, " son";
		6:
			Escribir "Datos libro no modificados";
		7:
			Escribir "Datos libro ", digito, " modificados";
		8:
			Escribir "Datos libro ", digito, " no se modificaron";
		9:
			Escribir "Libro borrado";
		10:
			Escribir "Libro no se borro";
		11:
			Escribir "Libros encontrados";
		12:
			Escribir "No se encontraron libros de ", autor;
		13:
			Escribir "Listado libros";
	FinSegun
FinSubProceso

Funcion respuesta <- verificar(pregunta por valor)
	definir respuesta Como Logico;
	definir letra Como Caracter;
	Repetir
		Escribir Sin Saltar pregunta;
		leer letra;
		si letra = 's' o letra = 'S' Entonces
			respuesta <- Verdadero;
		sino 
			respuesta <- Falso;
		FinSi
	Hasta Que letra = 's' o letra = 'S' o letra = 'n' o letra = 'N'
FinFuncion

SubProceso buscar(libreria Por Referencia, contador Por Valor)
	definir indice, j Como Entero;
	definir autor como Cadena;
	si contador > 0 Entonces
		Escribir Sin Saltar "Introduzca autor ";
		leer autor;
		visualizar(11, 0, "");
		j <- 0;
		Para indice <- 0 hasta contador - 1 Hacer
			si libreria[indice, 1] = autor Entonces
				Escribir "[Libro ", indice, " Titulo: ", libreria[indice, 0], ", Autor: ", libreria[indice, 1], ", Año: ", libreria[indice, 2], "]";
				j <- j + 1;
				si j = 0 Entonces
					visualizar(12, 0, autor);
					Escribir "";
				sino 
					Escribir "";
				FinSi
			SiNo
				visualizar(1, 0, "");
				Escribir "";
			FinSi
		FinPara
	FinSi
FinSubProceso

SubProceso mostrar(libreria Por Referencia, contador Por Valor)
	definir indice como entero;
	si contador > 0 Entonces
		Escribir Sin Saltar "Introduzca numero de libro a mostrar (0-",contador-1,")";
		leer indice;
		si indice < 0 o indice > contador - 1 Entonces
			visualizar(4, indice, "");
			Escribir "";
		SiNo
			visualizar(5, indice, "");
			Escribir "Titulo: ", libreria[indice, 0];
			Escribir "Autor: ", libreria[indice, 1];
			Escribir "Año: ", libreria[indice, 2];
			Escribir "";
		FinSi
	SiNo
		visualizar(1, 0, "");
		Escribir "";
	FinSi
FinSubProceso

SubProceso actualizar(libreria Por Referencia, contador por valor)
	definir indice Como Entero;
	definir titulo, autor, anyo como cadena;
	si contador > 0 Entonces
		Escribir Sin Saltar "Introduzca numero de libro a modificar (0-",contador-1,")";
		leer indice;
		si indice < 0 o indice > contador-1 Entonces
			visualizar(4, indice, "");
			Escribir "";
		SiNo
			visualizar(5, indice, "");
			Escribir "Titulo: ", libreria[indice, 0];
			Escribir "Autor: ", libreria[indice, 1];
			Escribir "Año: ", libreria[indice, 2];
			Escribir "";
			si verificar("¿Desea modificar este libro? (s/n)") Entonces
				Escribir "Introduzca los nuevos datos del libro ", indice;
				Escribir Sin Saltar "Titulo: ";
				leer titulo;
				Escribir Sin Saltar "Autor: ";
				leer autor;
				Escribir Sin Saltar "Año: ";
				leer anyo;
				Escribir "";
				si verificar("¿Guardar los nuevos datos introducidos? (s/n)") Entonces
					libreria[indice, 0] <- titulo;
					libreria[indice, 1] <- autor;
					libreria[indice, 2] <- anyo;
					visualizar(7, indice, "");
					Escribir "";
				SiNo
					visualizar(8, indice, "");
					Escribir "";
				FinSi
			SiNo
				visualizar(6, 0, "");
			FinSi
		FinSi
	SiNo
		visualizar(1, 0, "");
	FinSi
FinSubProceso

SubProceso Menu()
	Escribir "MENU BIBLIOTECA" ;
	Escribir "1) Introducir libro" ;
	Escribir "2) Listar libreria" ;
	Escribir "3) Eliminar libro" ;
	Escribir "4) Buscar libro" ;
	Escribir "5) Mostrar libro" ;
	Escribir "6) Actualizar libro" ;
	Escribir "0) Salir programa" ;
	Escribir "" ;
FinSubProceso

SubProceso Introducir( libreria Por Referencia , contador Por Referencia )
Definir titulo , autor , anyo Como Cadena ;
Escribir "Introduzca datos del libro" ;
Escribir Sin Saltar "TITULO " ;
Leer titulo ;
Escribir Sin Saltar "AUTOR " ;
Leer autor ;
Escribir Sin Saltar "AÑO " ;
Leer anyo ;
si verificar("¿Guardar los datos introducidos (s/n)?") Entonces
	libreria[ contador , 0 ] <- titulo ;
	libreria[ contador , 1 ] <- autor ;
	libreria[ contador , 2 ] <- anyo ;
	contador <- contador + 1 ;
	visualizar(2,0,"");
	Escribir "" ;
SiNo
	visualizar(3,0,"");
	Escribir "";
FinSi
FinSubProceso



SubProceso Listar( libreria Por Referencia , contador Por Valor )
Definir indice Como Entero ;
Si contador >= 1 Entonces
	visualizar(13, 0 ,"");
Para indice <- 0 Hasta contador - 1 Hacer
Escribir "[Libro ", indice, " Titulo: ", libreria[indice, 0], ", Autor: ", libreria[indice, 1], ", Año: ", libreria[indice, 2], "]";
FinPara
Escribir "" ;
SiNo
	visualizar(1,0,"");
Escribir "" ;
FinSi
FinSubProceso



SubProceso Eliminar( libreria Por Referencia , contador Por Referencia )
	Definir indice Como Entero ;
	Si contador >= 1 Entonces
		Escribir Sin Saltar "Introduzca numero de libro a eliminar (0-" , contador - 1 , ")" ;
		Leer indice ;
			Si indice < 0 | indice > contador - 1 Entonces
				visualizar(4,indice,"");
				Escribir "" ;
			SiNo
				visualizar(5,indice,"");
				Escribir "TITULO " , libreria[ indice , 0 ] ;
				Escribir "AUTOR " , libreria[ indice , 1 ] ;
				Escribir "AÑO " , libreria[ indice , 2 ] ;
				Escribir "" ;
				si verificar("¿Desea Eliminar este libro (s/n)") Entonces
					libreria[ indice , 0 ] <- "" ;
					libreria[ indice , 1 ] <- "" ;
					libreria[ indice , 2 ] <- "" ;
					Mientras indice < contador - 1 Hacer
						libreria[ indice , 0 ] <- libreria[ indice + 1 , 0 ] ;
						libreria[ indice , 1 ] <- libreria[ indice + 1 , 1 ] ;
						libreria[ indice , 2 ] <- libreria[ indice + 1 , 2 ] ;
						indice <- indice + 1 ;
					FinMientras
					contador <- contador - 1 ;
					visualizar(9,0,"");
					Escribir "";
				SiNo
					visualizar(10,0,"");
					Escribir "";
				FinSi
			FinSi
	SiNo
		visualizar(1,0,"");
		Escribir "" ;
	FinSi
FinSubProceso

Proceso Biblioteca
	Escribir "" ;
	Dimension libreria[ 10 , 3 ] ;
	Definir opcion , contador Como Entero ;
	Definir libreria Como Cadena ;
	contador <- 0 ;
	Repetir
		Menu() ;
		Repetir
			Escribir Sin Saltar "Introduzca opcion (0-6)" ;
			Leer opcion ;
		Hasta Que opcion >= 0 & opcion <= 9
	Segun opcion Hacer
		1 : Introducir( libreria , contador ) ;
		2 : Listar( libreria , contador ) ;
		3 : Eliminar( libreria , contador ) ;
		4 : buscar(libreria, contador);
		5 : mostrar(libreria, contador);
		6 : actualizar(libreria, contador);
		FinSegun
	Hasta Que opcion = 0
FinProceso