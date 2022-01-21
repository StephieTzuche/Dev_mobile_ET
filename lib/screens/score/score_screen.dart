import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/controllers/welcome_controller.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    WelcomeController _controllerWel = Get.put(WelcomeController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/image1resize.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 2),
              Spacer(flex: 2),
              Text(
                "${_controllerWel.textPseudo}",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kScoreColor),
              ),
              Spacer(),
              Text(
                "SCORE",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kScoreColor),
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kScoreColor),
              ),
              Spacer(flex: 2),
              InkWell(
                onTap: () => Get.to(WelcomeScreen()),
                child: Container(
                  width: 130,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(kDefaultPadding * 0.75), //15
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text(
                    "Retour",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
