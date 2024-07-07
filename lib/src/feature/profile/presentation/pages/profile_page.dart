import "package:flutter/material.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile Page",
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
