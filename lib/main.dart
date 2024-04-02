import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'O primeiro app',
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> {
  int cont = 0;

  void decrementar() {
    setState(() {
      cont--;
    });
  }

  void incrementar() {
    setState(() {
      cont++;
    });
  }

  bool get isFull => cont == 50;
  bool get isEmpty => cont == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Texto 'Contador'
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Text(
              isEmpty
                  ? 'Nenhum aluno'
                  : isFull
                      ? 'Limite de alunos atingido!'
                      : 'Quantidade de alunos',
              style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.red : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Número do contador
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Text(
              cont.toString(),
              style: TextStyle(
                fontSize: 85,
                color: isFull ? Colors.red : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Espaçamento
          const SizedBox(height: 50),

          // Linha que contem os dois botões
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Primeiro botão na cor vermelha
              TextButton(
                onPressed: isEmpty ? null : decrementar,
                style: TextButton.styleFrom(
                  backgroundColor: isEmpty
                      ? const Color.fromARGB(255, 245, 151, 145)
                      : Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  minimumSize: const Size(100, 50),
                ),

                // Usando um icone no botão
                child: const Icon(
                  Icons.remove,
                  size: 30,
                ),
              ),

              // Espaçamento entre os botões
              const SizedBox(
                width: 80,
              ),

              // Segundo botão na cor verde
              TextButton(
                onPressed: isFull ? null : incrementar,
                style: TextButton.styleFrom(
                  backgroundColor: isFull
                      ? const Color.fromARGB(255, 146, 216, 169)
                      : Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  minimumSize: const Size(100, 50),
                ),

                // Usando um icone no botão
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
