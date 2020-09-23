--Mejorar Rendimiento de la consulta
 --1. Escribir consultas con buen desempeño:
   --siempre usar where para filtrar y devolver las filas necesarias no traer todos los datos, no usar *, solo columnas necesarias)
   --En el predicado del where evitar expresiones que manipulan columnas (formulas y condiciones complejas), 
   --utilizar lo menos posibles tablas temporales (su tiempo de vida es hasta q es eliminada o termina la sesión donde se creó) frente a las variables de tabla
   -- funciones de ventanas, consultas q dejamos guardadas a través de una vista o función
     /*EJM TABLA TEMPORAL
	 SELECT c1,c2
	 into #tablaTemporal
	 FROM tabla1

	 select * from #TablaTemporal
	 */
	 --Evitar los cursores y aplicar índices de manera correcta
	 --Trabaje con su DBA para organizar buenos índices para apoyar filtros, joins y ordenamiento

 --2. La indexación en SQL Server
 -- 2.1 Fundamentos de índice de Servidor SQL: índice agrupados [DICCIONARIO]
	 --Se ordena físicamente en el disco
	 --Los índices agrupados determinan el orden lógico de las filas dentro de una tabla
	 -- Un índice agrupado no es una estructura física separada de la tabla de datos, el índice se almacenará en la tabla (x eso agrupado o clustereado)
	 -- Un índice agrupado por tabla
 -- 2.2 Fundamentos de índice de Servidor SQL: índice no agrupados [INDICE DE UN LIBRO]
	 --Crear una estructura adicional llamada nivel de hoja
	 --Son estructuras separadas con punteros a la ubicación de los datos
	 --Los índices no agrupados proporcionan alternativas para localizar rápidamente los datos
	   --EWJM: Si la tabla esta agrupado por idEmp, un índice no agrupado en el apellido puede ser útil para consultas que utilizan apellido en el predicado
	   --Una tabla puede tener varios índices no agrupados a diferencia del agrupado q solo permite 1 x tabla
	 --La adición de índices no agrupados se suma a los requisitos de almacenamiento de base de datos, se suma al tiempo de procesamiento cuando se actualizan los datos
 --3. Índices de SQL Server: Consideraciones sobre el rendimiento
 --Permiten búsquedas más eficientes, bien colocados evitan gastar tiempo en ordenar los datos ya que estos se encontrarán preordenados
 --SQL Server tiene acceso a datos mediante 1. el uso de índices o  2.mediante el escaneo de todas las filas de una tabla
 --Los índices también soportan operaciones tale como la agrupación, unión y clausulas ORDER BY para los clustereados
 
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

 --4. Estadísticas de distribución
	--Las estadisticas de distribucion describen la distribucion y la singularidad, de la selectividad(consulta q devuelve pocos datos) de los datos
	--Las estadisticas de nuestros datos se crean y actualizan automaticamente de forma predeterminada
	-- Las estadisticas son utilizadas por el optimizador de consultas para estimar la selectividad de los datos, incluyendo el tamaño de los resultados

 --5. Decisión de cursores
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
 

