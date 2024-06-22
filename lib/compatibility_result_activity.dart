import 'package:flutter/material.dart';

import 'compatibility_logic.dart'; // Import your CompatibilityLogic class

class CompatibilityResultActivity extends StatefulWidget {
  final String userSign;
  final String partnerSign;

  CompatibilityResultActivity({
    required this.userSign,
    required this.partnerSign,
  });

  @override
  _CompatibilityResultActivityState createState() => _CompatibilityResultActivityState();
}

class _CompatibilityResultActivityState extends State<CompatibilityResultActivity> {
  @override
  Widget build(BuildContext context) {
    String compatibilityInsights = CompatibilityLogic.getCompatibilityInsights(widget.userSign, widget.partnerSign);
    int compatibilityScore = CompatibilityLogic.calculateCompatibility(widget.userSign, widget.partnerSign);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Compatibility Score',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: 'Boorsok',
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              Text(
                '$compatibilityScore',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: 'Boorsok',
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Text(
                'Compatibility Insights',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              Text(
                compatibilityInsights,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // Handle button press here
                  // For simplicity, simulate changing text color
                  setState(() {
                    // Change text color to black
                    // Simulate changing back after a delay
                    Future.delayed(Duration(milliseconds: 100), () {
                      // Change text color back to white
                    });
                  });
                  // Simulate sharing action
                  shareCompatibility();
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Boorsok',
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ).copyWith(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  'Share',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void shareCompatibility() {
    // Simulate sharing action
    String message = 'My compatibility with ${widget.partnerSign}: ${CompatibilityLogic.calculateCompatibility(widget.userSign, widget.partnerSign)}%';
    print('Sharing: $message');
    // Implement actual sharing functionality here
  }
}
