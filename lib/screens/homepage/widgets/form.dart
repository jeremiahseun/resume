import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mailto/mailto.dart';
import 'package:responsive_layout_builder/responsive_layout_builder.dart';
import 'package:resume/screens/homepage/phone/widgets/phone_button.dart';
import 'package:resume/screens/homepage/web/widgets/web_button.dart';
import 'package:resume/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomForm extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  CustomForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        defaultSize: LayoutSize.desktop,
        builder: (context, size) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Send me a message',
                    style: size.size == LayoutSize.desktop ||
                            size.orientation == Orientation.landscape
                        ? AppStyles.titleText(17)
                        : AppStyles.titleText(21)),
                const Gap(20),
                TextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 232, 230, 230),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                    )),
                const Gap(20),
                TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 232, 230, 230),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                    )),
                const Gap(20),
                TextField(
                    controller: messageController,
                    minLines: size.size == LayoutSize.desktop ||
                            size.orientation == Orientation.landscape
                        ? 5
                        : 1,
                    maxLines: size.size == LayoutSize.desktop ||
                            size.orientation == Orientation.landscape
                        ? 9
                        : 5,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 232, 230, 230),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                    )),
                const Gap(30),
                size.size == LayoutSize.desktop ||
                        size.orientation == Orientation.landscape
                    ? WebButton(
                        onPressed: () async {
                          if (nameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              messageController.text.isNotEmpty) {
                            sendEmail(context);
                          } else {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    'Kindly fill up the blank spaces before sending.'),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text('Ok'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      )
                    : PhoneButton(
                        onPressed: () async {
                          if (nameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              messageController.text.isNotEmpty) {
                            sendEmail(context);
                          } else {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    'Kindly fill up the blank spaces before sending.'),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text('Ok'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
              ],
            ),
          );
        });
  }

  Future sendEmail(BuildContext context) async {
    final url = Mailto(
      to: [
        'seunjeremiah@gmail.com',
      ],
      subject:
          'A message from - ${nameController.text} - ${emailController.text}',
      body:
          'From:\n Name: ${nameController.text}\n Email: ${emailController.text}\n\n ${messageController.text}',
    ).toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text(
              'Could not send message at this time. Please try again later.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }
}
