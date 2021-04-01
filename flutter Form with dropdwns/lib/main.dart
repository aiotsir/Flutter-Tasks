//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'User Registration Form';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Color(0xff84FFFF),
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Colors.blueGrey,
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

//class HomePageState extends State<HomePage> {

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var passKey = GlobalKey<FormFieldState>();
  var pwd;
  var validateDob;
  TextEditingController dateCtl = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  String value = "";
  bool disabledropdown = true;
  List<DropdownMenuItem<String>> menuitems = List();
  String setCtry;

  final china = {
    "1": "Haikou",
    "2": "Hefei",
    "3": "Changsha",
    "4": "Changchun",
    "5": "Wuhan",
  };

  final sri = {
    "1": "Ampara",
    "2": "Badulla",
    "3": "Colombo",
    "4": "Galle",
    "5": "Jaffna",
  };

  final india = {
    "1": "Goa",
    "2": "Karnataka",
    "3": "Kerala",
    "4": "Punjab",
    "5": "Rajasthan",
  };

  final israel = {
    "1": "Beersheba",
    "2": "Haifa",
    "3": "Holon",
    "4": "Jerusalem",
    "5": "TelAviv",
  };

  final usa = {
    "1": "California",
    "2": "Indiana",
    "3": "Ohio",
    "4": "New York",
    "5": "Texas",
  };

  void populatechina() {
    for (String key in china.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: china[key],
        child: Center(
          child: Text(
            china[key],
          ),
        ),
      ));
    }
  }

  void populatesri() {
    for (String key in sri.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: sri[key],
        child: Center(
          child: Text(
            sri[key],
          ),
        ),
      ));
    }
  }

  void populateindia() {
    for (String key in india.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: india[key],
        child: Center(
          child: Text(
            india[key],
          ),
        ),
      ));
    }
  }

  void populateisrael() {
    for (String key in israel.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: israel[key],
        child: Center(
          child: Text(
            israel[key],
          ),
        ),
      ));
    }
  }

  void populateusa() {
    for (String key in usa.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: usa[key],
        child: Center(
          child: Text(
            usa[key],
          ),
        ),
      ));
    }
  }

  void valuechanged(_value) {
    if (_value == "China") {
      menuitems = [];
      populatechina();
    } else if (_value == "Srilanka") {
      menuitems = [];
      populatesri();
    } else if (_value == "India") {
      menuitems = [];
      populateindia();
    } else if (_value == "Israel") {
      menuitems = [];
      populateisrael();
    } else if (_value == "USA") {
      menuitems = [];
      populateusa();
    }
    setState(() {
      value = _value;
      disabledropdown = false;
      //_selectedCountry = _value;
      setCtry = _value;
      print(setCtry);
    });
  }

  void secondvaluechanged(_value) {
    setState(() {
      value = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value.isEmpty ||
                  RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'email'),
            validator: (value) {
              if (value.isEmpty ||
                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                return 'Enter a valid email id';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'User name'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your initials or nick name';
              }
              return null;
            },
          ),
          TextFormField(
            readOnly: true,
            controller: dateCtl,
            decoration: InputDecoration(
              labelText: "Date of birth",
              hintText: "Click/Tap here and insert your DOB",
            ),
            //validator: validateDob,
            //onSaved: (String val) {},
            onTap: () async {
              DateTime date = DateTime(1900);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));

              dateCtl.text = date.toIso8601String();
            },
          ),
          TextFormField(
            controller: _pass,
            key: passKey,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              //var pwd = value;
              if (value.isEmpty) {
                return 'Please enter a combination of letters, numbers and symbols';
              }
              return null;
            },
          ),
          TextFormField(
              controller: _confirmPass,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) return 'Empty';
                if (value != _pass.text) return 'Not Match';
                return null;
              }
              //_form.currentState.validate()
              ),
          TextFormField(
            decoration: InputDecoration(labelText: 'City'),
            validator: (value) {
              if (value.isEmpty ||
                  RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          DropdownButton<String>(
            items: [
              DropdownMenuItem<String>(
                  value: "China",
                  child: Center(
                    child: Text("China"),
                  )),
              DropdownMenuItem<String>(
                  value: "Srilanka",
                  child: Center(
                    child: Text("Srilanka"),
                  )),
              DropdownMenuItem<String>(
                  value: "India",
                  child: Center(
                    child: Text("India"),
                  )),
              DropdownMenuItem<String>(
                  value: "Israel",
                  child: Center(
                    child: Text("Israel"),
                  )),
              DropdownMenuItem<String>(
                  value: "USA",
                  child: Center(
                    child: Text("USA"),
                  )),
            ],
            onChanged: (_value) => valuechanged(_value),
            hint: Text("Select any Country"),
          ),
          Text(
            ("$setCtry"),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: DropdownButton<String>(
              items: menuitems,
              onChanged: disabledropdown
                  ? null
                  : (_value) => secondvaluechanged(_value),
              hint: Text("Select your State"),
              disabledHint: Text(
                "First Select your Country",
              ),
            ),
          ),
          Text(
            "$value",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Thank you, Check your email')));
                }
              },
              child: Text('Submit'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
