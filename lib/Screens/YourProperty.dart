import 'dart:ffi';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'MultiStepForm.dart';
import 'SignUp.dart';



class YourProperty extends StatefulWidget {
  const YourProperty({Key? key}): super (key: key);

  @override
  State<YourProperty> createState() => _MyPropertyState();
}

class _MyPropertyState extends State<YourProperty> {

  List Choice = ['House','Flate/Maisonate','Banglow'];
  int ChoiceIndex = 0;
    
  List Fetures  = ['Double Glaz','Gardon','Drive Way' ,'Conservatory', 'Balcony',' Single Garage',' Double Garage',' Gas Central Hearing','Electric Heating',' Oil Heating ','Private Gardon',' Communal Garden',' Fast Internet',' Disable/Mobility Adapted'];
  int FeturesIndex = 0;

   bool isSelected = false;
   int _activeStepIndex = 0;

  List<Step> stepList()=> [
    Step(
      state: _activeStepIndex<=0 ? StepState.editing: StepState.complete,
      isActive: _activeStepIndex >=0,

      title: const Text('Your Address'),
    content: Container(
      child:   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 0.7,
                            offset: const Offset(1,1),
                           color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextField(decoration: 
                          InputDecoration(
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
                          state: _activeStepIndex<=1 ? StepState.editing: StepState.complete,
                          isActive: _activeStepIndex >=1,

                          title: const Text('Property Type & Bedrooms'),
                        content: Container(
                          height: 150, 
                          child:  ListView.builder(
                                      itemCount: Choice.length,
                                      itemBuilder: (BuildContext context, int Index){
                                        return ChoiceChip(
                                          label: Text(Choice[Index]),
                                          selected: ChoiceIndex == Index,
                                          selectedColor: Colors.red[100],
                                          onSelected: (value){
                                            setState(() {
                                              ChoiceIndex = value ? Index :0;
                                            });
                                          },
                                          backgroundColor: Colors.blue[100],
                                        );
                                      },
                                      ),
                          ),
                        ),


                      Step(
                      state: _activeStepIndex<=2 ? StepState.editing: StepState.complete,
                      isActive: _activeStepIndex >=2,

                      title: const Text('Rent & Fetures'),
                      content:  Column(
                      mainAxisSize: MainAxisSize.min,
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
                                offset: const Offset(1,1),
                               color: Colors.grey.withOpacity(0.5),
                              ),
                            ],
                          ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: TextField(decoration: 
                              InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Weekly, Monthly',
                              
                              ),
                              ),
                            ),
                          ),
                      ),

                      SizedBox(height: 10),

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
                                offset: const Offset(1,1),
                               color: Colors.grey.withOpacity(0.5),
                              ),
                            ],
                          ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: TextField(
                               decoration: 
                                InputDecoration(
                                 border: InputBorder.none,
                                 hintText: 'Amount',
                                 ),
                               keyboardType: TextInputType.number,

                              ),
                            ),
                          ),
                      ),

                      SizedBox(height: 20),
                      

                      Container(
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue[900],
                          border: Border.all(),  
                        ),
                    
                        child: Text('Extra Fetures',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),

                       SizedBox(height: 10),

                      Container(
                      height: 250,
                      child:  ListView.builder(
                      itemCount: Fetures.length,
                      itemBuilder: (BuildContext context, int Index){
                        return ChoiceChip(
                          label: Text(Fetures[Index]),
                           selected: FeturesIndex == Index,
                           selectedColor: Colors.red[100],
                           onSelected: (value){
                            setState(() {
                              FeturesIndex = value ? Index :0;
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

     Step(
      state: _activeStepIndex<=3 ? StepState.editing: StepState.complete,
      isActive: _activeStepIndex >=3,

      title:const Text('Description'),
     content: Container(
      child:   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 0.7,
                            offset: const Offset(1,1),
                           color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                           decoration: 
                           const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Property Description',
                        
                              ),
                            ),
                            ),
                          ),
                          ),
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
           body:  SingleChildScrollView(
             child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                     SizedBox(height: H*0.02),
           
                    const Text('Your Property',
                     style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                     ),
                     ),
           
                     SizedBox(height: H*0.01),
           
                    Stepper(
                      type: StepperType.vertical,
                      currentStep: _activeStepIndex,
                      steps: stepList(),
                      onStepContinue: () {
                        final isLastStep = _activeStepIndex == stepList().length-1;
                      if (isLastStep){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MultiStepForm()));

                      }else if(_activeStepIndex <(stepList().length-1)){
                        _activeStepIndex +=1;
                        }
                        setState(() {  
                        });
                      },
                      
                      onStepTapped: (Step) => setState(() => _activeStepIndex = Step),
           
                      onStepCancel:(){
                       if(_activeStepIndex == 0 ){
                       return;
                        }
                         _activeStepIndex -=1;
                        setState(() {
               });
             } ,
            ),
          ],
         ),
       ),
      ),   
    );
  }
}