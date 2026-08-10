# Paso 0: Activar ambiente
### 0a) Ir a la Carpeta de trabajo
   $ cd /ruta/absoluta/a/taller_genomas

### 0b) Activar ambiente

$ conda create -n genomas python=3.11 \
$ conda activate genomas \
$ conda deactivate \
$ conda list

---
# Paso 1: Descarga de secuencias
### 1a) Enlista los directorios que tienes
$ ls
### 1b) Crear un directorio para las secuencias
$ mkdir mammillaria_secuencias_crudas
    
### 1c) Descargar las secuencias
Para el genoma de cloroplasto, usaremos los datos crudos de *Mammillaria magnimmama* provenientes del estudio de [Chincoya et al. 2023](https://www.mdpi.com/2079-7737/12/4/512), con **ID=SRR23441678** 

[GenBank](https://www.ncbi.nlm.nih.gov/genbank/) \
$ conda install -c bioconda sra-tools \
$ fasterq-dump SRR23441678 -O "mammillaria_secuencias/." --verbose 

### 1d) Revisa las características de los archivos descargados
$ ls -lh mammillaria_secuencias_crudas/*

---
# Paso 2: Preprocesamiento de los datos
[FastQC](https://github.com/s-andrews/fastqc) \
[FastQC explicación](https://hbctraining.github.io/Training-modules/planning_successful_rnaseq/lessons/QC_raw_data.html) \
$ mamba install -c bioconda -c conda-forge fastqc

### 2a) Revisar las primeras cuatro líneas de uno de los archivos fastqc
$ head -4 mammillaria_secuencias_crudas/SRR23441678_1.fastq

### 2b) Revisar la calidad de las lecturas
$ mkdir mammillaria_fastqc 

$ fastqc mammillaria_secuencias_crudas/* -O mammillaria_fastqc/.

### 2c) Limpieza de datos
$ mkdir mammillaria_secuencias_limpias

[TrimGalore](https://github.com/felixkrueger/trimgalore) \
$ mamba install -c bioconda -c conda-forge trim-galore 

$ trim_galore --paired mammillaria_secuencias_crudas/*1.fastq mammillaria_secuencias_crudas/*2.fastq --quality 28 --length 40 --clip_R1 20 --three_prime_clip_R1 20 --clip_R2 20 --three_prime_clip_R2 20 -o "mammillaria_secuencias_limpias/."

NOTA: 
- Phred-score=Q28 --> ca. 99.84% de confianza
- length=40 --> Longitud mínima de 40 bases de cada lectura después del recorte.
- --clip_R1 20 --> Elimina 20 bases del extremo 5' de R1
- --three_prime_clip_R1 20 --> Elimina 20 bases del extremo 3' de R1 


## 2d) Revisar la calidad de las lecturas
$ fastqc mammillaria_limpias/*.fq -O mammillaria_fastqc/.

## 2e) Resumir la evaluación de la calidad de las lecturas
$ mkdir mammillaria_multiqc

$ mamba install -c bioconda -c conda-forge multiqc

$ multiqc mammillaria_fastqc/. -o mammillaria_multiqc/.

---
# Paso 3:  Ensamble ***de novo***
[Getorganelle](https://github.com/kinggerm/getorganelle) \
$ mamba install -c bioconda -c conda-forge getorganelle

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


