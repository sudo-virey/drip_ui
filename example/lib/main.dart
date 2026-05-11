import 'package:flutter/material.dart';
import 'package:drip_ui/drip_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Configuración de Temas Dinámicos
      theme: ThemeData(
        brightness: Brightness.light,
        extensions: [DripTheme.light()],
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        extensions: [DripTheme.dark()],
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      ),
      themeMode: ThemeMode.system, 
      home: const AllInputsPage(),
    );
  }
}

class AllInputsPage extends StatefulWidget {
  const AllInputsPage({super.key});

  @override
  State<AllInputsPage> createState() => _AllInputsPageState();
}

class _AllInputsPageState extends State<AllInputsPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para capturar datos
  final _emailController = TextEditingController();
  final _searchController = TextEditingController();

  final List<_DemoProduct> _catalog = const [
    _DemoProduct(
      name: 'Queso fresco artesanal',
      price: 'Q35.00',
      unit: 'kg',
      label: 'Nuevo',
      store: 'Tienda Central',
      showLabel: true,
      showStore: true,
      accent: Color(0xFFB7F28C),
    ),
    _DemoProduct(
      name: 'Tomate orgánico',
      price: 'Q8.50',
      unit: 'lb',
      label: 'Oferta',
      store: 'Mercado del Valle',
      showLabel: true,
      showStore: false,
      accent: Color(0xFFF7C59F),
    ),
    _DemoProduct(
      name: 'Pan integral',
      price: 'Q14.00',
      unit: 'unidad',
      label: 'Top',
      store: 'Panadería Luna',
      showLabel: false,
      showStore: true,
      accent: Color(0xFFA8DADC),
    ),
    _DemoProduct(
      name: 'Miel de abeja',
      price: 'Q48.00',
      unit: 'frasco',
      label: 'Natural',
      store: 'Colmenas del Norte',
      showLabel: true,
      showStore: true,
      accent: Color(0xFFF4D35E),
    ),
    _DemoProduct(
      name: 'Café de altura',
      price: 'Q65.00',
      unit: 'bolsa',
      label: 'Popular',
      store: 'Tueste Local',
      showLabel: true,
      showStore: false,
      accent: Color(0xFFCDB4DB),
    ),
    _DemoProduct(
      name: 'Aguacate Hass',
      price: 'Q12.00',
      unit: 'unidad',
      label: 'Fresco',
      store: 'Huerta San Miguel',
      showLabel: false,
      showStore: true,
      accent: Color(0xFFA7D7C5),
    ),
    _DemoProduct(
      name: 'Granola artesanal',
      price: 'Q28.00',
      unit: 'bolsa',
      label: 'Nuevo',
      store: 'Casa Grano',
      showLabel: true,
      showStore: true,
      accent: Color(0xFFF6BD60),
    ),
  ];

  final List<_DemoProduct> _visibleProducts = [];
  bool _isLoadingMore = false;
  bool _hasMoreProducts = true;
  int _nextProductIndex = 0;

  @override
  void initState() {
    super.initState();
    _appendNextProducts();
  }

  Future<void> _appendNextProducts() async {
    if (_isLoadingMore || !_hasMoreProducts) {
      return;
    }

    setState(() {
      _isLoadingMore = true;
    });

    await Future<void>.delayed(const Duration(milliseconds: 700));

    final nextIndex = _nextProductIndex + 4;
    final nextBatch = _catalog.skip(_nextProductIndex).take(4).toList();

    setState(() {
      _visibleProducts.addAll(nextBatch);
      _nextProductIndex = nextIndex;
      _hasMoreProducts = _nextProductIndex < _catalog.length;
      _isLoadingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drip UI Kit"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: DripLogoContainer(size: 80)),
                const SizedBox(height: 30),
                
                const Text("AUTHENTICATION", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 15),
                DripEmailField(controller: _emailController),
                const SizedBox(height: 15),
                const DripPasswordField(),
                
                const SizedBox(height: 30),
                const Text("VERIFICATION (OTP)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 15),
                DripOTPField(
                  length: 4,
                  onCompleted: (code) => print("OTP Entered: $code"),
                ),
                
                const SizedBox(height: 30),
                const Text("COMMUNICATIONS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 15),
                const DripPhoneField(),
                const SizedBox(height: 15),
                DripSearchField(
                  controller: _searchController,
                  hintText: "Search in Drip...",
                ),

                const SizedBox(height: 40),
                const Text(
                  "PRODUCT GRID",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 760,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final cardMaxWidth = constraints.maxWidth >= 900
                          ? 220.0
                          : constraints.maxWidth >= 700
                              ? 200.0
                              : constraints.maxWidth >= 480
                                  ? 180.0
                                  : constraints.maxWidth * 0.9;

                      return DripProductGrid(
                        itemCount: _visibleProducts.length,
                        cardMaxWidth: cardMaxWidth,
                        childAspectRatio: 1,
                        hasMore: _hasMoreProducts,
                        isLoadingMore: _isLoadingMore,
                        onLoadMore: _appendNextProducts,
                        emptyWidget: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Text('No hay productos para mostrar'),
                        ),
                        itemBuilder: (context, index) {
                          final product = _visibleProducts[index];

                          return DripProductSquareCard(
                            productName: product.name,
                            price: product.price,
                            unit: product.unit,
                            label: product.label,
                            store: product.store,
                            showLabel: product.showLabel,
                            showStore: product.showStore,
                            image: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    product.accent,
                                    product.accent.withOpacity(0.65),
                                  ],
                                ),
                              ),
                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.black87,
                                size: 34,
                              ),
                            ),
                            onAdd: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Agregado: ${product.name}')),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 40),
                DripButton(
                  text: "VALIDATE ALL FIELDS",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("All fields are valid!")),
                      );
                    }
                  },
                  color: DripColors.lime,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DemoProduct {
  final String name;
  final String price;
  final String unit;
  final String label;
  final String store;
  final bool showLabel;
  final bool showStore;
  final Color accent;

  const _DemoProduct({
    required this.name,
    required this.price,
    required this.unit,
    required this.label,
    required this.store,
    required this.showLabel,
    required this.showStore,
    required this.accent,
  });
}