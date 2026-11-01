import 'package:flutter/material.dart';

class SavedRecipeCard extends StatelessWidget {
  final String nome;
  final String descricao;
  final int tempo;
  final int rating;
  final String imgurl;

  const SavedRecipeCard({
    super.key,
    required this.nome,
    required this.descricao,
    required this.tempo,
    required this.rating,
    required this.imgurl,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: 400,
        height: 135,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(imgurl, fit: BoxFit.fill),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              nome,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.more_vert_outlined,
                              size: 20,
                              color: Color(0xFF0A3828),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      Text(
                        descricao,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
