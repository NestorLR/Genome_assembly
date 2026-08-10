#!/bin/bash
### Este script documenta los pasos a seguir para el ensamble del genoma mitocondrial de Apis mellifera subsp. scutellata

### 01- Activar el ambiente conda 
conda activate plastoma

### 02- Crear los directorios necesarios

mkdir mitocondria_secuencias_fastq

### 02- Descargar los datos crudos

fasterq-dump \
SRR1171146	
--outdir "/mnt/f/Taller_Ensamble_2026/mitocondria_secuencias_fastq/." \
--verbose 

### 03- Evaluar calidad
mkdir mitocondria_fastq

fastqc mitocondria_secuencias_fastq/* -O mitocondria_fastq/.

### 04- Ensamblar 
get_organelle_from_reads.py -1 "/mnt/f/Taller_Ensamble_2026/mitocondria_secuencias_fastq/SRR1171146_1.fastq" -2 "/mnt/f/Taller_Ensamble_2026/mitocondria_secuencias_fastq/SRR1171146_2.fastq" -t 4 -w 85 -k 21,45,65,85,105 -F animal_mt -R 10 -o /mnt/f/Taller_Ensamble_2026/mitocondria_organelle/
