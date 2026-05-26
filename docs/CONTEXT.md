# Contexto Persistente Del Proyecto

## Nombre

Biblia Multiplatform.

## Descripcion Corta

Aplicacion biblica moderna de lectura, estudio y proyeccion, offline-first, modular y multiplataforma. El foco inicial es Desktop con Flutter.

## Objetivo Principal

Crear una experiencia biblica moderna, elegante y rapida, enfocada en lectura comoda, estudio y presentacion para iglesias. Debe funcionar completamente offline en el MVP y permitir sincronizacion futura sin acoplar el nucleo a servicios online.

## Modulos Planeados

| Modulo | Rol |
| --- | --- |
| Desktop | Nucleo principal del sistema |
| Mobile | Lectura rapida, notas, resaltados y control remoto |
| Web | Landing, descargas, cuentas, documentacion y futura lectura online |
| Backend | API, autenticacion, sincronizacion y servicios |

## Stack

| Area | Tecnologia |
| --- | --- |
| Frontend | Flutter |
| Lenguaje frontend | Dart |
| Base local | SQLite |
| Backend futuro | FastAPI |
| Lenguaje backend | Python |
| Base cloud futura | PostgreSQL |

## MVP Desktop Offline

Debe incluir:

- Lector biblico.
- Navegacion por libro, capitulo y versiculo.
- Busqueda simple.
- Notas.
- Resaltados.
- Marcadores y favoritos.
- Historial de lectura.
- Doble panel.
- Modo presentacion.
- Configuracion inicial de tema, fuente y tamano.

## No Incluir En MVP

- IA.
- Backend.
- Sincronizacion cloud.
- Biblia hebrea.
- Comunidad.
- Estudios avanzados.
- Exportaciones avanzadas.
- Web completa.

## Principios Clave

- Offline-first.
- Modular.
- Escalable.
- Multiplataforma.
- Alto rendimiento.
- Arquitectura desacoplada.
- UI moderna, suave y premium.
- La Biblia y la lectura son el centro.

## Referencias Visuales

Los archivos de referencia estan en:

- `estilos/estilo 1.jpg`: referencia general de plataforma, dashboard oscuro suave, sidebar minimalista y experiencia premium.
- `estilos/estilo de lectura.jpg`: referencia de lectura clara, calmada, con panel lateral y navegacion tipo libro.
- `estilos/estilo de lectura 2.jpg`: referencia de lectura en doble pagina con controles persistentes, buscador superior y barra inferior.

Estas imagenes son referencias de direccion visual, no plantillas exactas. La aplicacion debe permitir varias formas de lectura.

## Estado De Lectura Deseado

Ejemplo conceptual:

```text
book: Juan
chapter: 3
verse: 16
mode: verse
translation: RVR60
```

Este estado no debe depender de widgets. La UI solo escucha cambios.

