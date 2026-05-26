# Biblia Multiplatform

Plataforma moderna de lectura, estudio y proyeccion biblica, pensada primero para Desktop y disenada desde el inicio como un sistema modular, offline-first y multiplataforma.

El objetivo no es crear solamente otra aplicacion biblica tradicional. La meta es construir una experiencia premium de lectura, estudio y presentacion, con alto rendimiento, arquitectura desacoplada y capacidad futura de sincronizacion entre Desktop, Mobile, Web y Backend.

## Vision

Biblia Multiplatform se divide en cuatro grandes modulos:

| Modulo | Objetivo |
| --- | --- |
| Desktop | Nucleo principal del sistema: lectura, estudio y proyeccion |
| Mobile | Lectura rapida, notas, resaltados y control remoto |
| Web | Portal, cuentas, descargas, documentacion y sincronizacion |
| Backend | API, autenticacion, sincronizacion y servicios online |

## Filosofia

- Offline-first: la lectura, notas, favoritos, resaltados y configuracion deben funcionar sin internet.
- Modular: cada pieza debe poder evolucionar sin acoplar toda la aplicacion.
- Escalable: preparado para multiples versiones biblicas, sincronizacion y proyeccion.
- Alto rendimiento: navegacion fluida, precarga inteligente y reconstrucciones controladas.
- UI moderna: lectura comoda, calma visual y experiencia profesional.

## Stack Planeado

- Flutter + Dart para Desktop, Mobile y futura Web app.
- SQLite para el MVP local offline.
- FastAPI + Python para el backend futuro.
- PostgreSQL para datos cloud futuros.

## Fases

1. MVP Desktop Offline: lector biblico, navegacion, busqueda, notas, resaltados, favoritos, doble panel y modo presentacion.
2. Experiencia Pro: temas, atajos, multiples versiones, exportacion y mejoras UX.
3. Backend: FastAPI, PostgreSQL, cuentas, sincronizacion y WebSockets.
4. Mobile: lectura movil, sincronizacion y control remoto.
5. Web Completa: lector web, estudios, comunidad y administracion.

## Documentacion del Proyecto

- [Contexto IA](docs/CONTEXT.md): memoria persistente para Codex y otras IAs.
- [Arquitectura](docs/ARCHITECTURE.md): capas, modulos y reglas tecnicas.
- [Diseno](docs/DESIGN.md): identidad visual, referencias y principios UX.
- [Roadmap](docs/ROADMAP.md): fases de desarrollo.
- [Tareas](docs/TASKS.md): lista viva de trabajo.
- [Decisiones](docs/DECISIONS.md): decisiones tecnicas y de producto.

