import 'package:flutter/material.dart';

class StyledAlertDialog extends AlertDialog {
  const StyledAlertDialog(
      {Key? key, Widget? title, Widget? content, List<Widget>? actions})
      : super(
          key: key,
          title: title,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          content: content,
          buttonPadding: const EdgeInsets.all(10),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
          actions: actions,
        );
}
