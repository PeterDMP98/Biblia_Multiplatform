# Fuentes De Datos Biblicos

## Regla General

No incorporar textos biblicos con copyright sin licencia explicita para uso en una app.

La app debe separar:

- Textos libres para desarrollo y distribucion permitida.
- Textos licenciados para distribucion futura.
- Importadores tecnicos que no dependan de una version especifica.

## Catalogo Inicial De Versiones Libres

Estados:

- `incluida`: fuente descargada y lista para construir el importador.
- `aprobada_pendiente_importador`: licencia clara, pero requiere soportar otro formato.
- `candidata_pendiente_fuente`: texto historico probablemente libre, pero falta una fuente digital confiable y redistribuible.
- `licencia_requerida`: no distribuir sin permiso explicito.

### Reina-Valera 1909

Estado: dominio publico segun eBible.

Estado del proyecto: `incluida`.

Uso recomendado:

- Desarrollo del importador.
- Pruebas de SQLite.
- Busqueda simple.
- Validacion de modos de lectura.
- Distribucion inicial si se confirma que el paquete final conserva atribucion/licencia correspondiente.

Archivos locales:

```text
data/raw/rv1909/spaRV1909_usfx.zip
data/raw/rv1909/usfx/spaRV1909_usfx.xml
data/raw/rv1909/usfx/spaRV1909metadata.xml
data/raw/rv1909/usfx/copr.htm
```

Fuente:

```text
https://ebible.org/bible/details.php?all=1&id=spaRV1909
```

Formato descargado:

```text
USFX
https://ebible.org/Scriptures/spaRV1909_usfx.zip
```

### Reina-Valera 1865

Estado: dominio publico segun CrossWire.

Estado del proyecto: `aprobada_pendiente_importador`.

Notas:

- CrossWire publica el modulo `SpaRV1865` con licencia Public Domain.
- El paquete disponible es modulo SWORD, por lo que conviene soportarlo despues del importador USFX.
- Tambien existe un Nuevo Testamento 1865 en Project Gutenberg, pero no sirve como fuente completa para el MVP.

Fuente:

```text
https://www.crosswire.org/sword/modules/ModInfo.jsp?modName=SpaRV1865
```

### Biblia Del Oso 1569

Estado: dominio publico por antiguedad del texto original.

Estado del proyecto: `candidata_pendiente_fuente`.

Notas:

- No basta con que el texto original sea antiguo; necesitamos una transcripcion digital con licencia clara.
- Wikisource puede servir como referencia, pero antes de empaquetar hay que revisar licencia de la transcripcion y formato.

Fuente candidata:

```text
https://es.wikisource.org/wiki/Biblia_del_Oso
```

### Biblia Del Cantaro 1602

Estado: dominio publico por antiguedad del texto original.

Estado del proyecto: `candidata_pendiente_fuente`.

Notas:

- Necesita fuente digital confiable, completa y redistribuible.
- Evitar PDFs modernos con restricciones de uso comercial o modificacion.

### Version Moderna / H. B. Pratt

Estado: probable dominio publico por antiguedad, pendiente de fuente digital clara.

Estado del proyecto: `candidata_pendiente_fuente`.

Notas:

- Antes de incluirla hay que confirmar edicion, fecha, transcriptor y licencia.
- Si solo aparece como PDF escaneado, se deja para una fase posterior.

## Fuentes En Ingles Incluidas

### American Standard Version 1901

Estado: dominio publico segun eBible y CrossWire.

Estado del proyecto: `incluida`.

Archivos locales:

```text
data/raw/asv/eng-asv_usfx.zip
data/raw/asv/usfx/eng-asv_usfx.xml
data/raw/asv/usfx/eng-asvmetadata.xml
data/raw/asv/usfx/copr.htm
```

Fuente:

```text
https://ebible.org/details.php?id=eng-asv
```

Formato descargado:

```text
USFX
https://ebible.org/Scriptures/eng-asv_usfx.zip
```

### King James Version 1769

Estado: dominio publico fuera del Reino Unido segun eBible; en Reino Unido tiene restriccion historica de impresion/importacion.

Estado del proyecto: `incluida`.

Notas:

- Usar con nota de licencia para Reino Unido.
- Para distribucion inicial enfocada en America, es viable.

Archivos locales:

```text
data/raw/kjv/eng-kjv_usfx.zip
data/raw/kjv/usfx/eng-kjv_usfx.xml
data/raw/kjv/usfx/eng-kjvmetadata.xml
data/raw/kjv/usfx/copr.htm
```

Fuente:

```text
https://ebible.org/details.php?id=eng-kjv
```

Formato descargado:

```text
USFX
https://ebible.org/Scriptures/eng-kjv_usfx.zip
```

### World English Bible

Estado: dominio publico segun eBible.

Estado del proyecto: `incluida`.

Notas:

- "World English Bible" es marca de eBible.org; si se modifica el texto, no debe conservar ese nombre.

Archivos locales:

```text
data/raw/web/engwebp_usfx.zip
data/raw/web/usfx/engwebp_usfx.xml
data/raw/web/usfx/engwebpmetadata.xml
data/raw/web/usfx/copr.htm
```

Fuente:

```text
https://ebible.org/details.php?id=engwebp
```

Formato descargado:

```text
USFX
https://ebible.org/Scriptures/engwebp_usfx.zip
```

## Versiones Deseadas Pero Pendientes De Licencia

### Reina-Valera 1960

Estado: requiere licencia.

Notas:

- BibleGateway indica que RVR1960 es marca registrada de Sociedades Biblicas Unidas y se usa bajo licencia.
- No descargar ni incluir copias de repositorios, PDFs o sitios no oficiales para distribucion dentro de la app.

### Traduccion En Lenguaje Actual

Estado: requiere licencia.

Notas:

- TLA es una traduccion de Sociedades Biblicas Unidas.
- No descargar ni incluir copias no oficiales para distribucion dentro de la app.

## Estrategia Tecnica

1. Crear importador para formato intermedio propio.
2. Crear convertidor USFX -> formato intermedio.
3. Insertar formato intermedio en SQLite.
4. Mantener metadatos de licencia por version.
5. Permitir que futuras versiones licenciadas entren por el mismo importador.
