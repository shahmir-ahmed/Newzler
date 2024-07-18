import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/login/authentication_wrapper.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class ChooseLanguageView extends StatefulWidget {
  @override
  State<ChooseLanguageView> createState() => _ChooseLanguageViewState();
}

class _ChooseLanguageViewState extends State<ChooseLanguageView> {
  // const ChooseLanguageView({super.key});
  List<String> languagesList = <String>[
    'Language',
    'English',
    'Urdu',
    'French',
    'Hindi',
    '中国人',
    'Russian',
    'Punjabi',
    'German',
    'Spanish'
  ];

  String dropdownValue = '';

  bool showChooseLanguageError = false;

  // push login screen
  pushLoginScreen() {
    // push
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AuthenticationWrapper(
              backButton: true,
            )));
  }

  // pop and push login screen
  popAndPushLoginScreen() {
    // pop
    Navigator.pop(context);
    // push
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AuthenticationWrapper(backButton: false)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = languagesList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.whiteColor,
      body: _getBody(),
    );
  }

  // get body
  _getBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // space
            const SizedBox(
              height: 50.0,
            ),

            // image
            const Image(
                image: AssetImage(
                    'assets/images/choose-language-screen-banner.png')),

            // space
            const SizedBox(
              height: 30.0,
            ),

            // text
            Text(
              'Which language you prefer to read the news?',
              style: Utils.kAppPrimaryTextStyle.copyWith(
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),

            // space
            const SizedBox(
              height: 40.0,
            ),

            // dropdown
            Container(
              width: MediaQuery.of(context).size.width - 100,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Utils.lightGreyColor2),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Utils.whiteColor,
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.arrow_circle_down_outlined,
                    size: 35.0,
                  ),
                  // elevation: 16,
                  style: Utils.kAppPrimaryTextStyle.copyWith(
                      color: Utils.kAppPrimaryColor,
                      fontWeight: FontWeight.w800),
                  underline: Container(
                    height: 0.0,
                  ),
                  isExpanded: true,
                  // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                      // if language option is not selected again then remove error
                      if (dropdownValue != languagesList[0]) {
                        showChooseLanguageError = false;
                      }
                    });
                  },
                  items: languagesList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            showChooseLanguageError
                ? const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Language is required',
                          style: TextStyle(
                              color: Color.fromARGB(255, 183, 29, 18)),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),

            // space
            const SizedBox(
              height: 180.0,
            ),

            // buttons row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // skip button
                CustomButton(
                  secondaryButton: true,
                  onPressed: () {
                    popAndPushLoginScreen();
                  },
                  buttonText: 'Skip',
                  buttonHeight: 60,
                  buttonWidth: 150.0,
                ),

                // done button
                CustomButton(
                  primaryButton: true,
                  onPressed: () {
                    // if language not selected
                    if (dropdownValue == languagesList[0]) {
                      setState(() {
                        showChooseLanguageError = true;
                      });
                    } else {
                      setState(() {
                        showChooseLanguageError = false;
                      });
                      // push login screen
                      pushLoginScreen();
                    }
                  },
                  buttonText: 'Done',
                  buttonHeight: 60,
                  buttonWidth: 150.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
