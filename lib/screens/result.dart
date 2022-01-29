import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.result, required this.gender, required this.age})
      : super(key: key);

  //check the gender
  final String gender;

  //the age
  final int age;

  //the result of the BMI
  final double result;

  //returning the text based on the result value
  String get resultPhrase {
    String resultOfText = '';

    if (result < 18.5) {
      resultOfText = "Underweight";
    } else if (result >= 18.5 && result < 24.9) {
      resultOfText = "Normal";
    } else if (result >= 25.0 && result < 29.9) {
      resultOfText = "Overweight";
    } else {
      resultOfText = "obese";
    }
    return resultOfText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          "Result",
          style:  Theme.of(context).textTheme.headline3,
        ),
      ),
      body: ElementsOfBody(gender: gender, result: result, resultPhrase: resultPhrase, age: age),
    );
  }
}

class ElementsOfBody extends StatelessWidget {
  const ElementsOfBody({
    Key? key,
    required this.gender,
    required this.result,
    required this.resultPhrase,
    required this.age,
  }) : super(key: key);

  final String gender;
  final double result;
  final String resultPhrase;
  final int age;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Gender: $gender",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "ٌResult: ${result.toStringAsFixed(1)}",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "Healthiness: " + resultPhrase,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Text(
              "Age: $age",
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
