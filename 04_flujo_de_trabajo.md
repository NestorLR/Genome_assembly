# 1. Descargar los datos
---

- Los que trabajarán con **genoma de cloroplasto:**

```bash
conda activate plastoma 
```

```bash
fasterq-dump SRR23441678 -O "secuencias_crudas/." --verbose 
```

- Los que trabajarán con **genoma de mitocondria**

```bash
conda activate plastoma 
```

```bash
fasterq-dump SRR1171146	-O "secuencias_crudas/." --verbose 
```

### Programas utilizados durante el taller

| Programa     | Propósito                                                                  |
| ------------ | -------------------------------------------------------------------------- |
| SRA Toolkit  | Descarga de datos de secuenciación desde NCBI Sequence Read Archive (SRA). |
| FastQC       | Evaluación de la calidad de las lecturas de secuenciación.                 |
| MultiQC      | Integración de múltiples reportes de calidad en un único informe.          |
| Trimgalore   | Filtrado y limpieza de lecturas de secuenciación.                          |
| GetOrganelle | Ensamblado de genomas de organelos a partir de lecturas Illumina.          |
| Bandage      | Visualización de gráficas del ensamblado.                                  |

---
# 2. Bases de datos públicas para información genética y genómica
---

Exploremos la página del [NCBI](https://www.ncbi.nlm.nih.gov/genbank/)


Para el genoma de cloroplasto, usaremos los datos de *Mammillaria magnimmama* provenientes del estudio de [Chincoya et al. 2023](https://www.mdpi.com/2079-7737/12/4/512), con **ID=SRR23441678** 

En el caso del genoma mitocondrial, usaremos los datos crudos de *Apis mellifera* subsp. *scutellata* con ID: **SRR1171146**

# 3. Pre-procesamiento de los datos
---
Software a utilizar: [FastQC](https://github.com/s-andrews/fastqc) \
[FastQC explicación](https://hbctraining.github.io/Training-modules/planning_successful_rnaseq/lessons/QC_raw_data.html) \


### 3a) Revisar las primeras cuatro líneas de uno de los archivos fastqc

- Los que trabajarán con **genoma de cloroplasto:**

```bash
head -4 secuencias_crudas/SRR23441678_1.fastq
```

- Los que trabajarán con **genoma de mitocondria**

```bash
head -4 secuencias_crudas/SRR1171146_1.fastq
```

### 3b) Analizar la calidad de las lecturas de nuestros datos

- **Todos hacemos:**
```bash
fastqc secuencias_crudas/* -O fastqc/.
```

Localizamos el reporte .html y lo abrimos.

### 3c) Limpieza de datos (Solo para datos de genoma de cloroplasto)

Software:[TrimGalore](https://github.com/felixkrueger/trimgalore) \

- Para los que trabajan con **genoma de cloroplasto:**

```bash
trim_galore --paired secuencias_crudas/*1.fastq secuencias_crudas/*2.fastq --quality 20 --length 40 --clip_R1 20 --three_prime_clip_R1 20 --clip_R2 20 --three_prime_clip_R2 20 -o "secuencias_limpias/."
```

NOTA: 
- Phred-score=Q28 --> ca. 99.84% de confianza
- length=40 --> Longitud mínima de 40 bases de cada lectura después del recorte.
- --clip_R1 20 --> Elimina 20 bases del extremo 5' de R1
- --three_prime_clip_R1 20 --> Elimina 20 bases del extremo 3' de R1


- Para los que trabajan con **genoma de mitocondria:**

```bash
trim_galore --paired secuencias_crudas/*1.fastq secuencias_crudas/*2.fastq --quality 20 -o "secuencias_limpias/."
```


## 3d) Revisar la nueva calidad de las lecturas (TODOS)

```bash
fastqc secuencias_limpias/*.fq -O fastqc/.
```

---
# 4.  Ensamble ***de novo***
Software: [Getorganelle](https://github.com/kinggerm/getorganelle) \

- Los que trabajan con **genoma de cloroplasto:**

```bash
get_organelle_from_reads.py -1 secuencias_limpias/*1.fq -2 secuencias_limpias/*2.fq -t 4 -w 85 -R 10 -k 81,95,99,109,115,119,121,125,127 -F embplant_pt -o genoma_ensamblado/.
```

- Los que trabajan con **genoma de mitocondria**

```bash
get_organelle_from_reads.py -1 secuencias_limpias/*1.fq -2 secuencias_limpias/*2.fq -t 4 -w 85 -R 10 -k 21,45,65,85,105 -F animal_mt -o genoma_ensamblado/.
```


---  
#  5.  Datos del genoma   
Software: [Bandage](https://rrwick.github.io/Bandage/) \

### Visualizar gráfica de ensamblado
$ Bandage image genoma_ensamblado/*selected_graph.gfa genoma_ensamblado/graph_bandage.png \
$ eog graph_bandage.png \
$ Bandage image genoma_ensamblado/*selected_graph.gfa genoma_ensamblado/graph_bandage.png --lengths --depth


