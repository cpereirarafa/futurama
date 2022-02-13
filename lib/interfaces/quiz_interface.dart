import 'package:flutter/material.dart';
import 'package:futurama/strings/strings_en.dart';

import 'bottom_bar_interface.dart';

class QuizInterface extends StatefulWidget{

  @override
  _QuizInterfaceState createState() => _QuizInterfaceState();
}

class _QuizInterfaceState extends State<QuizInterface> {
/*
  final TextEditingController _mileageController = TextEditingController();
  final FocusNode _mileage = FocusNode();
  String _hint;
  int _leaderEmployeeId;
  List<LicencePlate> _licenceList;
  List<Presence> _activeEmployees;
*/
/*
  Future performAddVehicle() async {

    _activeEmployees.forEach((presenceLine){
      presenceLine.startDate = DateTime.now().millisecondsSinceEpoch;
      presenceLine.startKm = double.parse(_mileageController.text);
      presenceLine.registration = _hint;
      presenceLine.modifiedDate = DateTime.now().millisecondsSinceEpoch;
    });

    var employeeIterator = _activeEmployees.iterator;

    //while(employeeIterator.moveNext())
    //  _databaseHelper.updateEntry(Presence.presenceTable, employeeIterator.current);

    Navigator.pushNamedAndRemoveUntil(context, "/order_list_interface", (route) => false);
  }
*/
/*  initDB() async {
    //_licenceList = await _databaseHelper.getLicencePlateList();
    setState(() { });
  }
*/
/*  @override
  void initState() {
    super.initState();

    //_leaderEmployeeId = 0;
    //_hint = null;
    //_licenceList = List<String>();
    //_activeEmployees = List<Presence>();
    _mileageController.text = '0';

    //preferences.getEmployeeId().then((employeeId) => _leaderEmployeeId = int.parse(employeeId));

    initDB();
  }
*/
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(QUIZ_TITLE),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 7.5, 30, 30),
                      child: TextFormField(
                        focusNode: null,//_mileage,
                        controller: null,//_mileageController,
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        maxLength: 9,
                        decoration: InputDecoration(helperText: "cstInitialKm"),
                        textInputAction: TextInputAction.go,
                        onFieldSubmitted: (term){
                          //_mileage.unfocus();
                          //performAddVehicle();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              child: Text("cstContinue"),
              onPressed: null,
              shape: OutlineInputBorder(),
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarInterface(),
    );
  }
}
