import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color(0xFF0E120C);
const kSuperficie = Color(0xFF181E14);
const kBorde = Color(0xFF2A3222);
const kTexto = Color(0xFFF1F4EA);
const kMuted = Color(0xFF8F9C80);
const kLima = Color(0xFFC8F54E);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Organiza tu tiempo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kFondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kLima,
          brightness: Brightness.dark,
        ),
      ),
      home: const ElegirTareaScreen(),
    );
  }
}

class ElegirTareaScreen extends StatefulWidget {
  const ElegirTareaScreen({super.key});

  @override
  State<ElegirTareaScreen> createState() => _ElegirTareaScreenState();
}

class _ElegirTareaScreenState extends State<ElegirTareaScreen> {
  int? tareaSeleccionada;

  final List<String> tareas = [
    'Hacer tarea de la universidad',
    'Ordenar mi habitación',
    'Leer durante un rato',
    'Ayudar en el negocio familiar',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  const Text(
                    '¿Qué quieres completar?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kTexto,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Elige una sola tarea para enfocarte en ella.',
                    style: TextStyle(fontSize: 15, color: kMuted),
                  ),

                  const SizedBox(height: 32),

                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tareas.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final seleccionada = tareaSeleccionada == index;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            tareaSeleccionada = index;
                          });
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: kSuperficie,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: seleccionada ? kLima : kBorde,
                              width: seleccionada ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                seleccionada
                                    ? Icons.check_circle
                                    : Icons.circle_outlined,
                                color: seleccionada ? kLima : kMuted,
                                size: 24,
                              ),

                              const SizedBox(width: 14),

                              Expanded(
                                child: Text(
                                  tareas[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: kTexto,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: tareaSeleccionada == null
                          ? null
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Tarea seleccionada: '
                                    '${tareas[tareaSeleccionada!]}',
                                  ),
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kLima,
                        foregroundColor: Colors.black,
                        disabledBackgroundColor: kBorde,
                        disabledForegroundColor: kMuted,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Continuar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
