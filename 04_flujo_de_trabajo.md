# Paso 0: Activar ambiente
### 0a) Ir a la Carpeta de trabajo
$ cd /ruta/absoluta/a/taller_genomas

### 0b) Activar ambiente

$ conda create -n genomics \
$ conda activate genomics

---
# Paso 1: Descarga de secuencias
### 1a Make a directory para las secuencias
$ mkdir mammillaria_secuencias
    
### 1b descargar las secuencias
$ conda install -c bioconda sra-tools \
$ fasterq-dump SRR23441685 -O "mammillaria_secuencias/." --verbose 

---
# Paso 2: Preprocesamiento de los datos
[FastQC](https://github.com/s-andrews/fastqc) \
$ conda install -c bioconda fastqc

### 2a Revisar la calidad de las lecturas
$ mkdir mammillaria_fastqc \
$ fastqc mammillaria_secuencias/* -O mammillaria_fastqc/.

### 2b Limpieza de datos
$ mkdir mammillaria_limpias

[TrimGalore](https://github.com/felixkrueger/trimgalore) \
$ conda install -c bioconda trim-galore 

$ trim_galore --paired mammillaria/*1.fastq mammillaria/*2.fastq --quality 28 --length 40 --clip_R1 20 --three_prime_clip_R1 20 --clip_R2 20 --three_prime_clip_R2 20 -o "mammillaria_limpias/."

## 2c Revisar la calidad de las lecturas
$ fastqc mammillaria_limpias/*.fq -O mammillaria_fastqc/.

---
# Paso 3:  Ensamble ***de novo***
[getorganelle](https://github.com/kinggerm/getorganelle) \
$ conda install -c bioconda getorganelle

## 3a Directorio
$ mkdir mammillaria_organelle
    
## 3b Ensamble

get_organelle_from_reads.py -1 mammillaria_limpias/*1.fq -2 mammillaria_limpias/*2.fq -R 60 -k 21,45,61,75,95,109,127 -F embplant_pt -o mammillaria_organelle/ 

---  
#  Paso 4: Datos del genoma   
[Bandage](https://rrwick.github.io/Bandage/) \ 
$ conda install -c bioconda bandage

$ Bandage image mammillaria_organelle/*selected_graph.gfa mammillaria_organelle/graph_bandage.png 
