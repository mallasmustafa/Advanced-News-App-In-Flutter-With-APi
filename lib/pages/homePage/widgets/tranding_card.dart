import 'package:flutter/material.dart';
class TrandingCard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;
  const TrandingCard({super.key, required this.imageUrl, required this.tag, required this.time, required this.title, required this.author, required this.ontap});

  @override
  Widget build(BuildContext context) {
    DateTime? dateTime = DateTime.tryParse(time);
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(5),
        // height: 300,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              // width: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.background,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tag,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  dateTime != null
                      ? "${dateTime.day}/${dateTime.month}/${dateTime.year}"
                      : "Invalid Date",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const SizedBox(height: 5),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 15,
                ),
                const SizedBox(width: 10),
                 Flexible(child: Text(author)),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
