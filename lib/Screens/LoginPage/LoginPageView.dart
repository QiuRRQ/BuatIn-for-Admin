import 'package:flutter/material.dart';
import 'package:admin/Models/LoginPageModel/LoginPageModel.dart';
import 'package:admin/Screens/RegisterPage/RegisterPageScreen.dart';


class LoginPageView extends LoginPageModel{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              height: 500.0,
              child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('assets/logo.jpeg', height: 100, width: 100,),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: "Email", prefixIcon: Icon(Icons.person)),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      TextFormField(
                        controller: password,
                        obscureText: !isShow,
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                                icon: Icon(isShow
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () => setShow())),
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: new RaisedButton(
                          onPressed: validateAndSubmit,//login,
                          color: Colors.blue,
                          child: Text("LOGIN", style: TextStyle(fontFamily: "Title", color: Colors.white, fontSize: 17),),
                        ),
                      ),//login
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new FlatButton(
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPageScreen(widget.auth))),
//                          onPressed: _makeError,
                              child: Text("Create an account", style: TextStyle(fontFamily: "Title", color: Colors.blue, fontSize: 17),)),
                          FlatButton(
                              onPressed: googleLogin,
//                          onPressed: _makeError,
                              child: Text("GMAIL LOGIN", style: TextStyle(fontFamily: "Title", color: Colors.blue, fontSize: 17),)),
                        ],
                      ),//register and Gmail Logon
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}