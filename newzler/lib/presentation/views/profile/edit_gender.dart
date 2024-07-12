import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class EditGender extends StatefulWidget {
  const EditGender({super.key});

  @override
  State<EditGender> createState() => _EditBirthdayViewState();
}

class _EditBirthdayViewState extends State<EditGender> {
  String gender = '';

  List<String> gendersList = <String>[
    "Male",
    "Female",
    "Others",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gender = "Male";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getActionAppBar(() {
        Navigator.pop(context);
      }, () {}, null, null, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  _getBody(context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // title
          Text(
            'Your gender',
            style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 32),
          ),

          // space
          SizedBox(
            height: 30.0,
          ),

          // name label
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'YOUR GENDER',
                  style: Utils.kAppPrimaryTextStyle
                      .copyWith(fontSize: 12.0, fontWeight: FontWeight.w800),
                ),
                // space
                SizedBox(
                  height: 10.0,
                ),

                // email form field
                DropdownButton<String>(
                  dropdownColor: Utils.whiteColor,
                  // alignment: AlignmentDirectional.center,
                  isExpanded: true,
                  value: gender,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  // style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      gender = value!;
                    });
                  },
                  items:
                      gendersList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                // space
                SizedBox(
                  height: 20.0,
                ),

                // primary button update
                Center(
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    buttonHeight: 60,
                    buttonWidth: MediaQuery.of(context).size.width - 80,
                    buttonText: 'Update',
                    primaryButton: true,
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
