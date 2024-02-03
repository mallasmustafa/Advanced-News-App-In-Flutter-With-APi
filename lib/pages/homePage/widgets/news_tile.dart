import 'package:flutter/material.dart';
class NewsTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String time;
  final VoidCallback? onTap;
  const NewsTile({super.key, required this.imageUrl, required this.title, required this.author, required this.time, this.onTap});

  @override
  Widget build(BuildContext context) {

    DateTime? dateTime = DateTime.tryParse(time);
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:  Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color:  Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    scrollDirection:Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          radius: 12,
                        ),
                        const SizedBox(width: 10),
                         Text(author),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                   Text(
                    title,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    dateTime != null
                        ? "${dateTime.day}/${dateTime.month}/${dateTime.year}"
                        : "Invalid Date",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
