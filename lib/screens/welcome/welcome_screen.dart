import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/welcome_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WelcomeController _welcomeController = Get.put(WelcomeController());
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/image22resize.svg", fit: BoxFit.fill),
          SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex: 2),
                      Text(
                        "MyQuizzRevision",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(flex: 2),

                      Text("entrer un pseudo "),
                      //Spacer(),
                      TextField(
                        controller: _welcomeController.textFieldPseudo,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF0d0e54),
                            hintText: "Pseudo",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            )),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => _welcomeController.onTapCommencer(),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(kDefaultPadding * 0.5), //15
                          decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Text(
                            "Commencer",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  )))
        ],
      ),
    );
  }
}
