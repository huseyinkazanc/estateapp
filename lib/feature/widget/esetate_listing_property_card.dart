import 'package:flutter/material.dart';

class EstateListingPropertyCard extends StatelessWidget {
  const EstateListingPropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/200/300'),
                fit: BoxFit.fill,
              ),
            ),
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Başlık'),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Text('Açıklama'),
                const SizedBox(height: 8.0),
                const Divider(),
                const SizedBox(height: 8.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(height: 4.0),
                        Text('Telefon'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.email),
                        SizedBox(height: 4.0),
                        Text('E-posta'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(height: 4.0),
                        Text('Konum'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
