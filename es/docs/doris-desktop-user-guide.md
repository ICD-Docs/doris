# DORIS versión de escritorio: guía para el usuario

DORIS versión de escritorio es una herramienta informática diseñada para procesar por lotes certificados de defunción de una manera eficiente. Permite analizar grandes volúmenes de datos sobre diagnósticos, tanto en formato codificado como en formato de texto. El diseño del software prioriza la facilidad de uso y permite importar certificados en diversos formatos como el CMCD electrónico estándar en JSON, Excel y CSV. 

![DORIS versión de escritorio](img/Desktopversion24.png)

La versión de escritorio de DORIS requiere un `conjunto de datos de DORIS` para funcionar. Puede importar certificados desde un archivo en cualquiera de los formatos compatibles. Una vez importado, el archivo se guarda como `conjunto de datos de DORIS`. Cualquier acción realizada en el programa a partir de este momento utiliza el `conjunto de datos de DORIS`. Por ejemplo, si utiliza el botón `Procesar`, el software calcula la causa básica de defunción para todos los certificados y guarda esta información en el conjunto de datos, que se conserva para futuras sesiones. Para continuar al punto donde lo dejó, puede volver a abrir un conjunto de datos de DORIS desde el menú `Abrir conjunto de datos de DORIS`. 

También puede `Exportar` los certificados de un `conjunto de datos de DORIS` en los formatos compatibles.

## Importar datos
Puede importar certificados utilizando uno de los formatos de archivo compatibles. En los siguientes enlaces encontrará información sobre los formatos así como archivos de muestra:

- Descripción detallada del [formato tabular para archivos Excel y CSV](csv-excel-format.md)

- Descripción detallada del [formato JSON estándar](json-format.md)

![Import menu](img/menu-import.png)

Para importar un archivo, seleccione la opción `Importar archivos .xlsx, .csv o .json` en el menú `Datos`. A continuación, deberá elegir el archivo que desea importar. Después, la herramienta le pedirá un nombre para el `conjunto de datos de DORIS` que se creará. De manera predeterminada, los conjuntos de datos de DORIS se guardan en la carpeta Documentos de Windows. 

