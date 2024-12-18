import 'package:fathy/hello.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailError = '';
  String gender = 'Male';
  int age = 22;
  bool receiveNotifications = false;

  final List<String> genderOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // خلفية زرقاء فاتحة
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Name
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Last Name
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: Icon(Icons.person_outline, color: Colors.blue),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email, color: Colors.blue),
                  border: const OutlineInputBorder(),
                  errorText: emailError.isNotEmpty ? emailError : null,
                ),
                onChanged: (value) {
                  setState(() {
                    emailError =
                        value.contains('@') ? '' : 'Please enter a valid email';
                  });
                },
              ),
              const SizedBox(height: 20),

              // Password
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Gender Dropdown
              const Text('Gender:',
                  style: TextStyle(fontSize: 16, color: Colors.blue)),
              DropdownButtonFormField<String>(
                value: gender,
                items: genderOptions.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Select Gender',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Age Slider
              Text('Age: $age',
                  style: const TextStyle(fontSize: 16, color: Colors.blue)),
              Slider(
                value: age.toDouble(),
                min: 18,
                max: 100,
                divisions: 82,
                activeColor: Colors.blue,
                inactiveColor: Colors.blue[200],
                onChanged: (value) {
                  setState(() {
                    age = value.toInt();
                  });
                },
              ),
              const SizedBox(height: 20),

              // Receive Notifications Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Receive Notifications',
                      style: TextStyle(fontSize: 16, color: Colors.blue)),
                  Switch(
                    value: receiveNotifications,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        receiveNotifications = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add registration action here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignInPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
