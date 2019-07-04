import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_login/models/login_model.dart';
import 'package:flutter_login/service_locator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _model = locator<LoginModel>();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    this._usernameController.dispose();
    this._passController.dispose();
    super.dispose();
  }

  void _loginUser(BuildContext context) {
    if (_formKey.currentState.validate()) {
      this._model.login(_usernameController.text, _passController.text).then((_) {
        Navigator.of(context).pushReplacementNamed('/home');
      }).catchError((err) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(err.message)),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<LoginModel>(
      model: this._model,
      child: Scaffold(
          appBar: AppBar(title: Text('Login')),
          body: Column(
            children: <Widget>[
              Form(
                key: this._formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: this._usernameController,
                        decoration: InputDecoration(labelText: 'Username'),
                        validator: (value) => value.isEmpty ? '* Required' : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: this._passController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (value) => value.length < 6 ? '* Password must be atleast 6 letters' : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ScopedModelDescendant<LoginModel>(builder: (context, child, model) {
                        return model.isLoading
                            ? CircularProgressIndicator()
                            : RaisedButton(
                                child: Text('Login'),
                                onPressed: () => _loginUser(context),
                              );
                      }),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
