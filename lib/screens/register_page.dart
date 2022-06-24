import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:signup/database/user_database.dart';
import 'package:signup/models/user.dart';
import 'package:signup/presenter/register_presenter.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    implements RegisterPageContract {
  BuildContext? _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  late String _username, _password;

  late RegisterPagePresenter _presenter;

  _RegisterPageState() {
    _presenter = new RegisterPagePresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form!.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doRegister(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState?.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    final height = MediaQuery.of(context).size.height;
    var registerBtn = new CupertinoButton(
        child: new Text("Register"),
        onPressed: _submit,
        color: Color.fromRGBO(0, 122, 253, 1));
    var loginBtn = new CupertinoButton(
        child: new Text(
          "Already have an account?",
          style: TextStyle(color: Color.fromRGBO(0, 122, 253, 1)),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/login");
        });
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              SizedBox(height: height * .05),
              Image.asset('lib/assets/logo.png', height: 300),
              SizedBox(height: 10),
              Text(
                'Create A New Account',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Text(
                'for JobTasker',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val!,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    fillColor: const Color(
                      0xfff3f3f4,
                    ),
                    filled: true,
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val!,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    fillColor: const Color(
                      0xfff3f3f4,
                    ),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
        registerBtn,
        loginBtn,
      ],
    );

    return new Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onRegisterError(String error) {
    // TODO: implement onLoginError
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onRegisterSuccess(User user) async {
    // TODO: implement onLoginSuccess
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;
    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    Navigator.of(context).pushNamed("/home");
  }
}
