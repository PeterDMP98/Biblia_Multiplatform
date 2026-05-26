# Decisiones

Registro de decisiones tecnicas y de producto.

## 2026-05-25: Desktop Primero

Decision: el primer producto sera Desktop.

Razon: Desktop es el nucleo mas importante para lectura avanzada, estudio y proyeccion en iglesias.

## 2026-05-25: Offline-First

Decision: el MVP debe funcionar completamente offline.

Razon: la lectura biblica, notas, favoritos, resaltados y configuracion no deben depender de internet.

## 2026-05-25: Flutter Como Frontend Principal

Decision: usar Flutter y Dart.

Razon: permite una base multiplataforma con buen rendimiento para Desktop, Mobile y Web futura.

## 2026-05-25: SQLite Para MVP Local

Decision: usar SQLite como fuente principal de datos local.

Razon: es ligero, confiable, embebido y adecuado para una aplicacion offline-first.

## 2026-05-25: FastAPI Y PostgreSQL Para Backend Futuro

Decision: usar FastAPI y PostgreSQL cuando llegue la fase backend.

Razon: separa servicios online del nucleo offline y permite sincronizacion escalable.

## 2026-05-25: Sin IA En MVP

Decision: no implementar IA en el MVP.

Razon: aumenta complejidad, costos y distraccion respecto al nucleo de lectura.

## 2026-05-25: Biblia Hebrea Como Modulo Avanzado Futuro

Decision: posponer Biblia hebrea.

Razon: requiere soporte RTL, estructura canonica distinta, alineacion textual y complejidad avanzada.

## 2026-05-25: Riverpod Como Estado Recomendado

Decision: usar Riverpod para el estado de aplicacion y lectura.

Razon: permite separar estado, servicios y UI con buen rendimiento, pruebas simples y menor acoplamiento a widgets.

## 2026-05-25: Drift Como Acceso SQLite Recomendado

Decision: usar Drift como capa recomendada sobre SQLite.

Razon: ofrece seguridad de tipos, queries mantenibles y migraciones ordenadas sin abandonar SQLite como fuente local.

## 2026-05-25: RV1909 Como Texto Semilla Libre

Decision: usar Reina-Valera 1909 como version inicial para desarrollo mientras se resuelven licencias de RVR60 y TLA.

Razon: RVR60 y TLA son textos con copyright/licencia. RV1909 aparece publicada como dominio publico en fuentes confiables, lo que permite desarrollar importacion, busqueda y lectura sin riesgo legal inicial.

## 2026-05-25: Compatibilidad Desktop Multiplataforma

Decision: mantener compatibilidad arquitectonica con Windows, macOS y Linux desde el inicio, priorizando pruebas iniciales en Windows.

Razon: evita acoplar el nucleo a Windows y conserva la vision multiplataforma, sin frenar el avance en el entorno actual de desarrollo.

## 2026-05-25: Catalogo Libre Inicial

Decision: incluir como fuentes iniciales trazables RV1909, ASV 1901, KJV 1769 y WEB. Mantener RV1865, Biblia del Oso 1569, Biblia del Cantaro 1602 y Version Moderna como candidatas hasta confirmar fuente digital redistribuible.

Razon: una version antigua puede ser dominio publico, pero la transcripcion digital concreta tambien debe tener licencia clara y formato importable.

## 2026-05-25: Importacion Externa Bajo Responsabilidad Del Usuario

Decision: crear un modulo de importacion externa para archivos provistos por el usuario, sin descargar automaticamente textos con copyright.

Razon: permite a iglesias y usuarios cargar versiones que ya tengan derecho a usar, mientras la app mantiene separada la responsabilidad legal y conserva una arquitectura offline con SQLite.

## 2026-05-26: Importador USFX Primero

Decision: comenzar el pipeline de datos con USFX como formato fuente soportado.

Razon: RV1909, ASV, KJV y WEB ya estan disponibles localmente en USFX desde eBible, lo que permite poblar SQLite con datos reales antes de resolver formatos adicionales como SWORD o MySword.

## 2026-05-26: Canon Visible Pendiente

Decision: importar todos los libros presentes en cada fuente, pero dejar pendiente el filtro de canon visible por defecto.

Razon: KJV y WEB descargadas desde eBible incluyen mas de 66 libros. El motor de datos puede conservarlos, pero la experiencia inicial debe decidir si muestra todos o solo canon protestante por defecto.
