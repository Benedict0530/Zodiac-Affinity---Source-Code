import 'package:flutter/material.dart';
import 'compatibility_logic.dart';

class CheckActivity extends StatefulWidget {
  @override
  _CheckActivityState createState() => _CheckActivityState();
}

class _CheckActivityState extends State<CheckActivity> {
  TextEditingController userSignController = TextEditingController();
  TextEditingController partnerSignController = TextEditingController();
  String errorMessage = '';

  List<String> signs = [
    "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo",
    "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"
  ];

  final ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.black26,
    elevation: 3,
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Boorsok',
      shadows: [
        Shadow(
          blurRadius: 1,
          color: Colors.black,
          offset: Offset(2, 2),
        ),
      ],
    ),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/check_nav.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    children: [
                      AutoCompleteTextView(
                        controller: userSignController,
                        hintText: 'Enter your zodiac sign',
                        suggestions: signs,
                        onTap: () => showZodiacSignDialog(userSignController),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Image.asset(
                          'assets/check_nav.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Stack(
                    children: [
                      AutoCompleteTextView(
                        controller: partnerSignController,
                        hintText: 'Enter your partner\'s zodiac sign',
                        suggestions: signs,
                        onTap: () => showZodiacSignDialog(partnerSignController),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Image.asset(
                          'assets/check_nav.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        errorMessage = ''; // Clear previous error message
                      });
                      navigateToCompatibilityResult();
                    },
                    child: Text(
                      'Check Compatibility',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: customButtonStyle,
                  ),
                  if (errorMessage.isNotEmpty) ...{
                    SizedBox(height: 8),
                    Text(
                      errorMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  },
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showZodiacSignDialog(TextEditingController controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Your Zodiac Sign'),
        content: Container(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: signs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(signs[index]),
                onTap: () {
                  setState(() {
                    controller.text = signs[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void navigateToCompatibilityResult() {
    String userSign = userSignController.text.trim();
    String partnerSign = partnerSignController.text.trim();

    if (userSign.isEmpty || partnerSign.isEmpty) {
      setState(() {
        errorMessage = 'Please choose Zodiac sign for both you and your partner';
      });
      return;
    }

    if (!isValidZodiacSign(userSign) || !isValidZodiacSign(partnerSign)) {
      setState(() {
        errorMessage = '"Invalid Input" Please capitalize the first letter for valid Zodiac signs, such as Leo, to ensure correctness.';
      });
      return;
    }

    // Calculate compatibility and navigate to result activity
    int compatibilityScore = CompatibilityLogic.calculateCompatibility(userSign, partnerSign);
    String compatibilityInsight = CompatibilityLogic.getCompatibilityInsights(userSign, partnerSign);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompatibilityResultActivity(
          userSign: userSign,
          partnerSign: partnerSign,
          compatibilityScore: compatibilityScore,
          compatibilityInsight: compatibilityInsight,
        ),
      ),
    );
  }

  bool isValidZodiacSign(String sign) {
    return signs.contains(sign);
  }

  @override
  void dispose() {
    userSignController.dispose();
    partnerSignController.dispose();
    super.dispose();
  }
}

class CompatibilityResultActivity extends StatelessWidget {
  final String userSign;
  final String partnerSign;
  final int compatibilityScore;
  final String compatibilityInsight;

  CompatibilityResultActivity({
    required this.userSign,
    required this.partnerSign,
    required this.compatibilityScore,
    required this.compatibilityInsight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),  // Adjust the path as necessary
            fit: BoxFit.cover,  // You can change this to your liking
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Compatibility Result for $userSign and $partnerSign',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Boorsok',
                    color: Colors.white,
                    fontSize: 32,
                    shadows: [
                      Shadow(
                        blurRadius: 1,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Compatibility Score: $compatibilityScore',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  compatibilityInsight,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class AutoCompleteTextView extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final List<String> suggestions;
  final VoidCallback onTap;

  AutoCompleteTextView({
    required this.controller,
    required this.hintText,
    required this.suggestions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: onTap,
        ),
      ),
    );
  }
}
