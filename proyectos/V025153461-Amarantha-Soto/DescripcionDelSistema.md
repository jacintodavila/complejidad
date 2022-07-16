## Descripción libre del sistema.

En el documento se hace un estudio del sistema de almacenamiento y manejo de información de
700 estudiantes de una institución educativa a manos de una secretaria venezolana con estudios
de Técnico Medio en informática. Lo primero que se hace notar en el sistema es la participación de
la secretaria, que trabaja en un cubículo reducido y oscuro en la institución y quien hace uso de su
horario de trabajo estándar (7am-1:30am y 2:00 pm-6pm) para el manejo de dicha información y
muchas veces tiene que hacer envíos de data a los entes superiores en fines de semana
resolviendo como se pueda con los equipos que tiene en su casa. Lo bueno de esta situación es
que haber cursado estudios de técnico medio en informática le permite mitigar lo duro del trabajo
y hacer uso de las plataformas que ofrece el mercado, lo malo es que no cuenta con los recursos
necesarios para que el sistema que maneja sea seguro pues solo se vale de pendrives, hojas Excel
y una plataforma de procedencia pirata además que la institución no se interesa por revisar el
cómo maneja la situación. Para el manejo de la información desarrolló un sistema con acceso a
base de datos en Acces 2007 teniendo como único recurso una computadora con el sistema
operativo Windows 7 (pirata) que cuenta con un disco duro de 750gb y tiene acceso a internet y la
forma de respaldo de esta base de datos la realiza descargando todo el sistema en su versión
portable y mandándolo por correo a sí misma y también descargándolo en un usb portable, por lo
cual los extravíos y las averías están a la vuelta de la esquina.
Las peticiones de informes por parte de la zona educativa se reciben de lunes a viernes en horario
de trabajo y de vez en cuando en fines de semana, y cuando no se cuenta con energía eléctrica en
la institución la secretaria usa su tiempo libre para solventar la situación con la información que
tenga guardada en el respaldo.
En Venezuela mucho se habla de la importancia de las escuelas técnicas y de cómo desempeñan
un papel económico clave en la mejora de las destrezas laborales y la integración de los jóvenes en
el mercado laboral. Lo interesante sería revisar hasta que punto es bueno aplicar los
conocimientos adquiridos en ellas en sistemas que no tienen el debido respaldo de plataformas o
que tanto recargo de trabajo se les hace a las personas que cursan estos estudios ya que, aunque
desde el punto de vista humano no hay nada de malo en aliviar las cargas personales con las
técnicas aprendidas, el sobrecargo de trabajo que las instituciones en que laboran les hacen puede
ser un problema.
Hasta el momento se hace énfasis en la poca seguridad del sistema que contiene información de
700 menores de edad, pero este no parece ser un problema para la escuela tradicional venezolana
quien contrata (a veces) técnicos medios que tienen conocimientos sobre seguridad digital pero
que no tienen como aplicarlos, trabajando, pero infringiendo las mismas normas de seguridad que
aprendieron o contratando bachilleres con cursos de manejos de data para ejercer las mismas
labores (o sin ellos) para trabajar con información delicada.
La base de datos que desarrolló la secretaria cuenta con las siguientes funcionalidades:

Almacena la siguiente información:
o Datos personales, teléfonos, correo electrónico año y sección que estudia la
alumna.

- Datos personales, teléfonos, correo electrónico del representante legal.
- Datos personales, teléfonos, correo electrónico del padre de la estudiante.
- Datos personales, teléfonos, correo electrónico de la madre de la estudiante.
- Nombres y teléfonos de las empresas con las que tiene contacto el colegio.
- Nombres y teléfonos de las instituciones con las que tiene contacto el colegio.
- Documentos que ha entregado la alumna.
- Documentos que aún no ha entregado la alumna.
- Datos y fecha en que fue retirada la alumna de la institución.
- Datos de las alumnas que se graduaron en la institución.
- Años que ha estudiado la alumna en la institución.
- Permite generar las siguientes consultas:
- Nombre de las alumnas con un ingreso igual al suministrado por quien utiliza el
sistema.
- Nombre de las estudiantes según el estado civil de la madre.
- Nombre de las estudiantes según el estado civil del padre.
- Teléfono y correo electrónico de las estudiantes de una sección o mención
específica.
- Tipo de sangre, talla y peso de las alumnas de una sección o mención específica.
- Número de familias con representadas en el colegio.
- Datos personales de las alumnas según la edad que tengan.
- Datos de la alumna y años que estudiado en la institución
- Teléfono y correo electrónico de los representantes legales de las alumnas de una
sección o mención específica.
- Nombre de la alumna e información de la empresa en que realizan las pasantías
las estudiantes de una mención.
- Nombre de la alumna e información de la institución en que realizan la labor social
las estudiantes de una mención.
- Listado de las alumnas que viven en un sector específico.
- Listado de las alumnas junto con su información personal según el año que
estudian.
- Listado de las alumnas junto con su información personal según la sección o
mención que estudian.
- Listado de empresas con las cuales ha trabajado el colegio para la realización de
las pasantías.
- Listado de las instituciones con las cuales ha trabajado el colegio para la
realización de la labor social.
- Nombres de las alumnas que viven en un sector específico.
- Listado de los sectores y las alumnas que viven en ellos.
- Datos de las alumnas junto con los documentos que ha entregado según el año y
la sección que estudia.
- Datos del padre de las alumnas de un año y sección específica.
- Datos de la madre de las alumnas de un año y sección específica.

- Permite actualizar la siguiente información:
- Año en que estudia la alumna.
- Status de la alumna (graduada, inscrita, no inscrita, retirada)
 Permite modificar la siguiente información:
- Sector, teléfonos y correo electrónico de alumnas, padres, madres y
representantes legales.
- Sección que estudia la alumna.
- Permite eliminar la siguiente información:
- Datos de representantes, madres y padres que ya no tengan alumnas en el
colegio.

La información se guarda de forma ordenada en las siguientes tablas:
- Tabla ALUMNAS en que se registra la información personal de las alumnas de la escuela
básica y técnica que ya entregaron todos los documentos de inscripción junto con la
información del grado y sección en que estudian , los documentos que han entregado y los
datos personales del representante legal.
- Tabla EMPRESA y tabla INSTITUCION en que se guarda el listado de empresas con las que
trabaja la coordinación de pasantías de la institución. Estas tablas están relacionadas con
la tabla ALUMNAS en los campos código_emp y código_inst.
- Tabla GRADOS en que se almacena el nombre y cedula de las alumnas graduadas del
colegio inmaculada junto con la el nombre de la institución donde hizo su labor social y la
empresa donde realizo sus pasantías.
- Tabla RETIRADAS que almacena la información de las alumnas que fueron retiradas de la
institución. Esta información es la misma que la de la tabla ALUMNAS.
- Tabla SOLICITUD que guarda la lista de las personas que aspiran un cupo en la institución
pero que aún no han sido inscritas en ella.

Desde el punto de vista de manejo de base de datos no hay fallas en la lógica del sistema por lo
que desde la visión de alivio de trabajo que (supongo) se quiere funciona bien.