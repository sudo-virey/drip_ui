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