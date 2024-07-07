import "package:flutter/material.dart";

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "History Page",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18, fontFamily: "Poppins"),
        ),
      ),
    );
  }
}
