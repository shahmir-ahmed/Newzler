import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class EditBirthdayView extends StatefulWidget {
  const EditBirthdayView({super.key});

  @override
  State<EditBirthdayView> createState() => _EditBirthdayViewState();
}

class _EditBirthdayViewState extends State<EditBirthdayView> {
  String date = '';
  String month = '';
  String year = '';

  List<String> monthsList = <String>[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<String> yearsList = <String>[
    // "1920",
    // "1921",
    // "1922",
    // "1923",
    // "1924",
    // "1925",
    // "1926",
    // "1927",
    // "1928",
    // "1929",
    // "1930",
    // "1931",
    // "1932",
    // "1933",
    // "1934",
    // "1935",
    // "1936",
    // "1937",
    // "1938",
    // "1939",
    // "1940",
    // "1941",
    // "1942",
    // "1943",
    // "1944",
    // "1945",
    // "1946",
    // "1947",
    // "1948",
    // "1949",
    // "1950",
    // "1951",
    // "1952",
    // "1953",
    // "1954",
    // "1955",
    // "1956",
    // "1957",
    // "1958",
    // "1959",
    "1960",
    "1961",
    "1962",
    "1963",
    "1964",
    "1965",
    "1966",
    "1967",
    "1968",
    "1969",
    "1970",
    "1971",
    "1972",
    "1973",
    "1974",
    "1975",
    "1976",
    "1977",
    "1978",
    "1979",
    "1980",
    "1981",
    "1982",
    "1983",
    "1984",
    "1985",
    "1986",
    "1987",
    "1988",
    "1989",
    "1990",
    "1991",
    "1992",
    "1993",
    "1994",
    "1995",
    "1996",
    "1997",
    "1998",
    "1999",
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024"
  ];

  List<String> datesList = <String>[
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = "08";
    month = "December";
    year = "1990";
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            'Your birthday',
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
                  'YOUR BIRTHDAY',
                  style: Utils.kAppPrimaryTextStyle
                      .copyWith(fontSize: 12.0, fontWeight: FontWeight.w800),
                ),
                // space
                SizedBox(
                  height: 10.0,
                ),

                // email form field
                Row(
                  children: [
                    Expanded(
                        child: DropdownButton<String>(
                      dropdownColor: Utils.whiteColor,
                      // alignment: AlignmentDirectional.center,
                      isExpanded: true,
                      value: date,
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
                          date = value!;
                        });
                      },
                      items: datesList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                    SizedBox(
                      width: 40.0,
                    ),
                    Expanded(
                        flex: 2,
                        child: DropdownButton<String>(
                          dropdownColor: Utils.whiteColor,
                          // alignment: AlignmentDirectional.center,
                          isExpanded: true,
                          value: month,
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
                              month = value!;
                            });
                          },
                          items: monthsList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                    SizedBox(
                      width: 30.0,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                      dropdownColor: Utils.whiteColor,
                      isExpanded: true,
                      value: year,
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
                          year = value!;
                        });
                      },
                      items: yearsList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                  ],
                ),
              ],
            ),
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
    );
  }
}
