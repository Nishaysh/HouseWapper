import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/firebase/Provider/user_provider.dart';
import 'package:property_swap/firebase/Resource/requirement_form_methods.dart';
import 'package:property_swap/widgets/bedroom_widgets.dart';
import 'package:property_swap/widgets/city_for_reqForm.dart';
import 'package:property_swap/widgets/rentListForReqForm.dart';
import 'package:property_swap/widgets/rentTypeWidget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'HomePage.dart';

class RequirementForm extends StatefulWidget {
  const RequirementForm({Key? key}) : super(key: key);

  @override
  State<RequirementForm> createState() => _RequirementFormState();
}

class _RequirementFormState extends State<RequirementForm> {
  List Choice = ['House', 'Flate/Maisonate', 'Banglow'];
  String propertyType = '';
  int ChoiceIndex = 0;

  int _activeStepIndex = 0;
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
          content: CityListforReqForm(),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Property Type'),
          content: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: Choice.length,
                    itemBuilder: (BuildContext context, int Index) {
                      return ChoiceChip(
                        label: Text(Choice[Index]),
                        selected: ChoiceIndex == Index,
                        selectedColor: Colors.red[100],
                        onSelected: (value) {
                          setState(() {
                            propertyType = value ? Choice[Index] : "";

                            ChoiceIndex = value ? Index : 0;
                          });
                        },
                        backgroundColor: Colors.blue[100],
                      );
                    },
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Bed Rooms:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BedNumReqWidget(
                        numbers: const [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                      ),
                    ],
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
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text('Rent Type:'),
                  const SizedBox(
                    width: 110,
                  ),
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
                          child: RentTypeWidget(
                            rentType: const ['Weekly', 'Monthly'],
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Rent:'),
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
                          child: RentListReqFromWidget(
                            numbers: const [
                              0,
                              50,
                              100,
                              150,
                              200,
                              250,
                              300,
                              350,
                              400,
                              450,
                              500
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ];

  //Logic to store form to firestore:

  final RequirementFormMethods _requirementFormMethods =
      RequirementFormMethods();

  void storeRequirementForm() {
    _requirementFormMethods.storeRequirementForm(
      rId: uniqueId,
      location: cityForReqForm,
      propertyType: propertyType,
      bedrooms: reqBedrooms,

      // minBedrooms: 0,
      // maxBedrooms: 0,
      uid: FirebaseAuth.instance.currentUser!.uid,
      rentType: rentType,
      rent: rentType == 'Weekly' ? rentForReqForm * 4 : rentForReqForm,
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