![Nombre del conjunto de datos diálogo{](img/dataset-filename.png)

Después de nombrar el archivo y hacer clic en `De acuerdo`, DORIS importará el archivo y mostrará su contenido. Si el archivo es grande y tarda en cargarse, el sistema mostrará una barra de progreso en la parte inferior de la pantalla.

## Trabajar con un conjunto de datos de DORIS
DORIS versión de escritorio usa conjuntos de datos de DORIS, que se crean tras importar datos en un formato de archivo compatible. De manera predeterminada, los conjuntos de datos de DORIS se guardan en la carpeta Documentos de Windows. Esta ubicación puede modificarse en la opcion `Cambiar la carpeta predeterminada` del menú `Configuración`.


### Abrir un conjunto de datos
Puede abrir un conjunto de datos de DORIS existente haciendo clic en `Abrir conjunto de datos de Doris` en el menú `Datos`. 

![Open Dataset](img/dataset-open.png)

### Información del conjunto de datos
Una vez abierto un conjunto de datos, puede usar la opción `Información del conjunto de datos` en el menú `Datos`. 

![Dataset Information](img/dataset-info.png)

Esta información incluye detalles sobre el conjunto de datos, como el número de certificados, si son datos codificados o datos textuales y si se han procesado. A continuación se muestra un ejemplo:

![Dataset Information2](img/dataset-info2.png)


### Trabajar con certificados que usan datos textuales
Si los datos importados no están codificados, sino que contienen condiciones o problemas de salud en forma de texto, la herramienta asignará automáticamente códigos mediante el procesamiento de texto a código durante la fase de importación. Este proceso coloca los códigos asignados automáticamente en la columna `Código (auto)` junto a una columna adicional, `Coincidencia automática`, que indica la calidad de la conversión de texto a código.

Se recomienda que las conversiones automáticas de texto a código sean revisadas por expertos, especialmente cuando la coincidencia no sea una `Buena coincidencia` 

![Text to code columns](img/texttocode-columns.png).

El botón de problemas de conversión de texto a código se puede utilizar para filtrar aquellos casos en los que no hubo una buena coincidencia en los resultados de la conversión. 

![Text to code issues button](img/texttocode-issues-button.png)

### Procesamiento del conjunto de datos (detección de la causa básica de defunción)

Al realizar el procesamiento del archivo se calculará la causa básica de defunción para cada certificado. Esto se realiza en el menú `Procesar`. 

![Process menu{](img/process-menu.png)

Si el conjunto de datos es grande, el sistema mostrará una barra de progreso en la parte inferior de la pantalla para indicar el avance.

Una vez finalizado el procesamiento, los resultados aparecen en la columna `Causa básica de defunción (CBD)`. Si la causa básica de defunción corresponde a varios códigos poscoordinados, se mostrará en la columna `CBD con información poscoordinada`. Los certificados rechazados se indican en la columna `Rechazado` y los errores y advertencias se muestran en las columnas `Error` y `Alertas`.

![UCOD columns](img/ucod-columns.png)

 Los certificados que han sido rechazados o presentan otros problemas pueden filtrarse fácilmente utilizando el botón de problemas de procesamiento. ![Processing issues button](img/processing-issues-button.png)  

### Aplicación de filtros y clasificación
Para ordenar los certificados según los valores de una columna seleccionada, haga clic en la etiqueta de la columna. 

Para aplicar filtros, puede utilizar los iconos de filtro ubicados a un lado de la etiqueta de las columnas. ![Filtering](img/filter.png)

### Edición de certificados individuales

Haga clic en el número de la columna `Id` para abrir el certificado en modo de vista completa. ![Open certificate](img/open-cert.png)

En el modo de vista completa, se muestra al usuario toda la información contenida en el certificado, así como la causa básica de defunción calculada ![Certificate full-view](img/cert-fullview.png)

Una vez abierto, el sistema no permite editar el certificado. Para poder editarlo, debe hacer clic en el botón de desbloqueo situado en la parte inferior del certificado. ![unlock icon](img/unlock.png)

Una vez desbloqueado, puede editar el certificado. Las líneas correspondientes a condiciones o problemas de salud solo permiten códigos de la CIE-11 válidos. No es posible editar el diagnóstico textual, aunque se puede sobrescribir indicando los códigos correspondientes.

Una vez finalizada la edición, puede guardar los cambios con el botón `Guardar`. Si no guarda sus cambios, la herramienta los borrará al cerrar la vista completa.

Para cerrar el modo de vista completa, haga clic en la `X` situada en la esquina superior izquierda.

El botón `Procesar` en modo de vista completa volverá a procesar el certificado para calcular la causa básica de defunción. Esto solo se guardará haciendo clic en `Guardar`. 

También es posible procesar todos los certificados editados desde el menú `Procesar`, después de cerrar el modo de vista completa.

### Visualización del informe para certificados individuales

DORIS ofrece cuatro modos de visualización complementarios para brindar apoyo en la revisión, la validación y la capacitación:

**Reporte textual**: Este modo de visualización ilustra los pasos y las reglas de mortalidad que se aplicaron para seleccionar la causa básica de defunción. Incluye un campo de **alertas**, que señala cualquier incoherencia en la información proporcionada o indica que es necesario hacer una verificación manual. Las alertas se muestran en amarillo. Después de las alertas, se presenta un informe conciso que resume los principales pasos aplicados. En la sección de resultados también se presenta un informe completo, para una comprensión más profunda. Este informe exhaustivo ofrece una explicación completa de la secuencia registrada, junto con información detallada sobre las reglas de mortalidad y los pasos que se aplicaron o no durante la selección de la causa básica de defunción.

![Textualreport](img/textualreportdesktop.png)

**Reporte tabular:** En esta visualización interactiva se muestran los pasos para la selección de la causa básica de defunción en forma de tabla. Haciendo clic en las filas se pueden seguir los pasos uno tras otro, de arriba a abajo, y las reglas aplicadas se resaltarán en el certificado

![Tabularreport](img/tabularreportdesktop.png)

**Informe de flujo de reglas:** En esta visualización se muestra el informe como una secuencia de reglas aplicadas que conducen finalmente a la causa básica de defunción seleccionada.

![Ruleflowreport](img/Ruleflowreportdesktop.png)

**Informe de secuencia de reglas:** Esta visualización del informe se muestra como una secuencia horizontal. Las reglas específicas aplicadas en cada paso se muestran en el orden en que se aplicaron, de la parte superior a la inferior de la pantalla.

![Rulesequencereport](img/Rulesequencereportdesktop.png)

## Configuración
### Cambiar el idioma
Es posible cambiar el idioma de la herramienta haciendo clic en la opción `Cambiar idioma` en el menú `Configuración`. Al hacer clic allí, el sistema mostrará los idiomas disponibles en un nuevo cuadro de diálogo. ![Change Language](img/Changingthelanguage2025.png)

El idioma actual se muestra en color naranja; para cambiar de idioma, haga clic en otro idioma.

\** IMPORTANTE \** Si el idioma seleccionado no se ha utilizado anteriormente, para cambiarlo hay que tener conexión a Internet; si ya que el sistema necesita descargar la CIE en ese idioma para habilitar el procesamiento de texto a código.

El sistema utiliza el idioma seleccionado en tres aspectos distintos: 
- La interfaz de usuario de la herramienta cambia al idioma seleccionado.
- Durante la importación, si los certificados contienen diagnósticos en formato de texto, se usa el idioma seleccionado para el procesamiento de texto a código.
- Durante el procesamiento para detectar la causa básica de defunción, los mensajes de advertencia se muestran en el idioma seleccionado.

\** IMPORTANTE \** Solo es posible cambiar el idioma antes de abrir un conjunto de datos. Si desea cambiar el idioma, cierre la aplicación y vuelva a intentarlo antes de abrir un conjunto de datos.

### Cambiar la versión de la CIE-11
De forma predeterminada, DORIS versión de escritorio utiliza la versión más reciente publicada de la CIE-11.

Se puede usar otra versión de la CIE-11 durante el procesamiento de los certificados. Para ello, utilice la opción `Cambiar versión de la CIE` en el menú `COnfiguración`.

DORIS es compatible con las versiones de la CIE-11 correspondientes al 2023 y el 2024.

IMPORTANTE: Cambiar la versión de la CIE requiere conexión a Internet si la versión seleccionada no se ha utilizado antes, ya que el sistema tiene que descargarla.


### Cambiar la carpeta predeterminada para los conjuntos de datos de DORIS
De manera predeterminada, los conjuntos de datos de DORIS se guardan en la carpeta Documentos de Windows. Puede cambiar la carpeta predeterminada en la opción `Cambiar la carpeta predeterminada` del menú `Configuración`. 

## Exportar datos
La exportación de datos en los formatos admitidos puede realizarse usando la opcion `Exportar xxxx` desde el menú `Datos` ![Export](img/export.png)

El sistema le preguntará dónde desea guardar el archivo y qué nombre asignarle.

Si exporta el archivo de salida de ANACoD, es necesario completar las columnas con información nacional o local sobre la población, el año, el código ISO del país, etc., antes de importarlo a la herramienta ANACoD-3. [Más información sobre ANACoD-3](icd.who.int/anacod)
