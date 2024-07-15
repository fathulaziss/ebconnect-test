import 'package:ebconnect_test/widgets/photo_item.dart';
import 'package:ebconnect_test/widgets/preview_photo.dart';
import 'package:flutter/material.dart';

class RestoreTakePhoto extends StatelessWidget {
  const RestoreTakePhoto({
    super.key,
    required this.onPressed,
    required this.photos,
  });

  final Function()? onPressed;
  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '*Maximum 20 photos',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '*Maximum 1mb per photos',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 45),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: onPressed,
              child: const Text(
                'Take Photo',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
          ),
          if (photos.isNotEmpty)
            ...photos.map((e) {
              final index = photos.indexOf(e);
              return PhotoItem(
                label: "Photo ${index + 1}",
                imageName: e.split('/')[6],
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PreviewPhoto(imagePath: e);
                    },
                  );
                },
              );
            }),
        ],
      ),
    );
  }
}
