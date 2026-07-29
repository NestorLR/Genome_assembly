# Taller: Introducción a la bioinformática: Ensamble y anotación de genomas de cloroplasto y mitocondria


![Banner del taller](Figuras/Banner.png)

## ¡Bienvenidxs!

Les damos la bienvenida al repositorio oficial del taller **"Introducción a la bioinformática: Ensamble y anotación de genomas de cloroplasto y mitocondria"** en el marco del XLIV Coloquio de Investigación de la Facultad de Estudios Superiores Iztacala, UNAM.

---
## Coordinadora
* **Dra. Sofía Solórzano Lujano** — Profesora de Carrera Titular C y responsable del [Laboratorio de Ecología Molecular y Evolución](https://posgrado.iztacala.unam.mx/laboratorio-de-ecologia-molecular-y-evolucion/). \
Correo: sofia.lujano@iztacala.unam.mx 
## Facilitadores
* **Dr. Vicente de Jesús Castillo Chora** — Investigador posdoctoral. vicentecchora@gmail.com
* **Biól. Néstor Edwin López Ruiz** — Estudiante de Doctorado en Ciencias Biológicas. nestorlopezruiz99@gmail.com
* **Elba Iztel Nicanor Licona** — Tesista de la Licenciatura en Biología.
* **Erika Yazmín Maldonado González** — Estudiante de la Licenciatura en Biología.
---
## Antecedentes
El genoma de cloropasto y la mitocondria no solo contienen genes esenciales involucrados en procesos biológicos fundamentales como la fotosíntesis y la respiración celular, sino que resguardan la historia evolutiva de las especies que los contienen. 

Gracias a la creciente disponibilidad de datos genómicos públicos, actualmente es posible recuperar y analizar estos genomas utilizando estrategias bioinformáticas, las cuáles pueden ser útiles para estudiantes e investigadores de distintas áreas de las ciencias biológicas. 

Desde 2016, el Laboratorio de Ecología Molecular y Evolución desarrolla investigación en ensamblado y anotación de genomas citoplásmicos en plantas, particularmente en cactáceas. Como resultado de este trabajo se ha contribuido a la descripción de los primeros [genomas de cloroplasto ensamblados](https://pubmed.ncbi.nlm.nih.gov/31581555/) para diversas especies de cactus y del [primer genoma mitocondrial](https://pubmed.ncbi.nlm.nih.gov/37653379/) reportado para una angiosperma.

---
## Objetivo general

Introducir a los participantes en el uso básico de herramientas bioinformáticas para el ensamblado y la anotación de genomas citoplásmicos a partir de datos de secuenciación masiva.

### Objetivos específicos

* Familiarizar a los participantes con las principales tecnologías de secuenciación masiva.
* Introducir el uso básico de la línea de comandos en Linux aplicada a la bioinformática.
* Guiar la obtención de datos genómicos provenientes de repositorios públicos.
* Implementar flujos de trabajo reproducibles para el ensamblado *de novo* y la anotación de genomas de cloroplasto.

---

## Secuencia del taller

| Horario       | Actividad                                                                                                        |
| ------------- | ---------------------------------------------------------------------------------------------------------------- |
| 09:00 – 09:30 | Introducción a las tecnologías de secuenciación masiva y al flujo experimental de generación de datos genómicos. |
| 09:30 – 10:30 | Introducción a Linux, línea de comandos e instalación de programas bioinformáticos.                              |
| 10:30 – 11:00 | Exploración de repositorios públicos y descarga de datos genómicos.                                              |
| 11:00 – 11:30 | Ensamblado *de novo* de genomas citoplásmicos utilizando GetOrganelle.                                           |
| 11:30 – 12:30 | Anotación génica mediante herramientas en línea.                                                                 |
| 12:30 – 13:00 | Integración, interpretación y discusión de resultados.                                                           |

---

## Estructura del repositorio
El objetivo de este repositorio es proporcionar a los participantes los materiales de consulta, comandos, scripts y recursos utilizados durante las actividades prácticas del taller. A lo largo de la jornada, exploraremos los fundamentos de la secuenciación masiva y desarrollaremos un flujo de trabajo reproducible para el ensamblado y la anotación de genomas citoplásmicos utilizando herramientas bioinformáticas de libre acceso.

Los materiales del taller se encuentran organizados en los siguientes documentos:

| Documento                       | Contenido                                                                  |
| ------------------------------- | -------------------------------------------------------------------------- |
| [01_instalacion.md](https://github.com/vicentoc/Genome_assembly/blob/main/01_Instalaci%C3%B3n_Programas.md)             | Instalación de Ubuntu, Miniforge y programas bioinformáticos.              |
| [02_Introducción.md](https://github.com/vicentoc/Genome_assembly/blob/main/02_Introducci%C3%B3n.md)            | Introducción a los genomas de cloroplasto y la secuenciación masiva        |
| 03_descarga_datos.md          | Introducción a repositorios públicos y descarga de datos de secuenciación. |
| 04_control_calidad.md         | Evaluación y filtrado de lecturas mediante FastQC y TrimGalore.            |
| 05_ensamblado_getorganelle.md | Ensamblado *de novo* de genomas citoplásmicos utilizando GetOrganelle.     |
| 06_anotacion_plastoma.md      | Anotación y exploración de genomas ensamblados mediante GeSeq.             |

---

¡Bienvenidxs y mucho éxito durante la sesión!

