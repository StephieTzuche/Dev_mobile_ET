// ignore_for_file: deprecated_member_use

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/controllers/welcome_controller.dart';
//import 'package:flutter/services.dart';
//import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    WelcomeController _controllerWel = Get.put(WelcomeController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: new Text(
          "${_controllerWel.textPseudo}",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: kSecondaryColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: _controller.nexQuestion,
            child: Text("Ignorer"),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
