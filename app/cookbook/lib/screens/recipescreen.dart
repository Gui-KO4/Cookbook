import 'package:flutter/material.dart';
import '/Models/receita.dart';
import '/data/receitas.dart';

class Recipescreen extends StatefulWidget {
  const Recipescreen({super.key, required this.idReceita});

  final int idReceita;

  @override
  State<Recipescreen> createState() => _RecipescreenState();
}

class _RecipescreenState extends State<Recipescreen> {
  late Future<Receita> _receitaFuture;

  @override
  void initState() {
    super.initState();
    _receitaFuture = ReceitaService.fetchReceitaPorId(widget.idReceita);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F8F6),
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF0F382C)),
        title: const Text(
          'Detalhes da Receita',
          style: TextStyle(
            color: Color(0xFF0F382C),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Receita>(
        future: _receitaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF0F382C),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro: ${snapshot.error}',
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'Nenhum dado encontrado.',
                style: TextStyle(color: Color(0xFF5C6B64)),
              ),
            );
          }

          final receita = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                child: Text(
                  receita.titulo,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F382C),
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              if (receita.foto.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      receita.foto,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        width: double.infinity,
                        color: const Color(0xFFE8F2EC),
                        child: const Icon(
                          Icons.broken_image,
                          size: 80,
                          color: Color(0xFF0F382C),
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                child: Text(
                  receita.descricao,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF5C6B64),
                    height: 1.4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: const Color(0xFFE2E8E4)),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: Color(0xFF0F382C),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${receita.tempoPreparacao} min',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A2521),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: const Color(0xFFE2E8E4)),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.bar_chart,
                              size: 20,
                              color: Color(0xFF0F382C),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              receita.dificuldade,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A2521),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: const Color(0xFFE2E8E4)),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Autor',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF5C6B64),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'User',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A2521),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0, bottom: 4.0),
                child: Text(
                  'Ingredientes',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F382C),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                  itemCount: receita.ingredientes.length,
                  itemBuilder: (context, index) {
                    final ingrediente = receita.ingredientes[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: const Color(0xFFE2E8E4)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              ingrediente.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A2521),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F2EC),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              ingrediente.quantity.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F382C),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0, bottom: 4.0),
                child: Text(
                  'Passos',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F382C),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                  itemCount: receita.passos.length,
                  itemBuilder: (context, index) {
                    final passo = receita.passos[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: const Color(0xFFE2E8E4)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color(0xFF0F382C),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              passo,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1A2521),
                                height: 1.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}