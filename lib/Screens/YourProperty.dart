import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_swap/firebase/Resource/storage_methods.dart';
import 'package:uuid/uuid.dart';
import 'MultiStepForm.dart';
import 'PostalCodeWidget.dart';

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

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Your Address'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AddressWidget(),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Property Type & Bedrooms'),
          content: Container(
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
        ),
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: Text('Rent and feature'),
          content: SizedBox(
            height: 200, // or some other fixed height
            child: CheckboxListWidget(),
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
          title: Text('Select your landLord'),
          content: SizedBox(
            height: 200, // or some other fixed height
            child: LandLordsList(),
          ),
        ),
      ];
  StorageMehtods storageMehtods = StorageMehtods();

  void storePropertyForm() {
    String uniqueId = Uuid().v4();
    storageMehtods.storePropertyForm(
      pId: uniqueId,
      address: address,
      propertyType: propertyType,
      qualities: _checkedItems,
      description: _descriptionController.text,
      uid: FirebaseAuth.instance.currentUser!.uid,
      landLord: selectedItem,
    );
  }

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
                              builder: (context) => RequirementForm()));
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

//This is the list of the check boxe items:

List<String> _checkedItems = [];

class CheckboxListWidget extends StatefulWidget {
  CheckboxListWidget({Key? key}) : super(key: key);

  @override
  _CheckboxListWidgetState createState() => _CheckboxListWidgetState();
}

class _CheckboxListWidgetState extends State<CheckboxListWidget> {
  final List<String> _itemsList = [
    'Double Glaz',
    'Gardon',
    'Drive Way',
    'Conservatory',
    'Balcony',
    ' Single Garage',
    ' Double Garage',
    ' Gas Central Hearing',
    'Electric Heating',
    ' Oil Heating ',
    'Private Gardon',
    ' Communal Garden',
    ' Fast Internet',
    ' Disable/Mobility Adapted'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _itemsList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _itemsList[index];
        return CheckboxListTile(
          title: Text(item),
          value: _checkedItems.contains(item),
          onChanged: (bool? isChecked) {
            setState(() {
              if (isChecked ?? false) {
                _checkedItems.add(item);
              } else {
                _checkedItems.remove(item);
              }
            });
          },
        );
      },
    );
  }
}

String selectedItem = '';

class LandLordsList extends StatefulWidget {
  LandLordsList();

  @override
  _LandLordsListState createState() => _LandLordsListState();
}

class _LandLordsListState extends State<LandLordsList> {
  final List<String> _allItemsList = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grapes',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Plum',
    'Raspberry',
    'Strawberry',
    'Watermelon',
  ];

  List<String> _filteredItemsList = [];

  void _onItemSelect(String item) {
    setState(() {
      selectedItem = item;
    });
  }

  void _onSearchTextChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItemsList = List.from(_allItemsList);
      } else {
        _filteredItemsList = _allItemsList
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _onSearchTextChanged,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: _filteredItemsList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _filteredItemsList[index];
                  return ListTile(
                    title: Text(item),
                    onTap: () => _onItemSelect(item),
                    tileColor: selectedItem == item ? Colors.blue : null,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Step getStep() {
    return Step(
      title: Text('Select Item'),
      content: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _onSearchTextChanged,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItemsList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _filteredItemsList[index];
                return ListTile(
                  title: Text(item),
                  onTap: () => _onItemSelect(item),
                  tileColor: selectedItem == item ? Colors.blue : null,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Selected Item: $selectedItem',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
