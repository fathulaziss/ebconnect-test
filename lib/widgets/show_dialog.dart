import 'package:ebconnect_test/services/navigation_service.dart';
import 'package:ebconnect_test/widgets/button_text.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToast(
  BuildContext context, {
  required String message,
  Color? backgroundColor,
  Color? textColor,
  int? gravity,
  int? duration,
}) {
  ToastContext().init(context);
  Toast.show(
    message,
    textStyle: TextStyle(color: textColor ?? Colors.white, fontSize: 10),
    backgroundColor: backgroundColor ?? const Color(0xAA000000),
    gravity: gravity ?? 0,
    duration: duration ?? 2,
  );
}

void showDialogCustom(
  BuildContext context, {
  String? title,
  TextStyle? titleStyle,
  TextAlign? titleAlign,
  required Widget content,
  List<Widget>? actions,
  EdgeInsets? titlePadding,
  EdgeInsets? actionPadding,
  EdgeInsets? contentPadding,
  MainAxisAlignment? actionsAlignment,
  bool? barrierDismissible,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible ?? false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titlePadding: titlePadding ?? const EdgeInsets.fromLTRB(24, 16, 24, 12),
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 24),
        actionsPadding:
            actionPadding ?? const EdgeInsets.fromLTRB(24, 12, 24, 16),
        insetPadding: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        titleTextStyle: titleStyle ?? const TextStyle(color: Colors.black),
        title: Text(title ?? '', textAlign: titleAlign ?? TextAlign.left),
        content: content,
        actionsAlignment: actionsAlignment,
        actions: actions,
      );
    },
  );
}

void showDialogInfo(
  BuildContext context, {
  required String title,
  required String desc,
  String? labelButton,
  Function()? onTap,
}) {
  showDialogCustom(
    context,
    title: title,
    content: Text(desc, style: const TextStyle(color: Colors.black)),
    actions: [
      ButtonText(
        label: labelButton ?? 'OK',
        labelStyle: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        onTap: () {
          if (onTap == null) {
            NavigationService.pop();
          } else {
            onTap();
            NavigationService.pop();
          }
        },
      ),
    ],
  );
}

void showDialogCheckIn(
  BuildContext context, {
  required String title,
  required String address,
  required double latitude,
  required double longitude,
  required String date,
  required String time,
  String? labelButton,
  Function()? onTap,
}) {
  showDialogCustom(
    context,
    title: title,
    titleStyle:
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    titleAlign: TextAlign.center,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
        Text(address, maxLines: 1, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Latitude',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$latitude',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Longitude',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$longitude',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    time,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ),
    actions: [
      ButtonText(
        label: labelButton ?? 'OK',
        labelStyle: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        onTap: () {
          if (onTap == null) {
            NavigationService.pop();
          } else {
            onTap();
            NavigationService.pop();
          }
        },
      ),
    ],
  );
}
