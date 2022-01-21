import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // annimation de la bar de progression de temps pour chaque question

  AnimationController _animationController;
  Animation _animation;

  //pour pouvoir accéder à la variable hors de la classe
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnwsered => this._isAnswered;

  int _correctAns = 0;
  int get correctAns => this._correctAns;

  int _selectAns;
  int get selectAns => this._selectAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // elle est appellée immédiatement après que le widget soit allouer
  @override
  void onInit() {
    // la durée d'animation est de 60 secondes
    // donc le but est de remplir la bar en 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        // MAJ comme "setState"
        update();
      });
    // activation de l'animation
    _animationController.forward().whenComplete(nexQuestion);
    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectAns = selectedIndex;

    if (_correctAns == _selectAns) _numOfCorrectAns++;

    _animationController.stop();
    update();

    // si l'utilisateur ne selection aucaune reponse apres 3 s
    Future.delayed(Duration(seconds: 3), () {
      nexQuestion();
    });
  }

  void nexQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;

      // on passa a la page suivante
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // on met a jour la bar de progression de temps
      _animationController.reset();

      //on relance en suite la progression de la bar de temps
      _animationController.forward().whenComplete(nexQuestion);
    } else {
      Get.to(ScoresScreen());
    }

    // si on est a la dernière question, on bascule sur la page du score
  }

  void updateTheQuizNum(int index) {
    _questionNumber.value = index + 1;
  }
}
