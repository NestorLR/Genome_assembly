# Instalación de programas para el taller

## 1. Recomendaciones generales

1. La instalación de todos los programas puede tomar entre 30 y 60 minutos, dependiendo de la velocidad de la conexión a internet. Se recomienda realizar la instalación con anticipación. Si surge alguna duda, comunícate con el equipo de facilitadores del taller.

2. Asegúrate de contar con al menos **30–40 GB de espacio libre** en el disco duro para almacenar los programas, los datos crudos y los archivos generados durante los análisis.

3. Se recomienda disponer de **4–8 GB de memoria RAM** como mínimo para ejecutar los análisis del taller.

4. Durante el taller utilizaremos herramientas desarrolladas para sistemas Linux. Los usuarios de Windows deberán instalar el **Subsistema de Windows para Linux (WSL)** y una distribución de Ubuntu.

---

## 2. Instalación de Ubuntu en Windows mediante WSL

### Paso 1. Descargar Ubuntu

Descarga e instala Ubuntu desde Microsoft Store:

https://apps.microsoft.com/detail/9pdxgncfsczv

### Paso 2. Abrir PowerShell como administrador

1. Presiona la tecla **Windows**.
2. Escribe **PowerShell**.
3. Haz clic derecho sobre **Windows PowerShell** o **PowerShell**.
4. Selecciona **Ejecutar como administrador**.

### Paso 3. Verificar la versión de Windows

En PowerShell ejecuta:

```powershell
winver
```

WSL es compatible con Windows 10 y Windows 11 actualizados.

### Paso 4. Instalar WSL

En PowerShell ejecuta:

```powershell
wsl --install
```

Una vez finalizada la instalación, reinicia la computadora.

### Paso 5. Configurar Ubuntu

Abre la aplicación Ubuntu desde el menú de inicio.

Durante el primer inicio se solicitará:

* Nombre de usuario (usar únicamente letras minúsculas y números).
* Contraseña.

Ejemplo:

```text
Username: nestor
Password: ********
```

---

## 3. Instalación de Miniforge

Miniforge es una distribución ligera de Conda que utilizaremos para instalar los programas bioinformáticos.

Dentro de la terminal de Ubuntu ejecutar:

```bash
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
```

Ejecutar el instalador:

```bash
bash Miniforge3-Linux-x86_64.sh
```

Aceptar los términos de instalación y utilizar la configuración predeterminada.

Al finalizar, ejecutar:

```bash
source ~/.bashrc
```

Verificar la instalación:

```bash
conda --version
```

Deberá mostrarse una salida similar a:

```text
conda 25.x.x
```

---

## 4. Configuración de canales de Conda

Ejecutar los siguientes comandos:

```bash
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --set channel_priority flexible
```

Verificar la configuración:

```bash
conda config --show channels
```

La salida deberá incluir:

```text
channels:
  - bioconda
  - conda-forge
  - defaults
```

---

## 5. Verificación final

Comprueba que Ubuntu y Conda funcionan correctamente ejecutando:

```bash
conda info
```

## 6. Instalación de los programas bioinformáticos

Durante el taller utilizaremos diversos programas para la descarga, evaluación de calidad y ensamblado de genomas de cloroplasto. Todos los programas se instalarán mediante **Conda** dentro de un ambiente específico.

### Paso 1. Crear un ambiente de trabajo

Se recomienda crear un ambiente llamado `plastoma`:

```bash
conda create -n plastoma python=3.11
```

Activar el ambiente:

```bash
conda activate plastoma
```

### Paso 2. Instalar los programas necesarios

Ejecutar el siguiente comando:

```bash
mamba install -c bioconda -c conda-forge \
sra-tools \
fastqc \
multiqc \
trim-galore \
getorganelle
```

La instalación puede tardar varios minutos dependiendo de la velocidad de internet y del equipo de cómputo.

### Paso 3. Verificar la instalación

Comprobar que los programas fueron instalados correctamente ejecutando:

```bash
prefetch --version
```

```bash
fasterq-dump --version
```

```bash
fastqc --version
```

```bash
multiqc --version
```

```bash
trim_galore --version
```

```bash
get_organelle_from_reads.py --help
```

Si los comandos muestran información de versión o ayuda sin generar errores, la instalación se realizó correctamente.

### Programas utilizados durante el taller

| Programa     | Propósito                                                                  |
| ------------ | -------------------------------------------------------------------------- |
| SRA Toolkit  | Descarga de datos de secuenciación desde NCBI Sequence Read Archive (SRA). |
| FastQC       | Evaluación de la calidad de las lecturas de secuenciación.                 |
| MultiQC      | Integración de múltiples reportes de calidad en un único informe.          |
| Trimgalore   | Filtrado y limpieza de lecturas de secuenciación.                          |
| GetOrganelle | Ensamblado de genomas de organelos a partir de lecturas Illumina.          |

### Verificación final

Ejecutar:

```bash
conda list
```

Deberán aparecer los programas mencionados anteriormente dentro del ambiente `plastoma`.

