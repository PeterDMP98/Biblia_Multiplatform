# Arquitectura

## Enfoque General

La arquitectura debe mantenerse desacoplada. El lector biblico, la persistencia, la cache, la navegacion, la UI y la futura sincronizacion deben poder evolucionar de manera independiente.

El MVP debe construirse como una app Desktop offline-first. La UI debe poder cambiar de modo de lectura sin cambiar la fuente de datos ni duplicar logica de negocio.

## Stack Recomendado Para MVP

| Area | Decision recomendada |
| --- | --- |
| App | Flutter Desktop |
| Lenguaje | Dart |
| Estado | Riverpod |
| Base local | SQLite |
| Acceso SQLite | Drift |
| Navegacion UI | Router simple al inicio |
| Tests | Unit tests para dominio, repositorios y controller |

Riverpod se recomienda por estabilidad, rendimiento y separacion clara entre estado, servicios y UI. Permite que el estado de lectura viva fuera de los widgets y facilita pruebas sin depender del arbol visual.

Drift se recomienda porque da seguridad de tipos, queries mantenibles y migraciones mas ordenadas. Sqflite sigue siendo viable si se decide mantener una capa mas manual, pero para este proyecto Drift es la opcion preferida.

## Capas

### 1. Domain

Responsable de:

- Entidades puras.
- Value objects.
- Reglas de navegacion biblica.
- Contratos de repositorios.
- Casos de uso cuando haga falta.

No debe depender de Flutter, SQLite ni widgets.

Entidades iniciales:

- BibleVersion.
- BibleBook.
- BibleChapter.
- BibleVerse.
- VerseReference.
- ReaderState.
- Note.
- Highlight.
- Favorite.
- Bookmark.
- ReadingHistoryEntry.

### 2. Data / Persistencia

Responsable de:

- SQLite local.
- Repositorios concretos.
- Modelos persistentes.
- Cache persistente.
- Importadores de versiones biblicas.
- PostgreSQL futuro desde backend, no desde el cliente Desktop.

Esta capa implementa los contratos definidos en Domain.

### 3. Cache Manager

Responsable de:

- Precarga inteligente.
- Buffer de capitulos.
- Buffer de versiculos.
- Gestion de memoria activa.
- Limpieza automatica.

El cache manager no decide como se ve la lectura. Solo entrega datos preparados para el Reader Controller.

### 4. Reader Engine / Reader Controller

Responsable de:

- Estado de lectura.
- Navegacion.
- Modo lectura.
- Cambio de versiones.
- Eventos.
- Solicitar precarga.
- Integracion futura con sincronizacion.

El estado no debe depender de widgets.

### 5. UI Layer

Responsable de:

- Renderizar.
- Mostrar informacion.
- Animaciones.
- Interacciones visuales.

La UI no debe contener logica de negocio.

### 6. Platform Layer

Responsable de:

- Ventanas Desktop.
- Atajos del sistema.
- Archivos locales.
- Importacion/exportacion.
- Integracion futura con controles externos.

## Estructura De Carpetas Recomendada

Cuando se cree el proyecto Flutter, usar una estructura similar:

```text
lib/
  app/
    app.dart
    bootstrap.dart
    theme/
    shortcuts/
  core/
    errors/
    result/
    utils/
  features/
    bible/
      domain/
        entities/
        repositories/
        value_objects/
      data/
        database/
        importers/
        repositories/
      application/
        cache/
        reader/
        search/
      presentation/
        reader/
        search/
        shared/
    notes/
    highlights/
    bookmarks/
    presentation_mode/
  platform/
    desktop/
```

Regla: `presentation` puede depender de `application`; `application` puede depender de `domain`; `data` implementa contratos de `domain`. `domain` no depende de ninguna otra capa.

## Modos De Lectura

El MVP debe contemplar tres modos:

### 1. Capitulo Completo

Muestra un capitulo como unidad continua. Es ideal para lectura normal y busqueda contextual.

Estado minimo:

```text
book
chapter
translation
mode: chapter
```

### 2. Lectura Enfocada Doble Pagina

Muestra un versiculo por lado, como doble pagina tipo libro.

- Pagina izquierda: versiculo actual.
- Pagina derecha: versiculo siguiente.
- La navegacion avanza por versiculos.
- Debe mantener buffer de versiculo anterior, actual y siguiente.

Estado minimo:

```text
book
chapter
verse
translation
mode: focusedVerseSpread
```

### 3. Doble Panel

Debe soportar dos variantes:

- Modo A: versiculo actual y siguiente versiculo.
- Modo B: comparacion entre version A y version B.

Estado minimo:

```text
primaryReference
primaryTranslation
secondaryTranslation?
mode: splitPanel
splitMode: nextVerse | compareTranslations
```

## Reader State

El estado central debe ser serializable para poder guardar/restaurar sesion.

Campos iniciales recomendados:

