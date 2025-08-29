# Notas de la versión de DORIS versión de escritorio

## Version 1.1
- Se ha implementado la versión 1.1 de las reglas DORIS.
    - **Nuevas funciones de visualización mejoradas**  
          Además del **reporte textual**, se han añadido **tres nuevos modos de visualización**: - **Reporte tabular**: Vista interactiva en forma de tabla que muestra los pasos de selección de la causa básica de defunción. El usuario puede seguir los pasos de forma secuencial, resaltando en el certificado las reglas correspondientes. - **Reporte de flujo de reglas**: Muestra visualmente la secuencia de reglas aplicadas que condujeron a la selección de la causa básica de defunción. - **Reporte de secuencia de reglas**: Presenta una línea de tiempo horizontal con las reglas aplicadas, en el orden en que fueron aplicadas.
    - **Mejora de la precisión del algoritmo**  
      Esta versión incorpora mejoras en el algoritmo de DORIS que aumentan la precisión y coherencia en la codificación y notificación de causas de defunción. - Mayor especificidad para enfermedades infecciosas, neoplasias y afecciones relacionadas con traumatismos. - Mejora en la lógica aplicada al VIH, la tuberculosis y los trastornos debidos al uso de sustancias. - Mejor tratamiento de causas externas y defunciones relacionadas con traumatismos.
     - **Ya está disponible la versión para macOS**  
      Mayor compatibilidad para usuarios de sistemas Apple.
       

## Versión 1.0 (Versión inicial)

-	Se añadió compatibilidad con certificados en formato de texto. El sistema puede procesar de forma eficiente un gran volumen de datos, gestionando miles de certificados en pocos minutos. Esta actualización permite obtener resultados rápidos, incluyendo los códigos CIE-11 correspondientes, las entidades y la causa básica de defunción calculada.
-	Se dedicaron esfuerzos significativos a mejorar la interfaz de usuario de la versión web. El objetivo de las mejoras es ofrecer una experiencia más intuitiva y fácil de usar, permitiendo navegar por certificados individuales con mayor facilidad y guardar los resultados en los equipos locales. 
-	Se ampliaron las capacidades de análisis de DORIS al incorporar campos adicionales en la sección B, como la manera de morir, el estado respecto al embarazo y otros. Gracias a esta información complementaria, DORIS puede realizar análisis más completos y precisos, lo que mejora la selección de la causa básica de defunción.
-	Se introdujeron nuevos controles y advertencias automáticas. Estas funciones mejoran la precisión y fiabilidad de los resultados.
-	Se introdujo una salida compatible con ANACoD-3 como una opción adicional de exportación desde DORIS. Esta opción de salida facilita la integración con otros sistemas y flujos de trabajo, mejorando la eficiencia general del procesamiento de datos.
-	La base de reglas digitales de mortalidad se ha optimizado con mejoras y aclaraciones importantes, basadas en comentarios obtenidos en los talleres de MRD. Estas mejoras aumentan aún más el rendimiento y la fiabilidad de DORIS.
-	Ya está disponible la guía de usuario en línea de DORIS.
-   Las reglas utilizadas por la herramienta ahora se mantienen a través de la plataforma de autoría de reglas de mortalidad (Mortality Rules Authoring platform).
