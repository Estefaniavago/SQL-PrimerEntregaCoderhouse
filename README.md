# SQL-PrimerEntregaCoderhouse
# Sistema de Gestión Integral para la Adopción de Mascotas

## Descripción de la temática

La base de datos propuesta tiene como finalidad centralizar y organizar la información necesaria para gestionar de forma eficiente el proceso de adopción de mascotas en refugios u organizaciones protectoras de animales. Este tipo de instituciones suelen operar con recursos limitados y una gran cantidad de datos que deben ser registrados, actualizados y consultados con frecuencia, lo que hace imprescindible contar con una herramienta tecnológica que respalde su operación diaria.

El sistema abarcará todas las etapas del ciclo de adopción: desde el ingreso de una mascota al refugio, su estado de salud, especie y características, hasta la vinculación con posibles adoptantes a través de solicitudes, visitas previas, aprobación del proceso y seguimiento post-adopción. 

Además, la base de datos contempla la incorporación de funcionalidades complementarias como el registro de eventos veterinarios (vacunas, tratamientos, cirugías), y la posibilidad de documentar donaciones realizadas por particulares o empresas, fundamentales para la sustentabilidad del refugio.

El modelo de datos busca facilitar tareas administrativas y operativas, optimizando el trabajo del personal y voluntarios mediante consultas rápidas, reportes automatizados y vistas específicas según cada necesidad. También permitirá llevar un control detallado de las mascotas adoptadas y aquellas que aún están disponibles, favoreciendo la trazabilidad de cada caso.

En un contexto donde la conciencia social sobre la adopción responsable y el bienestar animal está en constante crecimiento, disponer de un sistema organizado y accesible contribuye significativamente a mejorar los índices de adopción, evitar el abandono y promover una tenencia responsable.

