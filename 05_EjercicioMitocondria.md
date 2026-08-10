# Ejercicio: Ensambla y anota un genoma citoplásmico por tu cuenta

Con el objetivo de integrar y reforzar el flujo bioinformático aprendido hasta el momento, es hora de enmsablar y anotar por tu cuenta un genoma citoplásmico. 
Para esta actividad, usaremos los datos crudos de *Apis mellifera* subsp. *scutellata* para ensamblar su genoma mitocondrial.  El ID de los datos es: **SRR1171146**

Recuerda seguir los pasos previamente descritos haciendo carpetas *ad hoc* para este nuevo proyecto: 

## - Paso 0: Activar ambiente conda 

## - Paso 1: Descargar los datos crudos
  ¿Cuánto pesan los archivos? 

## - Paso 2: Evaluar la calidad de los datos

## - Paso 3: Ensamblar 
 Notas adicionales:
 Usa el siguiente comando para descargar la base de datos particular para genomas mitocondriales de animales
 $ get_organelle_config.py --add animal_mt
 Cambia el argumento 'embplant_pt' por 'animal_mt' en el comando de get_organelle_from_reads.py antes de correr tu nuevo ensamblado. 

## - Paso 4: Visualizar el grafo del ensamblado

## - Paso 5: Anotar el ensamblado con los parámetros particulares para genomas mitocondriales.

## -Paso 6: Comparar el ensamblado y anotación resultante con el genoma mitocondrial publicado.
Revisa los resultados de artículos que han descrito la estructura mitocondrial de otras subespecies de *Apis mellifera* como el de [Boardman et al. 2019](https://www.tandfonline.com/doi/10.1080/23802359.2020.1717383?url_ver=Z39.88-2003&rfr_id=ori:rid:crossref.org&rfr_dat=cr_pub%20%200pubmed) y el de [Eimanifar et al. 2017](https://www.tandfonline.com/doi/full/10.1080/23802359.2017.1325342) para comparar con lo que tú obtuviste. 

Si necesitas algo de ayuda, revisa el script [06_Flujo_de_Trabajo_Mitogenoma.sh](https://github.com/NestorLR/Genome_assembly/blob/main/06_Flujo_de_Trabajo_Mitogenoma.sh)


