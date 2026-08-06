# Paso 0: Activar ambiente
### 0a) Ir a la Carpeta de trabajo
   $ cd /ruta/absoluta/a/taller_genomas

### 0b) Activar ambiente

$ conda create -n genomics \
$ conda activate genomics \
$ conda deactivate \
$ conda list

---
# Paso 1: Descarga de secuencias
### 1a) Enlista los directorios que tienes
$ ls
### 1c) Crear un directorio para las secuencias
$ mkdir mammillaria_secuencias
    
### 1d) Descargar las secuencias
Revisar la entrada SRR23441678 en la sección SRA de [GenBank](https://www.ncbi.nlm.nih.gov/genbank/) \
$ conda install -c bioconda sra-tools \
$ fasterq-dump SRR23441678 -O "mammillaria_secuencias/." --verbose 

### 1d) Revisa las características de los archivos descargados
$ ls -lh mammillaria_secuencias/*

---
# Paso 2: Preprocesamiento de los datos
[FastQC](https://github.com/s-andrews/fastqc) \
[FastQC explicación](https://hbctraining.github.io/Training-modules/planning_successful_rnaseq/lessons/QC_raw_data.html) \
$ conda install -c bioconda fastqc

### 2a) Revisar las primeras cuatro líneas de uno de los archivos fastqc
$ head -4 mammillaria_secuencias/SRR23441678_1.fastq

### 2b) Revisar la calidad de las lecturas
$ mkdir mammillaria_fastqc \
$ fastqc mammillaria_secuencias/* -O mammillaria_fastqc/.

### 2c) Limpieza de datos
$ mkdir mammillaria_limpias

[TrimGalore](https://github.com/felixkrueger/trimgalore) \
$ conda install -c bioconda trim-galore 

$ trim_galore --paired mammillaria_secuencias/*1.fastq mammillaria_secuencias/*2.fastq --quality 28 --length 40 --clip_R1 20 --three_prime_clip_R1 20 --clip_R2 20 --three_prime_clip_R2 20 -o "mammillaria_limpias/."

## 2d) Revisar la calidad de las lecturas
$ fastqc mammillaria_limpias/*.fq -O mammillaria_fastqc/.

## 2e) Resumir la evaluación de la calidad de las lecturas
$ mkdir mammillaria_multiqc
$ multiqc mammillaria_fastqc/*.fq -o mammillaria_multiqc/.

---
# Paso 3:  Ensamble ***de novo***
[Getorganelle](https://github.com/kinggerm/getorganelle) \
$ conda install -c bioconda getorganelle

### 3a) Directorio
$ mkdir mammillaria_organelle
    
### 3b) Ensamble usando secuencia *seed*

$ get_organelle_from_reads.py -1 mammillaria_limpias/SRR23441678_1.fastq.gz -2 mammillaria_limpias/SRR23441678_2.fastq.gz -s sequence.fasta -w 85 -R 10 -k 81,95,99,109,115,119,121,125,127 -F embplant_pt -o mammillaria_organelle/ 

### 3c) Ensamble sin secuencia *seed*
$ get_organelle_from_reads.py -1 mammillaria_limpias/*1.fq -2 mammillaria_limpias/*2.fq -w 85 -R 10 -k 81,95,99,109,115,119,121,125,127 -F embplant_pt -o mammillaria_organelle/ 

---  
#  Paso 4: Datos del genoma   
[Bandage](https://rrwick.github.io/Bandage/) \
$ conda install -c bioconda bandage
### 4a) Visualizar gráfica de ensamblado
$ Bandage image mammillaria_organelle/*selected_graph.gfa mammillaria_organelle/graph_bandage.png \
$ eog graph_bandage.png \
$ Bandage image mammillaria_organelle/*selected_graph.gfa mammillaria_organelle/graph_bandage.png --lengths --depth


