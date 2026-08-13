import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color(0xFFF4F4F4);
const kBlanco = Color(0xFFFFFFFF);
const kNegro = Color(0xFF171717);
const kGris = Color(0xFF777777);
const kBorde = Color(0xFFE2E2E2);
const kVerde = Color(0xFFC8F54E);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add money',
      theme: ThemeData(
        scaffoldBackgroundColor: kFondo,
        colorScheme: ColorScheme.fromSeed(seedColor: kVerde),
      ),
      home: const AddMoneyScreen(),
    );
  }
}

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: kBlanco,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: kBorde),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 18),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Add money',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 32),

                const Text(
                  'Select card',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 14),

                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 180,
                        child: tarjeta(
                          color: kVerde,
                          tipo: 'Debit card',
                          numero: '•••• 4568',
                          seleccionada: true,
                        ),
                      ),

                      const SizedBox(width: 12),

                      SizedBox(
                        width: 180,
                        child: tarjeta(
                          color: kNegro,
                          tipo: 'Credit card',
                          numero: '•••• 2478',
                          seleccionada: false,
                        ),
                      ),

                      const SizedBox(width: 12),

                      SizedBox(
                        width: 180,
                        child: tarjeta(
                          color: const Color(0xFF555555),
                          tipo: 'Another card',
                          numero: '•••• 8392',
                          seleccionada: false,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 34),

                const Text(
                  'Add money to Neobank',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 14),

                metodo(
                  icon: Icons.account_balance_wallet_outlined,
                  texto: 'Move your direct deposit',
                ),

                const SizedBox(height: 12),

                metodo(
                  icon: Icons.swap_horiz,
                  texto: 'Transfer from other banks',
                ),

                const SizedBox(height: 12),

                metodo(icon: Icons.apple, texto: 'Apple Pay'),

                const SizedBox(height: 12),

                metodo(
                  icon: Icons.credit_card_outlined,
                  texto: 'Debit / Credit Card',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget tarjeta({
  required Color color,
  required String tipo,
  required String numero,
  required bool seleccionada,
}) {
  return Container(
    height: 150,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              seleccionada ? Icons.check_circle : Icons.circle_outlined,
              size: 20,
              color: seleccionada ? kNegro : kBlanco,
            ),
            const Spacer(),
            Icon(Icons.contactless, color: seleccionada ? kNegro : kBlanco),
          ],
        ),

        const Spacer(),

        Text(
          tipo,
          style: TextStyle(
            fontSize: 12,
            color: seleccionada ? kNegro : kBlanco,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          numero,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: seleccionada ? kNegro : kBlanco,
          ),
        ),
      ],
    ),
  );
}

Widget metodo({required IconData icon, required String texto}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    decoration: BoxDecoration(
      color: kBlanco,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: kBorde),
    ),
    child: Row(
      children: [
        Icon(icon, size: 21, color: kNegro),

        const SizedBox(width: 14),

        Expanded(
          child: Text(
            texto,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),

        const Icon(Icons.chevron_right, color: kGris),
      ],
    ),
  );
}
