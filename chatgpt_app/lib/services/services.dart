import 'package:chatgpt_app/drop_down.dart';
import 'package:chatgpt_app/text_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: TextWidget(
                    label: "Chosen Model:",
                    fontSize: 16,
                  )),
                  Flexible(
                    flex: 2,
                    child: ModelsDropDownWidget(),
                  )
                ],
              ),
            ),
          );
        });
  }
}
