// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(),
//       body:  Container(
//         width: screenSize.width,
//         height: screenSize.height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/img/goutham-krishna-h5wvMCdOV3w-unsplash.jpg'), // Replace with your image path
//             fit: BoxFit.cover, // This makes the image cover the entire container
//           ),
//         ),
//         // Optional: Add child widgets on top of the imag
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for SystemChrome

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    // For true fullscreen, hide the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    // Restore UI when disposing
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove AppBar completely for true full screen
      // Or make it transparent and extend body behind it
      extendBodyBehindAppBar: true, // Crucial for full screen under the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Optional: if you want an app bar but transparent
      ),
      body: Container(
        width: double.infinity, // Use infinity instead of screenSize
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/img/goutham-krishna-h5wvMCdOV3w-unsplash.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        // You can add child widgets here if needed
      ),
    );
  }
}

// Alternative implementation without AppBar for absolute fullscreen:
class FullScreenLoginPage extends StatefulWidget {
  const FullScreenLoginPage({super.key});

  @override
  State<FullScreenLoginPage> createState() => _FullScreenLoginPageState();
}

class _FullScreenLoginPageState extends State<FullScreenLoginPage> {
  @override
  void initState() {
    super.initState();
    // Hide status bar and navigation buttons
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    // Restore UI when navigating away
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
            ),
          ),
          // Background image taking full screen
          Image.asset(
            'assets/img/goutham-krishna-h5wvMCdOV3w-unsplash.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          // Your login form or other content can go here
          // Positioned or Center widgets to place content
        ],
      ),
    );
  }
}
