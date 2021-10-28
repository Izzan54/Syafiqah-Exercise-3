import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SignupPage extends StatefulWidget {
  String name = "";
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<SignupPage> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  String dropdownValue = 'Male';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30),
                    child: Text(
                      'Welcome to My Awesome App',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icon.png"))),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameInput,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailInput,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordInput,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: 
                  DropdownButton<String>(
    value: dropdownValue,
    icon: const Icon(Icons.arrow_downward),
    onChanged: (String? newValue) {
      setState(() {
        dropdownValue = newValue!;
      });
    },
    items: <String>['Male', 'Female']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  )
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      child: Text('Sign Up'),
                      onPressed: () async {
                        // ignore: unused_local_variable
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        // ignore: unused_local_variable
                        String? name = prefs.getString('name');
                        await prefs.setString('name', 'Some Value');
                       
                       final snackBar = SnackBar(
                            content: Text("$name have signed up successfully"),
                        action: SnackBarAction(label: "Undo", onPressed: (){

                        },),);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        print(nameInput.text);
                        print(emailInput.text);
                        print(passwordInput.text);
                      },
                    )),
              ],
            )));
  }
}
