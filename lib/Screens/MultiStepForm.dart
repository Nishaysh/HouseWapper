import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_swap/firebase/Provider/user_provider.dart';
import 'package:property_swap/firebase/Resource/requirement_form_methods.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'HomePage.dart';

class RequirementForm extends StatefulWidget {
  const RequirementForm({Key? key}) : super(key: key);

  @override
  State<RequirementForm> createState() => _RequirementFormState();
}

class _RequirementFormState extends State<RequirementForm> {
  int _activeStepIndex = 0;
  final _locationController = TextEditingController();
  final _propertyTypeController = TextEditingController();
  final _minBedroonNumController = TextEditingController();
  final _maxBedroonNumController = TextEditingController();
  final _rentTypeController = TextEditingController();
  final _rentAmountController = TextEditingController();
  String uniqueId = const Uuid().v4();

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Location'),
          content: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 0.7,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Area / Post Code',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Property Type'),
          content: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 0.7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _propertyTypeController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type Of Property',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Number of Bedrooms'),
          content: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 0.7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _minBedroonNumController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Min Bedrooms',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 0.7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _maxBedroonNumController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Max Bedrooms',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 3,
          title: const Text('Rent'),
          content: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 0.7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _rentTypeController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Weekly, Monthly',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 0.7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _rentAmountController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Amount',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ];

  //Logic to store form to firestore:

  final RequirementFormMethods _requirementFormMethods =
      RequirementFormMethods();

  void storeRequirementForm() {
    _requirementFormMethods.storeRequirementForm(
      rId: uniqueId,
      location: _locationController.text,
      propertyType: _propertyTypeController.text,
      minBedrooms: int.parse(_minBedroonNumController.text),
      maxBedrooms: int.parse(_maxBedroonNumController.text),
      uid: FirebaseAuth.instance.currentUser!.uid,
      rentType: _rentTypeController.text,
      rent: int.parse(_rentAmountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getUser;

    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: H * 0.02),
                const Text(
                  'You Are Looking For',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: H * 0.01),
                Stepper(
                  type: StepperType.vertical,
                  currentStep: _activeStepIndex,
                  steps: stepList(),
                  onStepContinue: () {
                    final isLastStep =
                        _activeStepIndex == stepList().length - 1;
                    if (isLastStep) {
                      storeRequirementForm();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else if (_activeStepIndex < (stepList().length - 1)) {
                      _activeStepIndex += 1;
                    }
                    setState(() {});
                  },
                  onStepTapped: (Step) =>
                      setState(() => _activeStepIndex = Step),
                  onStepCancel: () {
                    if (_activeStepIndex == 0) {
                      return;
                    }
                    _activeStepIndex -= 1;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
