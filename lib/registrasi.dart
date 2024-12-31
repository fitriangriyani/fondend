import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 350,
          color: const Color(0xFF105a3b),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              'assets/gambar/logo.jpg',
              width: 10,
              height: 10,
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildInputField('Email or Phone Number', _emailController),
            _buildInputField('Full name', _nameController),
            _buildInputField('Username', _usernameController),
            _buildInputField('Password', _passwordController, isPassword: true),
            SizedBox(height: 20),
            _buildSignUpButton(),
            _buildLoginRedirect(),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun TextField dan PasswordField
  Widget _buildInputField(String hint, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? _obscurePassword : false,
        decoration: _inputDecoration(hint).copyWith(
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field ini tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: () {
        if (_validateForm()) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Harap isi semua data terlebih dahulu")),
          );
        }
      },
      child: Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0A2518),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildLoginRedirect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Sudah punya akun?',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: const Text(
            'Log In',
            style: TextStyle(
              color: Color(0xFF1A7F5D),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
