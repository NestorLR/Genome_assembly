### Este script documenta los pasos a seguir para el ensamble del genoma mitocondrial de Ambystoma mexicanum

### 01- Activar el ambiente conda 
conda activate plastoma

### 02- Crear los directorios necesarios

mkdir ambystoma_secuencias_SRA
mkdir ambystoma_secuencias_fastq

### 02- Descargar los datos crudos
#Descargar SRA
prefetch \
SRR12323373 \
--output-directory "/mnt/d/Taller_Ensamble_2026/ambystoma_secuencias_SRA/."

prefetch \
SRR30343940 \
--output-directory "/mnt/f/Taller_Ensamble_2026/test_SRA/."


# Transformar SRA a fastq
fasterq-dump \
"/mnt/f/Taller_Ensamble_2026/ambystoma_secuencias_SRA/SRR12323373/SRR12323373.sra" \
--split-files \
--outdir "/mnt/f/Taller_Ensamble_2026/ambystoma_secuencias_fastq/." \
--verbose 

fasterq-dump \
"/mnt/f/Taller_Ensamble_2026/test_SRA/SRR30343940/SRR30343940.sra" \
--split-files \
--outdir "/mnt/f/Taller_Ensamble_2026/test_fastq/." \
--verbose 

fasterq-dump SRR30343771 -O "/mnt/f/Taller_Ensamble_2026/test_fastq/." --verbose
	
