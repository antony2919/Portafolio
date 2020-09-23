--Mejorar Rendimiento de la consulta
 --1. Escribir consultas con buen desempe�o:
   --siempre usar where para filtrar y devolver las filas necesarias no traer todos los datos, no usar *, solo columnas necesarias)
   --En el predicado del where evitar expresiones que manipulan columnas (formulas y condiciones complejas), 
   --utilizar lo menos posibles tablas temporales (su tiempo de vida es hasta q es eliminada o termina la sesi�n donde se cre�) frente a las variables de tabla
   -- funciones de ventanas, consultas q dejamos guardadas a trav�s de una vista o funci�n
     /*EJM TABLA TEMPORAL
	 SELECT c1,c2
	 into #tablaTemporal
	 FROM tabla1

	 select * from #TablaTemporal
	 */
	 --Evitar los cursores y aplicar �ndices de manera correcta
	 --Trabaje con su DBA para organizar buenos �ndices para apoyar filtros, joins y ordenamiento

 --2. La indexaci�n en SQL Server
 -- 2.1 Fundamentos de �ndice de Servidor SQL: �ndice agrupados [DICCIONARIO]
	 --Se ordena f�sicamente en el disco
	 --Los �ndices agrupados determinan el orden l�gico de las filas dentro de una tabla
	 -- Un �ndice agrupado no es una estructura f�sica separada de la tabla de datos, el �ndice se almacenar� en la tabla (x eso agrupado o clustereado)
	 -- Un �ndice agrupado por tabla
 -- 2.2 Fundamentos de �ndice de Servidor SQL: �ndice no agrupados [INDICE DE UN LIBRO]
	 --Crear una estructura adicional llamada nivel de hoja
	 --Son estructuras separadas con punteros a la ubicaci�n de los datos
	 --Los �ndices no agrupados proporcionan alternativas para localizar r�pidamente los datos
	   --EWJM: Si la tabla esta agrupado por idEmp, un �ndice no agrupado en el apellido puede ser �til para consultas que utilizan apellido en el predicado
	   --Una tabla puede tener varios �ndices no agrupados a diferencia del agrupado q solo permite 1 x tabla
	 --La adici�n de �ndices no agrupados se suma a los requisitos de almacenamiento de base de datos, se suma al tiempo de procesamiento cuando se actualizan los datos
 --3. �ndices de SQL Server: Consideraciones sobre el rendimiento
 --Permiten b�squedas m�s eficientes, bien colocados evitan gastar tiempo en ordenar los datos ya que estos se encontrar�n preordenados
 --SQL Server tiene acceso a datos mediante 1. el uso de �ndices o  2.mediante el escaneo de todas las filas de una tabla
 --Los �ndices tambi�n soportan operaciones tale como la agrupaci�n, uni�n y clausulas ORDER BY para los clustereados
 
 --Operaciones
 
	--clustered index scan(no tan ok)
	--no clustered index scan(ok)
	--clustered index seek(ok) --busca atravez del indic
	--agregate
	--Sort
	--Joins Merge, OK(Se necesita que las 2 tablas esten ordenadas)
	--Join Nested : no tan ok(al menos 1 tabla ordenada) , si queiro q deja de hacer nested entronces tienes q colocar idncies entre la llave primeria de una tabla con la llave foranea de otra tabla, 
	   --de tal manera q encuntre los datos ordenados y se realice un merge
	--Join Hash(mas deficiente , ya q al no encontrar un ordenamiento basico a travez de indices en niguna de las dos tablas o conj de datos
	--tiene que crear una tabla temporal ordenada para sustituis uno de los conjuntos y luego emular un join como el Nested Loop)

 --4. Estad�sticas de distribuci�n
	--Las estadisticas de distribucion describen la distribucion y la singularidad, de la selectividad(consulta q devuelve pocos datos) de los datos
	--Las estadisticas de nuestros datos se crean y actualizan automaticamente de forma predeterminada
	-- Las estadisticas son utilizadas por el optimizador de consultas para estimar la selectividad de los datos, incluyendo el tama�o de los resultados

 --5. Decisi�n de cursores
	--Proporcionan un mecanismo para trabajar con una fila a la vez en un cierto orden , ahora existen recordset en visual basic, los progrmadaores de antes no tenian como cargar los datos a memoria.
	--Normalmente requieren mas codigo que el enfoque basado en conjuntos
	--Normalmente incurren en mas sobrecarga durante la ejecucion de una operacion

	--Alternativa a los cursosres:
	 --1.Funciones de ventanas
	 --2. Las funciones de agregados
	--USO apropiados para los cursores:
	  --Generacion de codigo SQL dinamico
	  --La realizacion de tareas administrativas
 --6. Evitar cursores
 --Un plan de ejecucion incluye informacion sobre que tablas acceso, lo que los indices, lo que une a realizar
 --Hay 2 accesos a los planes de ejecucion: 1 estimado , 2. ejecutado(devuelve xcuando finaliza la ejecucion d la consulta)
 

