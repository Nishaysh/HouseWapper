import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/firebase/Resource/PropertyFormMethod.dart';
import 'package:property_swap/firebase/Resource/storage_methods.dart';
import 'package:property_swap/firebase/utils/utils.dart';
import 'package:property_swap/widgets/bedroom_widgets.dart';
import 'package:property_swap/widgets/city_address.dart';
import 'package:property_swap/widgets/city_for_reqForm.dart';
import 'package:property_swap/widgets/rent_list.dart';
import 'package:uuid/uuid.dart';
import '../widgets/LandLordsListWidget.dart';
import '../widgets/RentAndFeaturesWidget.dart';
import 'MultiStepForm.dart';
import '../widgets/PostalCodeWidget.dart';
import 'package:image_picker/image_picker.dart';

String description = '';

class YourProperty extends StatefulWidget {
  const YourProperty({Key? key}) : super(key: key);

  @override
  State<YourProperty> createState() => _MyPropertyState();
}

class _MyPropertyState extends State<YourProperty> {
  List Choice = ['House', 'Flate/Maisonate', 'Banglow'];
  int ChoiceIndex = 0;
  int FeturesIndex = 0;
  String propertyType = '';
  bool isSelected = false;
  int _activeStepIndex = 0;
  final _descriptionController = TextEditingController();
  Uint8List? _image;

  void selectImage() async {
    List<int>? im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im as Uint8List?;
    });
  }

  Future<List<int>?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    try {
      XFile? file = await imagePicker.pickImage(source: source);
      if (file != null) {
        return await file.readAsBytes();
      } else {
        showSnackBar('No image file selected', context);
        return null;
      }
    } catch (e) {
      showSnackBar('Error picking image: $e', context);
      return null;
    }
  }

  StorageMehtods storageMehtods = StorageMehtods();
  final PropertyFormMethods _property = PropertyFormMethods();
  storePropertyForm() {
    String uniqueId = const Uuid().v4();

    _property.storePropertyForm(
      pId: uniqueId,
      address: formattedAddress,
      propertyType: propertyType,
      qualities: checkedItems,
      description: _descriptionController.text,
      uid: FirebaseAuth.instance.currentUser!.uid,
      landLord: selectedItem,
      file: _image!,
      beds: reqBedrooms,
      city: cityForAdd,
      rents: rent,
    );
  }

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Your Address'),
          content: const Padding(
            padding: EdgeInsets.all(8.0),
            child: AddressWidget(),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Property Type & Bedrooms'),
          content: Column(
            children: [
              Column(
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
                  Container(
                    decoration: BoxDecoration(border: Border.all()),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
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
                          numbers: const [
                            0,
                            1,
                            2,
                            3,
                            4,
                            5,
                            6,
                            7,
                            8,
                            9,
                            10,
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container()
            ],
          ),
        ),
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Rent and feature'),
          content: SizedBox(
            height: 200,
            child: RentAndFeatures(),
          ),
        ),
        Step(
          state: _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 3,
          title: const Text('Description'),
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
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Property Description',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Select your landLord'),
          content: SizedBox(
            height: 200, // or some other fixed height
            child: LandLordsList(),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: H * 0.02),
              const Text(
                'Your Property',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  // selectImage();
                  selectImage();
                },
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: AssetImage(
                              'img/3.jpeg',
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(height: H * 0.01),
              SingleChildScrollView(
                child: Stepper(
                  type: StepperType.vertical,
                  currentStep: _activeStepIndex,
                  steps: stepList(),
                  onStepContinue: () {
                    final isLastStep =
                        _activeStepIndex == stepList().length - 1;
                    if (isLastStep) {
                      storePropertyForm();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RequirementForm()));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
