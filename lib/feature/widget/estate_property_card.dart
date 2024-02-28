import 'package:estate_flutter_app/feature/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EstatePropertyCard extends StatelessWidget {
  final Widget detailButton;
  const EstatePropertyCard({super.key, required this.detailButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Başlık',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text('12 Haziran 2024'),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/200/300'),
                  fit: BoxFit.fill,
                ),
              ),
              width: double.infinity, // Resmin genişliği ekran genişliğine kadar uzanacak
              height: 150.0, // Resmin sabit bir yüksekliği olacak
            ).paddingSymmetric(vertical: 8),
            const Text(
              'Başlık',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const Text(
              'AçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklamaAçıklama',
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            detailButton,
          ],
        ).paddingSymmetric(vertical: 24, horizontal: 16),
      ),
    );
  }
}