![image](https://github.com/user-attachments/assets/804ce51e-c7a8-4cc0-82be-ec993584a393)

(Aclaracion respecto a la iamgen, por cuestiones de prolijidad y de uso de la herramienta gratuita, no se agregaron los atributos de cada entidad. A continuacion se presentan las entidades con sus atributos)

## Entidades y Atributos

### 1. Mascota
Información de cada animal alojado en el refugio.

- `id_mascota` (PK) – Identificador único  
- `nombre` – Nombre de la mascota  
- `especie` – Perro, gato, etc.  
- `raza` – Raza específica  
- `edad_aproximada` – Edad estimada (años o meses)  
- `sexo` – Macho / Hembra  
- `fecha_ingreso` – Fecha en la que ingresó al refugio  
- `estado_adopcion` – Disponible / Adoptado / En seguimiento  
- `id_refugio` (FK) – Hace referencia al refugio que la aloja  

---

### 2. Refugio
Organización o lugar donde se encuentra la mascota.

- `id_refugio` (PK) – Identificador del refugio  
- `nombre` – Nombre del refugio  
- `direccion` – Dirección física  
- `telefono` – Teléfono de contacto  
- `email` – Correo electrónico de contacto  

---

### 3. Adoptante
Persona interesada o que ha adoptado una mascota.

- `id_adoptante` (PK) – Identificador del adoptante  
- `nombre` – Nombre completo  
- `dni` – Documento de identidad  
- `telefono` – Teléfono de contacto  
- `email` – Correo electrónico  
- `direccion` – Dirección del adoptante  

---

### 4. SolicitudAdopcion
Registra el pedido de adopción por parte del adoptante.

- `id_solicitud` (PK) – Identificador de la solicitud  
- `fecha_solicitud` – Fecha de presentación de la solicitud  
- `estado` – Pendiente / Aprobada / Rechazada / Cancelada  
- `id_adoptante` (FK) – Hace referencia al solicitante  
- `id_mascota` (FK) – Hace referencia a la mascota solicitada  

---

### 5. Seguimiento
Registra controles posteriores a la adopción.

- `id_seguimiento` (PK) – Identificador del control  
- `id_solicitud` (FK) – Hace referencia a la solicitud asociada  
- `fecha_visita` – Fecha del control  
- `observaciones` – Notas del responsable  
- `estado_mascota` – Bien / Mal adaptada / Requiere revisión  

---

### 6. Veterinario
Datos del profesional que atiende a las mascotas.

- `id_veterinario` (PK) – Identificador  
- `nombre` – Nombre completo  
- `matricula` – Número de matrícula profesional  
- `telefono` – Teléfono de contacto  
- `email` – Email  

---

### 7. ConsultaVeterinaria
Historial médico de cada mascota.

- `id_consulta` (PK) – Identificador único  
- `id_mascota` (FK) – Mascota atendida  
- `id_veterinario` (FK) – Profesional responsable  
- `fecha_consulta` – Fecha  
- `motivo` – Motivo de la atención  
- `tratamiento` – Descripción del tratamiento aplicado  

---

### 8. Donacion
Registra contribuciones realizadas al refugio.

- `id_donacion` (PK) – Identificador único  
- `fecha` – Fecha de la donación  
- `monto` – Monto donado  
- `donante_nombre` – Nombre del donante  
- `id_refugio` (FK) – Refugio beneficiado  

## Resumen de Entidades y Atributos

| Entidad             | Atributo              | Tipo de Dato Sugerido   | Clave         |
|---------------------|------------------------|--------------------------|---------------|
| **Mascota**         | id_mascota             | INT AUTO_INCREMENT       | PK            |
|                     | nombre                 | VARCHAR(50)              |               |
|                     | especie                | VARCHAR(30)              |               |
|                     | raza                   | VARCHAR(50)              |               |
|                     | edad_aproximada        | INT                      |               |
|                     | sexo                   | ENUM('Macho', 'Hembra')  |               |
|                     | fecha_ingreso          | DATE                     |               |
|                     | estado_adopcion        | ENUM('Disponible', 'Adoptado', 'En seguimiento') |    |
|                     | id_refugio             | INT                      | FK → Refugio  |
| **Refugio**         | id_refugio             | INT AUTO_INCREMENT       | PK            |
|                     | nombre                 | VARCHAR(100)             |               |
|                     | direccion              | VARCHAR(150)             |               |
|                     | telefono               | VARCHAR(20)              |               |
|                     | email                  | VARCHAR(100)             |               |
| **Adoptante**       | id_adoptante           | INT AUTO_INCREMENT       | PK            |
|                     | nombre                 | VARCHAR(100)             |               |
|                     | dni                    | VARCHAR(15)              |               |
|                     | telefono               | VARCHAR(20)              |               |
|                     | email                  | VARCHAR(100)             |               |
|                     | direccion              | VARCHAR(150)             |               |
| **SolicitudAdopcion** | id_solicitud        | INT AUTO_INCREMENT       | PK            |
|                     | fecha_solicitud        | DATE                     |               |
|                     | estado                 | ENUM('Pendiente', 'Aprobada', 'Rechazada', 'Cancelada') |   |
|                     | id_adoptante           | INT                      | FK → Adoptante|
|                     | id_mascota             | INT                      | FK → Mascota  |
| **Seguimiento**     | id_seguimiento         | INT AUTO_INCREMENT       | PK            |
|                     | id_solicitud           | INT                      | FK → SolicitudAdopcion |
|                     | fecha_visita           | DATE                     |               |
|                     | observaciones          | TEXT                     |               |
|                     | estado_mascota         | VARCHAR(50)              |               |
| **Veterinario**     | id_veterinario         | INT AUTO_INCREMENT       | PK            |
|                     | nombre                 | VARCHAR(100)             |               |
|                     | matricula              | VARCHAR(30)              |               |
|                     | telefono               | VARCHAR(20)              |               |
|                     | email                  | VARCHAR(100)             |               |
| **ConsultaVeterinaria** | id_consulta       | INT AUTO_INCREMENT       | PK            |
|                     | id_mascota             | INT                      | FK → Mascota  |
|                     | id_veterinario         | INT                      | FK → Veterinario |
|                     | fecha_consulta         | DATE                     |               |
|                     | motivo                 | TEXT                     |               |
|                     | tratamiento            | TEXT                     |               |
| **Donacion**        | id_donacion            | INT AUTO_INCREMENT       | PK            |
|                     | fecha                  | DATE                     |               |
|                     | monto                  | DECIMAL(10,2)            |               |
|                     | donante_nombre         | VARCHAR(100)             |               |
|                     | id_refugio             | INT                      | FK → Refugio  |
