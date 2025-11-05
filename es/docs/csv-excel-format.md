# Formato tabular simple de intercambio de certificados de defunción

Se trata de un formato específico utilizado por [DORIS](https://icd.who.int/doris/es) como alternativa tabular sencilla al [formato JSON estructurado](json-format.md).

Este formato puede usarse como un archivo de Excel (.xlsx) o como archivo de texto separado por comas (.csv). 

## Archivos de muestra
Puede descargar pequeños archivos de muestra aquí:
### Archivo Excel de muestra
- [Excel (.xlsx) de muestra](sample.xlsx)

### Ejemplo de archivo CSV
- [Archivo de texto separado por comas (.csv) de muestra](sample.csv)

A continuación se describen detalladamente los campos:

## Tipos de datos utilizados

Los tipos de datos utilizados son:

| Tipo | Descripción | | --- | --- | 
| `string` | en archivos CSV, los valores alfanuméricos deben ir entre comillas `"`. | 
| `integer` | Campo numérico, se permiten solo números enteros | 
| `boolean` | Los valores permitidos son `true` y `false` | 
| `date` | El campo de fecha del certificado usa el formato definido por la [W3C](https://www.w3.org/TR/NOTE-datetime). En archivos CSV, el valor de la fecha debe ir entre comillas `"`. | 
| `durations` | Las duraciones definen la cantidad de tiempo transcurrido en un intervalo de tiempo usado en el certificado para el campo de intervalo. El formato está definido en la [norma ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#Durations). En archivos CSV, el valor de duración debe ir entre comillas `"`.|

Ejemplo de fecha:

```
    Año:
        YYYY (ej. 1997)  
    Año y mes:  
        YYYY-MM (ej. 1997-07)  
    Fecha completa:  
        YYYY-MM-DD (ej. 1997-07-16)  
    Fecha completa más horas y minutos:  
        YYYY-MM-DDThh:mmTZD (ej. 1997-07-16T19:20+01:00)  
    Fecha completa más horas, minutos y segundos:  
        YYYY-MM-DDThh:mm:ssTZD (ej. 1997-07-16T19:20:30+01:00)  
    Fecha completa más horas, minutos, segundos y fracción decimal de un segundo:  
        YYYY-MM-DDThh:mm:ss.sTZD (ej. 1997-07-16T19:20:30.45+01:00)
donde:
     YYYY = año en cuatro dígitos
     MM   = mes en dos dígitos (01=enero, etc.)
     DD   = día del mes en dos dígitos (01 al 31)
     hh   = hora en dos dígitos (00 al 23) (NO está permitido usar am/pm)
     mm   = minuto en dos dígitos (00 al 59)
     ss   = segundo en dos dígitos (00 al 59)
     s    = uno o más dígitos para la fracción decimal de un segundo 
     TZD  = designador de zona horaria (Z o +hh:mm o -hh:mm)
```

Ejemplo de duración:

\`\`\` La duración se representa con el formato P\[n]Y\[n]M\[n]DT\[n]H\[n]M\[n]S, P\[n]W o P<date>T<time>. En estas representaciones, \[n] se sustituye por el valor correspondiente a cada uno de los elementos de fecha y hora que siguen a \[n]. No se requieren ceros a la izquierda, pero el número máximo de dígitos para cada elemento debe ser acordado por las partes que se comunican. Las letras mayúsculas P, Y, M, W, D, T, H, M y S son designadores de cada uno de los elementos de fecha y hora y no se sustituyen. Corresponden a los siguientes elementos: P (<i>period</i>) es el designador de duración que se coloca al principio de la representación de la duración. Y (<i>year</i>) es el designador de año que sigue al valor del número de años naturales. M (<i>month</i>) es el designador de mes que sigue al valor del número de meses naturales. W (<i>week</i>) es el designador de semana que sigue al valor del número de semanas. D (<i>day</i>) es el designador de día que sigue al valor del número de días naturales. T (<i>time</i>) es el designador de tiempo que precede a los componentes temporales de la representación. H (<i>hour</i>) es el designador de hora que sigue al valor del número de horas. M (<i>minute</i>) es el designador de minutos que sigue al valor del número de minutos. S (<i>second</i>) es el designador de segundos que sigue al valor del número de segundos.

Para evitar ambigüedades, "P1M" representa una duración de un mes y "PT1M" representa una duración de un minuto.

Ejemplos prácticos: “PT10S” indica una duración de diez segundos, “PT10M” indica una duración de diez minutos, “PT10H” indica una duración de diez horas, “P5D” indica una duración de cinco días, “P2W” indica una duración de dos semanas, “P10M” indica una duración de diez meses y “P10Y” indica una duración de diez años. “”, “P” o “PT” se utilizan para intervalos desconocidos. \`\`\`

```
Note: Los campos CauseOfDeath pueden presentarse como código, URI o texto. Tenemos columnas individual para estos campos. Hay que tener uno de ellos. 
```

## Descripción

| Atributo | Entrada/Salida | Tipo | Descripción | | --- | --- | --- | | `CertificateKey` | _entrada_ | `string` | Puede usarse para identificar el certificado. | | `ICDVersion` | _entrada_ | `string` | Especifica la versión de la CIE utilizada para codificar el certificado. Actualmente, DORIS admite la `ICD11` | | `ICDMinorVersion` | _entrada_ | `string` | Especifica la versión menor de la CIE utilizada para la codificación del certificado. | | `Sex` | _entrada_ | `string` | 1: Hombre, 2: Mujer, 9: Desconocido | | `DateBirth` | _entrada_ | `date` | _ver formato de_ _fecha_ _indicado arriba_ | | `DateDeath` | _entrada_ | `date` | _ver formato de fecha indicado arriba_ | | `EstimatedAge` | _entrada_ | `durations` | _ver formato de duración indicado arriba_ | | `CauseOfDeathTextA` | _entrada_ | `string` | Campo de causa A. Condiciones en formato de texto. | | `CauseOfDeathCodeA` | _entrada_ | `string` | Campo de causa A. Códigos de clasificación separados por comas. Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `CauseOfDeathURIA` | _entrada_ | `string` | Campo de causa A. URI de clasificación separado por comas (Solo CIE-11). Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `IntervalA` | _entrada_ | `durations` | Intervalo de tiempo desde el inicio hasta la muerte para el campo A.| | `CauseOfDeathTextB` | _entrada_ | `string` | Campo de causa B. Condiciones en formato de texto. | | `CauseOfDeathCodeB` | _entrada_ | `string` | Campo de causa B. Códigos de clasificación separados por comas. Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `CauseOfDeathURIB` | _entrada_ | `string` | Campo de causa B. URI de clasificación separado por comas (Solo CIE-11). Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `IntervalB` | _entrada_ | `durations` | Intervalo de tiempo desde el inicio hasta la muerte para el campo B. | | `CauseOfDeathTextC` | _entrada_ | `string` | Campo de causa C. Condiciones en formato de texto. | | `CauseOfDeathCodeC` | _entrada_ | `string` | Campo de causa C. Códigos de clasificación separados por comas. Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `CauseOfDeathURIC` | _entrada_ | `string` | Campo de causa C. URI de clasificación separado por comas (Solo CIE-11). Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `IntervalC` | _entrada_ | `durations` | Intervalo de tiempo desde el inicio hasta la muerte para el campo C. | | `CauseOfDeathTextD` | _entrada_ | `string` | Campo de causa D. Condiciones en formato de texto. | | `CauseOfDeathCodeD` | _entrada_ | `string` | Campo de causa D. Códigos de clasificación separados por comas. Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `CauseOfDeathURID` | _entrada_ | `string` | Campo de causa D. URI de clasificación separado por comas (Solo CIE-11). Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `IntervalD` | _entrada_ | `durations` | Intervalo de tiempo desde el inicio hasta la muerte para el campo D. | | `CauseOfDeathTextE` | _entrada_ | `string` | Campo de causa E. Condiciones en formato de texto. | | `CauseOfDeathCodeE` | _entrada_ | `string` | Campo de causa E. Códigos de clasificación separados por comas. Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `CauseOfDeathURIE` | _entrada_ | `string` | Campo de causa E. URI de clasificación separado por comas (Solo CIE-11). Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `IntervalE` | _entrada_ | `durations` | Intervalo de tiempo desde el inicio hasta la muerte para el Campo E. | | `CauseOfDeathTextPart2` | _entrada_ | `string` | Campo de causa de la Parte 2. Condiciones en formato de texto. | | `CauseOfDeathCodePart2` | _entrada_ | `string` | Campo de causa de la Parte 2. Códigos de clasificación separados por comas. Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `CauseOfDeathURIPart2` | _entrada_ | `string` | Campo de causa de la Parte 2. URI de clasificación separado por comas. Se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B". | | `SurgeryWasPerformed` | _entrada_ | `integer` | 0: No, 1: Sí, 9: Desconocido | | `SurgeryDate` | _entrada_ | `date` | _ver formato de fecha indicado arriba_ | | `SurgeryReason` | _entrada_ | `string` | Si la respuesta es sí, especifique el motivo de la cirugía (enfermedad o condición). | | `AutopsyWasRequested` | _entrada_ | `integer` | 0: No, 1: Sí, 9: Desconocido | | `AutopsyFindings` | _entrada_ | `integer` | 0: No, 1: Sí, 9: Desconocido | | `MannerOfDeath` | _entrada_ | `integer` | 0: Enfermedad, 1: Accidente, 2: Lesión autoinfligida intencionalmente, 3: Agresión, 4: Intervención legal, 5: Guerra, 6: No se pudo determinar, 7: Pendiente de investigación, 9: Desconocido | | `MannerOfDeathDateOfExternalCauseOrPoisoning` | _entrada_ | `date` | _ver formato de fecha indicado arriba_ | | `MannerOfDeathDescriptionExternalCause` | _entrada_ | `string` | Descripción de la causa externa. | | `MannerOfDeathPlaceOfOccuranceExternalCause` | _entrada_ | `integer` | 0: En el hogar, 1: Institución residencial, 2: Escuela u otra institución, área administrativa pública, 3: Área de deportes y atletismo, 4: Calle y carretera, 5: Área de comercio y servicios, 6: Área industrial y de la construcción, 7: Granja, 8: Otro lugar, 9: Desconocido | | `FetalOrInfantDeathMultiplePregnancy` | _entrada_ | `integer` | 0: No, 1: Sí, 9: Desconocido | | `FetalOrInfantDeathStillborn` | _entrada_ | `integer` | 0: No, 1: Sí, 9: Desconocido | | `FetalOrInfantDeathDeathWithin24h` | _entrada_ | `integer` | Si falleció en las primeras 24 horas, especifique el número de horas de sobrevida. | | `FetalOrInfantDeathBirthWeight` | _entrada_ | `integer` | Peso al nacer (en gramos). | | `FetalOrInfantDeathPregnancyWeeks` | _entrada_ | `integer` | Número de semanas completas de embarazo. | | `FetalOrInfantDeathAgeMother` | _entrada_ | `integer` | Edad de la madre (años). | | `FetalOrInfantDeathPerinatalDescription` | _entrada_ | `string` | Si la muerte fue perinatal, anote las condiciones de la madre que afectaron al feto y neonato. | | `MaternalDeathWasPregnant` | _entrada_ | `integer` | 0: No, 1: Sí, 9: Desconocido | | `MaternalDeathTimeFromPregnancy` | _entrada_ | `integer` | 0: "En el momento de la muerte", 1: "Dentro de los 42 días antes de la muerte", 2: "Entre 43 días y hasta 1 año antes de la muerte", 3: "Un año o más antes de la muerte", 9: Desconocido | | `MaternalDeathPregnancyContribute` | _entrada_ | `integer` | 0: No, 1: Sí, 9: Desconocido | | `UnderlyingCauseOfDeath` | _entrada_ | `string` | Causa básica de defunción asignada manualmente en formato de código (opcional)| | `UnderlyingCauseOfDeathURI` | _entrada_ | `string` | Causa básica de defunción asignada manualmente en formato de URI de linealización (opcional) | | `Reject` | _salida_ | `boolean` | `false` si el cálculo pudo determinar la causa básica de defunción, `true` en caso contrario. El cálculo puede fallar por varias razones (códigos que no se encuentran en la linealización específica, inverosimilitud de la codificación, errores del sistema). El motivo se puede consultar en los campos de registro del sistema o del motor de reglas. | | `Report` | _salida_ | `string` | Resumen de los pasos utilizados por el motor de reglas para seleccionar la causa básica de defunción. | | `Errors` | _salida_ | `string` | Campo de informe que se utiliza si se producen errores durante el cálculo o si el motor de reglas falla. | `Warnings` | _salida_ | `string` | Campo de informe que se utiliza si el motor de reglas genera advertencias durante el cálculo. | `UnderlyingCauseOfDeathComputed` | _salida_ | `string` | Causa básica de defunción calculada por el sistema como código (sólo código de base) | | `UnderlyingCauseOfDeathComputedURI` | _salida_ | `string` | Causa básica de defunción calculada por el sistema como URI (sólo código de base)| | `UnderlyingCauseOfDeathComputedComplete` | _salida_ | `string` | Causa básica de defunción calculada por el sistema (puede incluir combinación de poscoordinación)| | `UnderlyingCauseOfDeathComputedCompleteURI` | _salida_ | `string` | Causa básica de defunción calculada por el sistema como URI con linealización (puede incluir combinación de poscoordinación) | 

