import 'dart:math';

import 'package:flutter/material.dart';

//imported
import 'package:body_mass_index/models/textmodel.dart';
import 'package:body_mass_index/widgets/appbar.dart';
import 'package:body_mass_index/widgets/gendercard.dart';
import 'package:body_mass_index/screens/result.dart';
import 'package:body_mass_index/widgets/custombutton.dart';
import 'package:get/get.dart';

//it is a global attribute to be accessible only in this page
//this variable referece to the weight
double _weightValue = 0;
int _heightValue = 0;

//it is a global attribute to be accessible only in this page
//this variable referece to the age
int _age = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //this variable check if the the user is male or not
  bool isMale = true;

  //a variable that stores the data of the gender selected by the user
  String genderSelected = "Male";
  int heightValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Body Mass Index"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 15.0, left: 15.0, right: 15.0, bottom: 7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  child: Row(
                    children: [
                      /////////////////////////////////GENDER SELECTION /////////////////////////////

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                            genderSelected = "Male";
                          });
                        },
                        child: GenderCard(
                          icon: Icons.male,
                          iconName: "Male",
                          color: isMale == true ? Colors.teal : Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                            genderSelected = "Female";
                          });
                        },
                        child: GenderCard(
                          icon: Icons.female,
                          iconName: "Female",
                          color: isMale == true ? Colors.blueGrey : Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /////////////////////////////////HEIGHT SELECTION ///////////////////////////////////
              const Expanded(
                child: HeightCard(),
              ),
              /////////////////////////////////WEIGHT AND AGE SELECTION /////////////////////////////

              Expanded(
                child: SizedBox(
                  child: Row(
                    children: const [
                      WeightCard(),
                      SizedBox(width: 20.0),
                      AgeCard(),
                    ],
                  ),
                ),
              ),

              /////////////////////////////////CALCULATION BUTTON /////////////////////////////

              CalculateButton(
                genderSelected: genderSelected,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeightCard extends StatefulWidget {
  const HeightCard({
    Key? key,
  }) : super(key: key);

  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Container(
          width: (MediaQuery.of(context).size.width) - 25,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Height",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              Text(
                "$_heightValue",
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              Slider(
                min: 0.0,
                max: 200.0,
                activeColor: Colors.teal,
                inactiveColor: Colors.grey.shade200,
                thumbColor: Colors.white,
                value: _heightValue.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _heightValue = value.toInt();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculateButton extends StatefulWidget {
  const CalculateButton({
    Key? key,
    required this.genderSelected,
  }) : super(key: key);

  final String genderSelected;

  @override
  State<CalculateButton> createState() => _CalculateButtonState();
}

class _CalculateButtonState extends State<CalculateButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: double.infinity,
        height: (MediaQuery.of(context).size.height) / 16,
        decoration: const BoxDecoration(
          color: Colors.teal,
        ),
        child: TextButton(
          onPressed: () {
            //calculating the result
            double _resultOfBMI = 0.0;

            _resultOfBMI = (_weightValue) / pow(_heightValue / 100, 2);

            Get.to(() => Result(
                result: _resultOfBMI,
                gender: widget.genderSelected,
                age: _age));
          },
          child: TextModel(text: "Calculate", color: Colors.white, size: 20.0),
        ),
      ),
    );
  }
}

class WeightCard extends StatefulWidget {
  const WeightCard({
    Key? key,
  }) : super(key: key);

  @override
  State<WeightCard> createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
//this function used to increment the count
  void incrementCount() {
    setState(() {
      _weightValue = _weightValue + 1;
    });
  }

//this function used to decrement the count
  void decrementCount() {
    setState(() {
      if (_weightValue <= 0) {
        _weightValue = 0;
      } else {
        _weightValue = _weightValue - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width) * 0.5 - 25,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextModel(text: "Weight", color: Colors.black, size: 25.0),
            const SizedBox(height: 15),
            TextModel(
                text: _weightValue.toString(), color: Colors.black, size: 25.0),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  type: "Weight",
                  icon: Icons.add,
                  buttonFunction: incrementCount,
                  nameFunction: "incrementCount",
                ),
                const SizedBox(width: 20),
                CustomButton(
                  type: "Weight",
                  icon: Icons.remove,
                  buttonFunction: decrementCount,
                  nameFunction: "decrementCount",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AgeCard extends StatefulWidget {
  const AgeCard({
    Key? key,
  }) : super(key: key);

  @override
  State<AgeCard> createState() => _AgeCardState();
}

class _AgeCardState extends State<AgeCard> {
//this function used to increment the count
  void incrementCount() {
    setState(() {
      _age = _age + 1;
    });
  }

//this function used to decrement the count
  void decrementCount() {
    setState(() {
      if (_age <= 0) {
        _age = 0;
      } else {
        _age = _age - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width) * 0.5 - 25,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextModel(text: "Age", color: Colors.black, size: 25.0),
            const SizedBox(height: 15),
            TextModel(text: _age.toString(), color: Colors.black, size: 25.0),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  type: "Age",
                  icon: Icons.add,
                  buttonFunction: incrementCount,
                  nameFunction: "incrementCount",
                ),
                const SizedBox(width: 20),
                CustomButton(
                  type: "Age",
                  icon: Icons.remove,
                  buttonFunction: decrementCount,
                  nameFunction: "decrementCount",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
