import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../../../common/utils/extensions/context_extensions.dart";

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme contextColor = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Qatnovlar",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 22, fontFamily: "Poppins"),
        ),
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}