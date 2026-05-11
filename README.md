# drip_ui

`drip_ui` es una librería de componentes Flutter con estilo Drip para construir pantallas de autenticación y catálogo.

## Qué incluye

- Campos de texto reutilizables.
- Botones y branding visual.
- Tarjeta de producto en formato lista.
- Tarjeta de producto cuadrada.
- Grid de productos con columnas configurables y carga progresiva por scroll.

## Instalación

### Desde Git

Agrega la librería a tu `pubspec.yaml` desde un repositorio Git:

```yaml
dependencies:
  flutter:
    sdk: flutter
  drip_ui:
    git:
      url: https://github.com/tu-usuario/drip_ui.git
      ref: main
```

### Dependencia local

Si trabajas dentro del mismo workspace o quieres probar la librería localmente, puedes usar una referencia por ruta:

```yaml
dependencies:
  flutter:
    sdk: flutter
  drip_ui:
    path: ../drip_ui
```

## Importación

```dart
import 'package:drip_ui/drip_ui.dart';
```

## Uso básico

### Tarjeta de producto en lista

```dart
DripProductListItem(
  productName: 'Queso fresco artesanal',
  price: 'Q35.00',
  unit: 'kg',
  label: 'Nuevo',
  store: 'Tienda Central',
  imageUrl: 'https://example.com/product.jpg',
  onAdd: () {
    // Agregar al carrito
  },
)
```

### Tarjeta de producto cuadrada

```dart
DripProductSquareCard(
  productName: 'Miel orgánica',
  price: 'Q48.00',
  unit: 'frasco',
  label: 'Natural',
  store: 'Apicultura del Norte',
  imageUrl: 'https://example.com/honey.jpg',
  onAdd: () {
    // Agregar al carrito
  },
)
```

### Grid de productos

`DripProductGrid` permite mostrar tarjetas en mosaico y cargar más productos al acercarse al final del scroll.

```dart
DripProductGrid(
  itemCount: products.length,
  cardMaxWidth: 220,
  childAspectRatio: 1,
  hasMore: hasMoreProducts,
  isLoadingMore: isLoading,
  onLoadMore: loadMoreProducts,
  itemBuilder: (context, index) {
    final product = products[index];

    return DripProductSquareCard(
      productName: product.name,
      price: product.price,
      unit: product.unit,
      label: product.label,
      store: product.store,
      showLabel: product.showLabel,
      showStore: product.showStore,
      imageUrl: product.imageUrl,
      onAdd: () => addToCart(product),
    );
  },
)
```

## Configuración del grid

Puedes controlar el tamaño de las cards de dos formas:

- `cardMaxWidth`: define un ancho objetivo de card y el grid calcula cuántas columnas caben.
- `crossAxisCount`: fija manualmente la cantidad de columnas.

Si defines `cardMaxWidth`, ese valor tiene prioridad para el layout.

Ejemplo:

```dart
DripProductGrid(
  itemCount: products.length,
  cardMaxWidth: 180,
  childAspectRatio: 0.95,
  itemBuilder: ...,
)
```

## Opciones de visibilidad

En las tarjetas puedes mostrar u ocultar:

- `label`
- `store`
- `showAddButton`

Ejemplo:

```dart
DripProductSquareCard(
  productName: 'Pan integral',
  price: 'Q14.00',
  unit: 'unidad',
  showLabel: false,
  showStore: true,
  onAdd: () {},
)
```

## Ejemplo completo

```dart
import 'package:flutter/material.dart';
import 'package:drip_ui/drip_ui.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'name': 'Queso fresco artesanal',
        'price': 'Q35.00',
        'unit': 'kg',
        'label': 'Nuevo',
        'store': 'Tienda Central',
      },
      {
        'name': 'Miel orgánica',
        'price': 'Q48.00',
        'unit': 'frasco',
        'label': 'Natural',
        'store': 'Apicultura del Norte',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DripProductGrid(
          itemCount: products.length,
          cardMaxWidth: 200,
          childAspectRatio: 1,
          itemBuilder: (context, index) {
            final product = products[index];

            return DripProductSquareCard(
              productName: product['name']!,
              price: product['price']!,
              unit: product['unit']!,
              label: product['label']!,
              store: product['store']!,
              onAdd: () {},
            );
          },
        ),
      ),
    );
  }
}
```

## Desarrollo local

Para ver los componentes en acción, abre el proyecto `example`:

```bash
cd example
flutter run
```

## Referencia de uso

Las tarjetas pueden ajustarse según el espacio disponible y el tipo de pantalla:

- `cardMaxWidth`: define un ancho objetivo de card y el grid calcula cuántas columnas caben.
- `crossAxisCount`: fija manualmente la cantidad de columnas.
- `label`, `store` y `showAddButton`: permiten mostrar u ocultar partes del contenido.

Si defines `cardMaxWidth`, ese valor tiene prioridad para el layout.

Ejemplos rápidos:

```dart
DripProductGrid(
  itemCount: products.length,
  cardMaxWidth: 180,
  childAspectRatio: 0.95,
  itemBuilder: ...,
)
```

```dart
DripProductSquareCard(
  productName: 'Pan integral',
  price: 'Q14.00',
  unit: 'unidad',
  showLabel: false,
  showStore: true,
  onAdd: () {},
)
```

## Soporte

Si el diseño de una card no encaja con tu caso, puedes ajustar:

- `borderRadius`
- `padding`
- `childAspectRatio`
- `cardMaxWidth`
- `crossAxisCount`