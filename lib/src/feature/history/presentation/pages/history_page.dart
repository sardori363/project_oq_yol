import "package:flutter/material.dart";
import "../widget/history_page_widgets.dart";

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tarix",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 22, fontFamily: "Poppins"),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          children: <Widget>[
            Expanded(child: HistoryPassengerGenerator()),
          ],
        ),
      ),
    );
  }
}