```text
currentReference
primaryTranslationId
secondaryTranslationId
readingMode
splitMode
fontScale
themeMode
isSidebarVisible
isNotesPanelVisible
lastUpdatedAt
```

El Reader Controller debe exponer acciones, no setters sueltos:

- goToReference(reference)
- nextVerse()
- previousVerse()
- nextChapter()
- previousChapter()
- changeReadingMode(mode)
- changePrimaryTranslation(versionId)
- changeSecondaryTranslation(versionId)
- toggleSidebar()
- toggleNotesPanel()

## Precarga Inteligente

### Buffer De Capitulos

Mantener:

```text
capitulo anterior
capitulo actual
capitulo siguiente
```

### Buffer De Versiculos

Mantener:

```text
versiculo anterior
versiculo actual
versiculo siguiente
```

La precarga debe ser silenciosa y asincrona.

## Navegacion

No convertir cada versiculo en una pagina real independiente.

Usar:

- PageView virtualizado.
- Buffer dinamico.
- Precarga inteligente.
- Navegacion desacoplada.

## Resaltados

Los resaltados son capas independientes. No modifican el texto biblico.

Cada resaltado debe guardar:

- version.
- libro.
- capitulo.
- versiculo.
- rango.
- color.
- createdAt.
- updatedAt.

## Notas

Las notas deben estar desacopladas visualmente de la Biblia para poder ocultarlas en proyeccion.

Cada nota debe guardar:

- version opcional.
- libro.
- capitulo.
- versiculo opcional.
- contenido.
- createdAt.
- updatedAt.

## Datos Biblicos

### Versiones Iniciales

Para desarrollo se recomienda usar versiones libres y trazables:

- Reina-Valera 1909.
- American Standard Version 1901.
- King James Version 1769.
- World English Bible.

RVR60 y TLA deben tratarse como versiones con licencia hasta confirmar permiso de uso para una app.

Versiones candidatas en espanol:

- Reina-Valera 1865.
- Biblia del Oso 1569.
- Biblia del Cantaro 1602.
- Version Moderna / H. B. Pratt.

No incluir candidatas en el instalador hasta confirmar una fuente digital redistribuible, no solo la antiguedad del texto.

### Formato De Importacion

El importador debe aceptar un formato intermedio propio antes de escribir en SQLite:

```json
{
  "version": {
    "id": "rv1909",
    "name": "Reina-Valera 1909",
    "language": "es",
    "license": "public_domain"
  },
  "books": [
    {
      "osis": "John",
      "name": "Juan",
      "order": 43,
      "chapters": [
        {
          "number": 3,
          "verses": [
            {
              "number": 16,
              "text": "..."
            }
          ]
        }
      ]
    }
  ]
}
```

La app no debe depender del formato original descargado. Todo archivo externo debe convertirse primero al formato intermedio.

### Importacion Externa

El usuario podra importar archivos propios bajo su responsabilidad. El importador debe:

- Mostrar aviso legal antes de importar.
- No descargar automaticamente versiones con copyright.
- Registrar fuente declarada por el usuario.
- Registrar licencia declarada por el usuario.
- Validar que la estructura sea compatible antes de escribir en SQLite.
- Convertir siempre a formato intermedio antes de insertar.

### Esquema SQLite Inicial

Tablas recomendadas:

- bible_versions.
- bible_books.
- bible_chapters.
- bible_verses.
- notes.
- highlights.
- favorites.
- bookmarks.
- reading_history.
- reader_preferences.

Indices minimos:

- bible_verses(version_id, book_id, chapter_number, verse_number).
- notes(book_id, chapter_number, verse_number).
- highlights(book_id, chapter_number, verse_number).
- reading_history(updated_at).

La busqueda simple puede comenzar con una consulta normal sobre texto normalizado. Si el rendimiento no alcanza, se agrega FTS5 sin cambiar el dominio.

## Proyeccion

La arquitectura correcta es doble ventana:

- Ventana Operador: busqueda, navegacion, versiones y control.
- Ventana Proyeccion: texto biblico limpio, sin controles internos.

## Shortcuts

Debe existir un sistema centralizado y configurable de atajos.

Ejemplos:

| Accion | Shortcut |
| --- | --- |
| Buscar | Ctrl + F |
| Ocultar menu | Ctrl + M |
| Aumentar letra | Ctrl + + |
| Versiculo siguiente | Flecha derecha |
| Versiculo anterior | Flecha izquierda |

## Compatibilidad Desktop

La app debe mantenerse compatible con Windows, macOS y Linux desde la arquitectura, pero el primer ciclo de pruebas puede priorizar Windows porque es el entorno actual.

Reglas:

- No usar APIs especificas de Windows dentro de capas de dominio o aplicacion.
- Aislar integraciones de ventana y archivos en `platform/desktop`.
- Probar rutas de archivos con helpers multiplataforma.
- Evitar dependencias Desktop que soporten solo un sistema operativo, salvo que tengan fallback.
