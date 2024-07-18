import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class EditMobileBirthdayGenderCountryView extends StatefulWidget {
  EditMobileBirthdayGenderCountryView({required this.heading});

  String heading = '';

  @override
  State<EditMobileBirthdayGenderCountryView> createState() =>
      _EditMobileBirthdayGenderCountryViewState();
}

class _EditMobileBirthdayGenderCountryViewState
    extends State<EditMobileBirthdayGenderCountryView> {
  // edit birthday view data
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

  // edit gender view data
  String gender = '';

  List<String> gendersList = <String>[
    "Male",
    "Female",
    "Others",
  ];

  // edit country view data
  String country = '';

  List<String> countriesList = <String>[
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cape Verde",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Comoros",
    "Congo, Democratic Republic of the",
    "Congo, Republic of the",
    "Costa Rica",
    "Côte d'Ivoire",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia, Federated States of",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Korea",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "São Tomé and Príncipe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Korea",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syria",
    "Tajikistan",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United Republic of Tanzania",
    "United States of America",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela",
    "Viet Nam",
    "Yemen",
    "Zambia",
    "Zimbabwe"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // according to view initializing the relevant var
    if (widget.heading.contains('birthday')) {
      date = "08";
      month = "December";
      year = "1990";
    } else if (widget.heading.contains('gender')) {
      gender = "Male";
    } else if (widget.heading.contains('country')) {
      country = "India";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getActionAppBar(() {
        Navigator.pop(context);
      }, null, null, null, null),
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
          // heading
          Text(
            widget.heading,
            style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 32),
          ),

          // space
          const SizedBox(
            height: 30.0,
          ),

          // field label
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.heading.toUpperCase(),
                  style: Utils.kAppPrimaryTextStyle.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                // space
                const SizedBox(
                  height: 10.0,
                ),

                // mobile number form field
                widget.heading.contains('mobile number')
                    ? Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              initialValue: '+91',
                              style: Utils.kAppPrimaryTextStyle,
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                            width: 4.0,
                          ),
                          Expanded(
                            flex: 6,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: '1234567890',
                              style: Utils.kAppPrimaryTextStyle,
                            ),
                          ),
                        ],
                      )
                    : widget.heading.contains('birthday')
                        ? Row(
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
                                items: datesList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )),
                              const SizedBox(
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
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  )),
                              const SizedBox(
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
                                items: yearsList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )),
                            ],
                          )
                        : widget.heading.contains('gender')
                            ? DropdownButton<String>(
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
                                items: gendersList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )
                            : widget.heading.contains('country')
                                ? DropdownButton<String>(
                                    dropdownColor: Utils.whiteColor,
                                    // alignment: AlignmentDirectional.center,
                                    isExpanded: true,
                                    value: country,
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
                                        country = value!;
                                      });
                                    },
                                    items: countriesList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  )
                                : const SizedBox()
              ],
            ),
          ),

          // space
          const SizedBox(
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
