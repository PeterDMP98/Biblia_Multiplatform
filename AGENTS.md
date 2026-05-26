# Guia Para Agentes IA

Este archivo debe leerse antes de modificar el proyecto. Resume las reglas de trabajo para Codex u otros asistentes.

## Proyecto

Biblia Multiplatform es una plataforma biblica moderna, offline-first, modular, escalable y multiplataforma. El nucleo inicial es Desktop con Flutter.

## Prioridad Actual

Construir primero el MVP Desktop Offline.

No implementar backend, IA, sincronizacion cloud, Biblia hebrea ni funciones avanzadas hasta que el nucleo de lectura offline este bien definido.

## Reglas Arquitectonicas

- Separar datos, logica y UI.
- La UI no debe contener logica de negocio.
- El estado de lectura debe vivir fuera de los widgets.
- SQLite local es la fuente principal de datos para el MVP.
- La sincronizacion futura debe ser opcional, no una dependencia del lector.
- Los resaltados no modifican el texto biblico; son capas independientes.
- Notas, favoritos, historial y resaltados deben ser modelos desacoplados.
- Usar controladores, repositorios y servicios antes que mezclar responsabilidades.

## Reglas de Rendimiento

- No convertir cada versiculo en una pagina real independiente.
- Usar PageView virtualizado, buffer dinamico y precarga inteligente.
- Mantener buffer de capitulo anterior, actual y siguiente.
- Mantener buffer de versiculo anterior, actual y siguiente cuando aplique.
- Evitar reconstrucciones innecesarias de widgets.

## Reglas de Producto

- La lectura biblica es el centro de la experiencia.
- Desktop es el nucleo principal.
- Mobile no debe ser una copia exacta de Desktop.
- Web inicia como portal, descargas, cuentas y documentacion.
- Modo presentacion debe mostrar solo texto biblico limpio y referencia.
- Doble ventana para proyeccion: operador y proyeccion.

## Reglas Visuales

- Usar las referencias de la carpeta `estilos`.
- Estilo general: suave, limpio, moderno, premium y enfocado en lectura.
- Evitar UI recargada o colores religiosos exagerados.
- Modo claro con fondos calidos suaves.
- Modo oscuro sin negro puro.
- Tipografia serif para texto biblico y sans moderna para UI.

## Archivos Importantes

- `README.md`: descripcion general.
- `docs/CONTEXT.md`: memoria persistente del proyecto.
- `docs/ARCHITECTURE.md`: arquitectura y reglas tecnicas.
- `docs/DESIGN.md`: guia visual.
- `docs/ROADMAP.md`: fases.
- `docs/TASKS.md`: tareas vivas.
- `docs/DECISIONS.md`: decisiones.

