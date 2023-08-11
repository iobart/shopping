import 'package:flutter/material.dart';
import 'package:shopping/core/constansts/route_constanst.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/models/user_model.dart';
import 'package:shopping/ui/views/widgets/snackbar_alert.dart';

import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  final LoginViewModel _loginViewModel;

  LoginView({super.key, required LoginViewModel? loginViewModel})
      : _loginViewModel = loginViewModel ?? locator<LoginViewModel>();

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final _loginFormKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Login'),
      ),
      body: Center(
        child: Form(
          key: _loginFormKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                _buildEmailInput(),
                _buildPasswordInput(),
                _buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailInput() {
    return TextFormField(
      initialValue: _email,
      onChanged: _emailListener,
      decoration: const InputDecoration(
        hintText: 'Ingrese su email',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingrese su email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
      initialValue: _password,
      minLines: 1,
      maxLines: 2,
      obscureText: false,
      obscuringCharacter: '*',
      onChanged: _passwordListener,
      decoration: const InputDecoration(
        hintText: 'Ingrese su contraseña',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingrese su contraseña';
        }
        return null;
      },
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              _authUser();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Iniciando sesión...')),
              );
              // Aquí agregaría la lógica para iniciar sesión
            },
            child: const Text('Iniciar sesión'),
          ),
          ElevatedButton(
            onPressed: () {
              _registerUser();
            },
            child: const Text('Registrarse'),
          ),
        ],
      ),
    );
  }

  ///user to the [LoginViewModel] to register the user.
  Future<void> _registerUser() async {
    _hideKeyboard();
    if (_loginFormKey.currentState!.validate()) {
      final bool isUserRegister =
          await widget._loginViewModel.registerUser(_email, _password);
      isUserRegister ? _handleSuccesCreation() : _handleFailedLogIn();
    } else {
      _handleFailedLogIn();
    }
  }

  ///user to the [LoginViewModel] to auth the user.
  void _authUser() async {
    _hideKeyboard();
    if (_loginFormKey.currentState!.validate()) {
      final UserModel? loggedIn =
          await widget._loginViewModel.loginUser(_email, _password);
      if (loggedIn != null) {
        _handleSuccessLogIn();
      } else {
        _handleFailedLogIn();
      }
    }
  }

  void _handleSuccesCreation() {
    SnackBarFloating.show(
      context,
      'Usuario creado correctamente',
      type: TypeAlert.success,
    );
  }

  void _handleFailedLogIn() {
    SnackBarFloating.show(
      context,
      'Usuario o contraseña incorrectos',
      type: TypeAlert.error,
    );
  }

  /// Listens the changes of the password custom text field value[email].
  /// Assigns it to a local variable[_password].
  void _passwordListener(String password) {
    _password = password;
  }

  /// Listens the changes of the email custom text field value[email].
  /// Assigns it to a local variable[_email]
  void _emailListener(String email) {
    _email = email.trim();
  }

  /// Handles the success login logic
  void _handleSuccessLogIn() {
    Navigator.pushReplacementNamed(context, homeRoute);
  }

  ///Hide the keyboard if showed
  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
