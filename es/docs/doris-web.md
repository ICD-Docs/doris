# DORIS versión en línea

La versión en línea de DORIS es una aplicación web accesible a través de un navegador. Aplica las reglas de mortalidad de la CIE para seleccionar automáticamente la causa de defunción en certificados individuales. Puede acceder a la versión en línea [aquí](https://icd.who.int/doris/workspace/en). 

Es compatible con los 13 idiomas oficiales de la CIE-11: [árabe](https://icd.who.int/doris/ar), [chino](https://icd.who.int/doris/zh), [checo](https://icd.who.int/doris/cs), [eslovaco](https://icd.who.int/doris/sk), [español](https://icd.who.int/doris/es), [francés](https://icd.who.int/doris/fr), [inglés](https://icd.who.int/doris/en), [kazajo](https://icd.who.int/doris/kk), [portugués](https://icd.who.int/doris/pt), [ruso](https://icd.who.int/doris/ru), [sueco](https://icd.who.int/doris/sv), [turco](https://icd.who.int/doris/tr) y [uzbeko](https://icd.who.int/doris/uz). 

Para cambiar de idioma, utilice el botón de idioma situado en la esquina superior derecha de la pantalla. 

![Imagen de captura de pantalla de DORIS versión en línea ](img/DORISwebjune25.png){: style="width:40%"}

Proporcione la información requerida sobre la persona fallecida.

**Datos administrativos**: Complete los siguientes campos: sexo, fecha de nacimiento, fecha de defunción y edad estimada (en años, meses, semanas, días, horas, minutos o segundos), o seleccione «desconocido».

![Administrativedatoscaptura de pantalla imagen ](img/administrativedatascreenshotupdated.png){: style="width:40%"}

En la sección A, los campos de **Datos médicos** están vinculados a la herramienta de codificación de la CIE-11, lo que permite a los usuarios buscar por término o por código de la CIE-11.

Parte 1: Causa(s) de defunción. Complete las líneas a, b, c y d junto con sus intervalos de tiempo correspondientes. 

Parte 2: Indique otras condiciones importantes que contribuyeron a la defunción, junto con sus intervalos de tiempo correspondientes. En esta sección, pueden asignarse distintos intervalos de tiempo a cada afección. Para ello, el usuario debe buscar el término o código de la CIE-11 usando la herramienta de codificación y, a continuación, asignar el intervalo de tiempo correspondiente.

![FrameAmedicaldatascreenshotpicture ](img/FrameAmedicaldatascreenshotupdated.png){: style="width:40%"}

La sección B consta de los siguientes campos:

**Cirugía**: Proporcione toda la información relevante sobre las intervenciones quirúrgicas practicadas al fallecido.

![surgeryscreenshotpicture ](img/surgeryandautopsyscreenshot.png){: style="width:40%"}

**Manera de morir**: Especifique cómo se produjo la defunción (por ejemplo, si fue por una enfermedad, accidente, lesión autoinfligida, agresión).

![Mannerofdeathscreenshotpicture ](img/manneofdeathscreenshotupdated.png){: style="width:40%"}

**Lugar de ocurrencia** de la causa externa: Especifique el lugar donde se produjo la causa externa (por ejemplo, en casos de accidente o lesión). Esta información es esencial para documentar con precisión las circunstancias en las que se produjo la defunción.

**Muerte fetal o infantil**: Complete los datos requeridos sobre embarazo múltiple o muerte fetal, especificando el número de horas de vida si procede, el peso al nacer, el número de semanas completas de embarazo y la edad de la madre. Si la muerte fue perinatal, anote las condiciones de la madre que afectaron al feto y neonato. 

![fetalinfantdeathscreenshotpicture ](img/fetalinfantdeathscreenshotupdated.png){: style="width:40%"}

En el caso de las mujeres: 

**Estado respecto al embarazo**: ¿La fallecida estaba embarazada en el momento de la defunción? Elija la opción correcta. 

**Tiempo desde el embarazo**: Si la persona fallecida estaba embarazada, indique el tiempo transcurrido desde el embarazo.

**Contribución del embarazo a la muerte**: Especifique si el embarazo influyó en la defunción de la mujer. 

![pregnancyscreenshotpicture ](img/pregnancyscreenshotupdated.png){: style="width:40%"}

El botón **formulario de ejemplos** proporciona casos que demuestran cómo funciona la versión en línea de DORIS. Los usuarios pueden consultar estos casos demuestra para saber cómo utilizar la versión en línea.

Además, se agregó un botón de **borrar contenido**. Al hacer clic en este botón, los usuarios pueden iniciar un nuevo certificado de defunción con todos los campos vacíos, y así iniciar una nueva entrada sin datos previos.

Para procesar la causa básica de defunción, los usuarios simplemente deben hacer clic en el botón "**Procesar**". Esta acción generará la información necesaria en función de los datos introducidos, ayudando a los usuarios a seleccionar la causa básica de defunción.

Es posible completar y procesar varios Certificados Médicos de Causa de Defunción (CMCD) en una misma sesión mediante la versión en línea. Para consultar el resultado de un certificado concreto, diríjase a la sección "Explorar CMCD" en la parte superior derecha de la pantalla y haga clic sobre el CMCD correspondiente para visualizar los datos.

![browsemccds{](img/browsemccds.png): style="width:30%"}

**Sección de resultados** 

Una vez seleccionada la **causa básica de** defunción, se presentará en la sección de **resultados**, que incluye dos campos relacionados con la **causa básica de defunción.** El primer campo representa la causa básica única de defunción seleccionada a partir de la información facilitada y se resalta en amarillo para llamar la atención de los usuarios. Además, si está disponible, la sección de resultados también incluye un campo para la codificación en grupos (clusters) con múltiples **causas de defunción**. Este campo indica los códigos poscoordinados, si procede, lo que aporta mayor contexto y más detalles. 

![outputdetailedexplanationsscreenshotpicture{](img/outputdetailedexplanationscreenshot.png): style="width:40%"}

DORIS ofrece cuatro modos de visualización complementarios para apoyar la revisión, la validación y la capacitación:

**Reporte textual**: Esta visualización ilustra los pasos y las reglas de mortalidad que se aplicaron para seleccionar la causa básica de defunción. Incluye un campo de **advertencias**, que señala cualquier incoherencia en la información proporcionada o sugiere la necesidad de una verificación manual. Las advertencias se muestran en amarillo. Después de las advertencias, se presenta un informe conciso que resume los principales pasos aplicados. En la sección de resultados también se presenta un informe completo, para una comprensión más profunda.  Este informe exhaustivo ofrece una explicación completa de la secuencia seguida, junto con información detallada sobre las reglas de mortalidad y los pasos que se aplicaron o no durante la selección de la causa básica de defunción.

![Textualreportview{](img/textualreport.png): style="width:40%"}

**Reporte tabular:** En esta visualización interactiva se muestran los pasos para la selección de la causa básica de defunción en forma de tabla. Haciendo clic en las filas se pueden seguir los pasos uno tras otro, de arriba a abajo, y las reglas aplicadas se resaltarán en el certificado

![Tabularreportview{](img/Tabularreport.png): style="width:40%"}

**Reporte de flujo de reglas:** Esta visualización muestra el informe como una secuencia de reglas aplicadas que conducen finalmente a la causa básica de defunción seleccionada.

![Ruleflowreportview{](img/Ruleflowreport.png): style="width:40%"}

**Reporte de secuencia de reglas:** Esta visualización del informe se muestra como una secuencia horizontal. Las reglas específicas aplicadas en cada paso se muestran en el orden en que se aplicaron, de la parte superior a la inferior de la pantalla.

![Rulesequencereportview{](img/Rulesequencereport.png): style="width:40%"}

