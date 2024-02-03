import 'package:flutter/material.dart';

import 'loading_container.dart';
class TrandingLoadingCard extends StatelessWidget {
  const TrandingLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          LoadingContainer(
              height: 200, width: MediaQuery.of(context).size.width),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoadingContainer(
                  height: 10,
                  width: MediaQuery.of(context).size.width / 4),
              LoadingContainer(
                  height: 10,
                  width: MediaQuery.of(context).size.width / 5),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LoadingContainer(
                height: 20,
                width: MediaQuery.of(context).size.width / 1.6,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LoadingContainer(
                  height: 20,
                  width: MediaQuery.of(context).size.width / 2-0.2),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 10),
              LoadingContainer(
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 10),
              LoadingContainer(
                  height: 20,
                  width: MediaQuery.of(context).size.width / 2),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
