import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZodiacActivity extends StatefulWidget {
  @override
  _ZodiacActivityState createState() => _ZodiacActivityState();
}

class _ZodiacActivityState extends State<ZodiacActivity> {
  DateTime selectedDate = DateTime.now();
  String zodiacResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'What is your Zodiac?',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: 'Boorsok',
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Lets Find Out!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'Boorsok',
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                buildDatePicker(),
                SizedBox(height: 20),
                buildFindZodiacButton(),
                SizedBox(height: 20),
                buildZodiacResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDatePicker() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              selectedDate = newDate;
            });
          },
        ),
      ),
    );
  }

  Widget buildFindZodiacButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          zodiacResult = getZodiacSign(selectedDate.day, selectedDate.month);
        });
      },
      child: Text(
        'Find my Zodiac',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontFamily: 'Boorsok',
          shadows: [
            Shadow(
              color: Colors.black,
              blurRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildZodiacResult() {
    return Text(
      'Your Zodiac Sign is: $zodiacResult',
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontFamily: 'Boorsok',
        shadows: [
          Shadow(
            color: Colors.black,
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
    );
  }

  String getZodiacSign(int day, int month) {
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return "Aquarius";
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return "Pisces";
    } else if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return "Aries";
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return "Taurus";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return "Gemini";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return "Cancer";
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return "Leo";
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return "Virgo";
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return "Libra";
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return "Scorpio";
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return "Sagittarius";
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return "Capricorn";
    }
    return "Invalid Date";
  }
}
