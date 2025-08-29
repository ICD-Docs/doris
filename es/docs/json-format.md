﻿
# Formato de intercambio de certificados de defunción

El objetivo principal de este formato es crear una representación electrónica normalizada del [formulario internacional de certificado médico de causa de defunción](https://icdcdn.who.int/icd11referenceguide/en/html/index.html#international-form-of-medical-certificate-of-cause-of-death).


El **certificado de defunción** se define en formato *JSON*. 

[El esquema JSON para un único certificado de defunción se encuentra aquí](Annex_ElectronicDeathCertificateSchema.json) 


## Panorama general

En este documento se enumeran todos los campos del certificado junto con su descripción, tipo de dato y valores permitidos. Para algunos campos que solo pueden contener valores específicos, se especifica la correspondencia que indica dónde debe utilizarse el valor numérico en el certificado. 

Por ejemplo, cuando los valores posibles son “sí”, “no” y “desconocido”, establecemos la correspondencia:
> - _no_ -> 0, 
> - _sí_ -> 1, 
> - _se desconoce_ -> 9. 

Se utiliza `\` (barra invertida) para identificar las estructuras anidadas.


### Tipos de datos

Se utilizan los siguientes tipos de datos:

| Tipo | Descripción | | --- | --- | | `string` | Valor alfanumérico entrecomillado `"`. | | `integer` | Campo numérico; solo se permiten números enteros | | `boolean` | Los valores permitidos son `true` y `false` | | `structure` | Estructura _JSON_ con otros campos en su interior | | `array[type]` | Una lista de un tipo específico; en nuestro formato solo utilizamos listas de otras estructuras (es decir, <i>array</i> de `[ {"name": "The name"}, {"name": "Other example name name"} ]` | | `date` | El campo de fecha utilizado en el certificado sigue el formato definido por el [W3C](https://www.w3.org/TR/NOTE-datetime). La fecha debe colocarse entre comillas `"`. | | `duration` | Las duraciones definen la cantidad de tiempo transcurrido en un intervalo temporal, tal como se utiliza en el certificado para el campo de intervalo. El formato está definido en la [norma ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#Durations). El valor de duración debe colocarse entre comillas `"`.|

Ejemplo de fecha:

```
    Year:
        YYYY (eg 1997)  
    Year and month:  
        YYYY-MM (eg 1997-07)  
    Complete date:  
        YYYY-MM-DD (eg 1997-07-16)  
    Complete date plus hours and minutes:  
        YYYY-MM-DDThh:mmTZD (eg 1997-07-16T19:20+01:00)  
    Complete date plus hours, minutes and seconds:  
        YYYY-MM-DDThh:mm:ssTZD (eg 1997-07-16T19:20:30+01:00)  
    Complete date plus hours, minutes, seconds and a decimal fraction of a second  
        YYYY-MM-DDThh:mm:ss.sTZD (eg 1997-07-16T19:20:30.45+01:00)
where:
     YYYY = four-digit year
     MM   = two-digit month (01=January, etc.)
     DD   = two-digit day of month (01 through 31)
     hh   = two digits of hour (00 through 23) (am/pm NOT allowed)
     mm   = two digits of minute (00 through 59)
     ss   = two digits of second (00 through 59)
     s    = one or more digits representing a decimal fraction of a second
     TZD  = time zone designator (Z or +hh:mm or -hh:mm)
```

Ejemplo de duración:

\`\`\` La duración se representa con el formato P\[n]Y\[n]M\[n]DT\[n]H\[n]M\[n]S, P\[n]W o P<date>T<time>. En estas representaciones, \[n] se sustituye por el valor correspondiente a cada uno de los elementos de fecha y hora que siguen a \[n]. No se requieren ceros a la izquierda, pero el número máximo de dígitos para cada elemento debe ser acordado por las partes que se comunican. Las letras mayúsculas P, Y, M, W, D, T, H, M y S son designadores de cada uno de los elementos de fecha y hora y no se sustituyen. Corresponden a los siguientes elementos: P (<i>period</i>) es el designador de duración que se coloca al principio de la representación de la duración. Y (<i>year</i>) es el designador de año que sigue al valor del número de años naturales. M (<i>month</i>) es el designador de mes que sigue al valor del número de meses naturales. W (<i>week</i>) es el designador de semana que sigue al valor del número de semanas. D (<i>day</i>) es el designador de día que sigue al valor del número de días naturales. T (<i>time</i>) es el designador de tiempo que precede a los componentes temporales de la representación. H (<i>hour</i>) es el designador de hora que sigue al valor del número de horas. M (<i>minute</i>) es el designador de minutos que sigue al valor del número de minutos. S (<i>second</i>) es el designador de segundos que sigue al valor del número de segundos.

Por ejemplo, "P3Y6M4DT12H30M5S" representa una duración de "tres años, seis meses, cuatro días, doce horas, treinta minutos y cinco segundos". Para evitar ambigüedades, "P1M" representa una duración de un mes y "PT1M" representa una duración de un minuto.

Ejemplos prácticos: “PT10S” indica una duración de diez segundos, “PT10M” indica una duración de diez minutos, “PT10H” indica una duración de diez horas, “P5D” indica una duración de cinco días, “P2W” indica una duración de dos semanas, “P10M” indica una duración de diez meses y “P10Y” indica una duración de diez años. “”, “P” o “PT” se utilizan para intervalos desconocidos. \`\`\`

### Campos del certificado


| Atributo | Tipo | Descripción | | --- | --- | | `CertificateKey` | `string` | Puede utilizarse para identificar el certificado. | `Issuer` `string` Puede utilizarse para identificar al emisor. | | `ICDVersion` | `string` | Si el certificado contiene datos codificados, este campo especifica la versión de la CIE utilizada para la codificación del certificado, por ejemplo,`ICD10` o `ICD11`| | `ICDMinorVersion` | `string` | Si el certificado contiene datos codificados, este campo especifica la versión menor de la CIE utilizada para la codificación del certificado.| | `AdministrativeData` | `structure` | Estructura de datos administrativos con los campos anidados que se detallan a continuación. | | `AdministrativeData\DateBirth` | `date` | | `AdministrativeData\DateDeath` | `date` | | `AdministrativeData\Sex` | `integer` | | `AdministrativeData\EstimatedAge` | `duration` | Edad estimada si faltan `DateBirth` y `DateDeath`. |

> `Sex` valores de correspondencia:  
> \- 1 <- Masculino - 2 <- Femenino - 9 <- Desconocido

| Atributo | Tipo | Descripción | | :- | :- | --- | | `Part1` | `[line structure]` | Lista de _estructuras de línea_ para cada línea de la Parte 1 | | `Part2` | `line structure` | _Estructura de línea_ que contiene todas las condiciones de la Parte 2 |


#### Estructura de condición individual

| Atributo | Tipo | Descripción | | :- | :- | --- | | `Text` | `string` | Descripción textual o condición indicada por el certificador. | | `Code` | `string` | Código de clasificación. (Para la CIE-11 se permite el uso de poscoordinación, es decir: "Código de base A & Código de extensión 1 / Código de base B"). | | `LinearizationURI` | `string` | Solo se usa para la CIE-11. La URI de linealización puede contener poscoordinación (URI de código de base A & URI de código de extensión 1 / URI de código de base B). | | `FoundationURI` | `string` | Solo se utiliza para la URI de Fundación de la CIE‑11 cuando la URI de Linealización no es suficiente para reflejar el nivel de detalle requerido, con posible poscoordinación (URI de código base A & URI de código de extensión 1 / URI de código de base B). | | `Interval` | `duration` | Intervalo de tiempo desde el inicio hasta la muerte. | || _Los campos anteriores (código y URI) deben usarse si el certificado contiene información codificada. En el caso de un certificado codificado, uno de los tres es suficiente, pero un certificado puede tener varios_ | completados.



#### Estructura de línea

| Atributo | Tipo | Descripción | | --- | --- | | | `Conditions` | `[Single condition structure]` | array de condiciones en una sola línea de la Parte 1 |


| Atributo | Tipo | Descripción | | --- | :- | --- | | `Surgery` | `structure` | Se utiliza cuando se ha realizado una cirugía. Complete los campos anidados. | | `Surgery\WasPerformed` | `integer` | "¿Se realizó una cirugía en las últimas 4 semanas?" | | `Surgery\Date` | `date` | Si se realizó una cirugía, especifique la fecha. `Surgery\Reason` `string` | Si la respuesta es _Sí_, especifique el motivo de la cirugía (enfermedad o afección). |

> `Surgery\WasPerformed` valores de correspondencia:  
> \- 0 <- No  
> \- 1 <- Sí - 9 <- Desconocido


Los siguientes campos forman una estructura anidada utilizada para indicar la línea de condición del certificado. Se utilizan en campos como `Part1` y `Part2` 


| Atributo | Tipo | Descripción | | --- | :-: | --- | | `Autopsy` | `structure` | Si se solicitó una autopsia, complete los campos anidados. | | `Autopsy\WasRequested` | `integer` | "¿Se solicitó una autopsia?". | | `Autopsy\Findings` | `integer` | "En caso afirmativo, ¿se utilizaron los hallazgos en la certificación?". |

 `Autopsy\WasRequested` valores de correspondencia:  
> - 0 <- No
> - 1 <- Sí
> - 9 <- Se desconoce

 `Autopsy\Findings` valores de correspondencia:  
> - 0 <- No
> - 1 <- Sí
> - 9 <- Se desconoce

| Atributo | Tipo | Descripción | | --- | :-: | --- | | `MannerOfDeath` | `structure` | Complete los campos anidados. | | `MannerOfDeath\MannerOfDeath` | `integer` | | | `MannerOfDeath\DateOfExternalCauseOrPoisoning` | `date` | | `MannerOfDeath\DescriptionExternalCause` | `string` | | | `MannerOfDeath\PlaceOfOccuranceExternalCause` | `integer` | |

 `MannerOfDeath\MannerOfDeath` valores de correspondencia:  
> - 0 <- Enfermedad
> - 1 <- Accidente
> - 2 <- Lesión autoinfligida intencionalmente
> - 3 <- Agresión
> - 4 <- Intervención legal
> - 5 <- Guerra
> - 6 <- No se pudo determinar
> - 7 <- Pendiente de investigación
> - 9 <- Desconocido

 `MannerOfDeath\PlaceOfOccuranceExternalCause` valores de correspondencia:
> - 0: En el hogar
> - 1: Institución residencial
> - 2: Escuela u otra institución, área administrativa pública
> - 3: Área de deportes y atletismo
> - 4: Calle y carretera
> - 5: Área de comercio y servicios
> - 6: Área industrial y de la construcción
> - 7: Granja
> - 8: Otro lugar
> - 9: Desconocido

| Atributo | Tipo | Descripción | | --- | :-: | --- | | `FetalOrInfantDeath` | `structure` | | `FetalOrInfantDeath\MultiplePregnancy` | `integer` | | `FetalOrInfantDeath\Stillborn` | `integer` | | `FetalOrInfantDeath\DeathWithin24h` | `integer` | | `FetalOrInfantDeath\BirthWeight` | `integer` | | | `FetalOrInfantDeath\PregnancyWeeks` | `integer` | | | `FetalOrInfantDeath\AgeMother` | `integer` | | | `FetalOrInfantDeath\PerinatalDescription` | `string` | |

 `FetalOrInfantDeath\MultiplePregnancy` valores de correspondencia:  
> - 0 <- No
> - 1 <- Sí
> - 9 <- Desconocido

 `FetalOrInfantDeath\Stillborn` valores de correspondencia:  
> - 0 <- No
> - 1 <- Sí
> - 9 <- Desconocido

| Atributo | Tipo | Descripción | | --- | :-: | --- | | `MaternalDeath` | `structure` | | `MaternalDeath\WasPregnant` | `integer` | | `MaternalDeath\TimeFromPregnancy` | `integer` | | `MaternalDeath\PregnancyContribute` | `integer` | |

 `MaternalDeath\WasPregnant` valores de correspondencia:  
> - 0 <- No
> - 1 <- Sí
> - 9 <- Desconocido

 `MaternalDeath\TimeFromPregnancy` valores de correspondencia:  
> - 0 <- En el momento de la muerte
> - 1 <- Dentro de los 42 días antes de la muerte
> - 2 <- Entre 43 días y hasta 1 año antes de la muerte
> - 3 <- Un año o más antes de la muerte
> - 9 <- Desconocido

 `MaternalDeath\PregnancyContribute` valores de correspondencia:  
> - 0 <- No
> - 1 <- Sí
> - 9 <- Desconocido


## Array de certificados
Aunque ya hemos visto el formato del certificado de defunción, el archivo con los certificados necesita un array de certificados, que en JSON se crea utilizando corchetes: `[`certificado`,` certificado`,`...`,` certificado`]` 

## Ejemplo

Dos ejemplos de certificados para la CIE-10 y la CIE-11.

#### Ejemplo para la CIE-10
```
[
    {
        "CertificateKey": "0",
        "Issuer": "",
        "ICDVersion": "ICD10",
        "ICDMinorVersion": "2019",
        "AdministrativeData": {
                "Sex": 1,
                "DateDeath": "2020-01-01",
                "DateBirth": "2000-01-01"
            },
        "Part1": [
            {
                "Conditions": [
                {
                    "Text": "Other specified general symptoms and signs",
                    "Code": "R68.8",
                    "Interval": "P10Y"
                }
                ]
            },
            {
                "Conditions": [
                {
                    "Text": "Sepsis, unspecified",
                    "Code": "A41.9",
                    "Interval": "P10Y"
                }
                ]
            },
            {
                "Conditions": [
                    {
                        "Text": "Other and unspecified abdominal pain",
                        "Code": "R10.4",
                        "Interval": "P10Y"
                    }
                ]
            }
        ],
        "Part2": {
            "Conditions": []
        },
        "Surgery": {
            "WasPerformed": 1,
            "Date": "2019-05-25",
            "Reason": "Textual reason"
        },
        "MannerOfDeath": {
            "MannerOfDeath": 1,
            "DateOfExternalCauseOrPoisoning": "2019-06-27",
            "DescriptionExternalCause": "Textual description",
            "PlaceOfOccuranceExternalCause": 3
        },
        "MaternalDeath": {
            "WasPregnant": 9,
            "TimeFromPregnancy": 9,
            "PregnancyContribute": 9
        }
    }
]
```
#### Ejemplo para la CIE-11
```
[
    {
        "CertificateKey": "13",
        "Issuer": "",
        "ICDVersion": "ICD11",
        "ICDMinorVersion": "2023",
        "AdministrativeData": {
            "Sex": 1,
            "EstimatedAge": "P20Y"
        },
        "Part1": [
        {
            "Conditions": [
                {
                    "Text": "Acute myocardial infarction, unspecified",
                    "Code": "BA41.Z",
                    "LinearizationURI": "http://id.who.int/icd/release/11/mms/1334938734/unspecified",
                    "Interval": "P10Y"
                }
            ]
        },
        {
            "Conditions": [
                {
                    "Text": "Diabetes mellitus, type unspecified",
                    "Code": "5A14",
                    "LinearizationURI": "http://id.who.int/icd/release/11/mms/1697306310",
                    "Interval": "P10Y"
                }
            ]
        },
        {
            "Conditions": [
                {
                    "Text": "Essential hypertension, unspecified",
                    "Code": "BA00.Z",
                    "LinearizationURI": "http://id.who.int/icd/release/11/mms/761947693/unspecified",
                    "Interval": "P10Y"
                }
            ]
        }
        ],
        "Part2": {
            "Conditions": []
        },
        "Surgery": {
            "WasPerformed": 1,
            "Date": "2019-05-25",
            "Reason": "Textual reason"
        },
        "MannerOfDeath": {
            "MannerOfDeath": 1,
            "DateOfExternalCauseOrPoisoning": "2019-06-27",
            "DescriptionExternalCause": "Textual description",
            "PlaceOfOccuranceExternalCause": 3
        },
        "MaternalDeath": {
            "WasPregnant": 9,
            "TimeFromPregnancy": 9,
            "PregnancyContribute": 9
        }
    }
]
```
