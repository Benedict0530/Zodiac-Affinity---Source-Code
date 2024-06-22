import 'dart:collection';

class CompatibilityLogic {
  static final Map<String, Map<String, int>> compatibilityMap = {
    "Aries": {
      "Aries": 80,
      "Taurus": 50,
      "Gemini": 70,
      "Cancer": 60,
      "Leo": 80,
      "Virgo": 50,
      "Libra": 70,
      "Scorpio": 60,
      "Sagittarius": 80,
      "Capricorn": 50,
      "Aquarius": 70,
      "Pisces": 60,
    },
    "Taurus": {
      "Aries": 50,
      "Taurus": 80,
      "Gemini": 60,
      "Cancer": 70,
      "Leo": 50,
      "Virgo": 80,
      "Libra": 50,
      "Scorpio": 60,
      "Sagittarius": 50,
      "Capricorn": 70,
      "Aquarius": 50,
      "Pisces": 60,
    },
    "Gemini": {
      "Aries": 70,
      "Taurus": 60,
      "Gemini": 80,
      "Cancer": 50,
      "Leo": 70,
      "Virgo": 60,
      "Libra": 80,
      "Scorpio": 50,
      "Sagittarius": 70,
      "Capricorn": 60,
      "Aquarius": 80,
      "Pisces": 50,
    },
    "Cancer": {
      "Aries": 60,
      "Taurus": 70,
      "Gemini": 50,
      "Cancer": 80,
      "Leo": 60,
      "Virgo": 40,
      "Libra": 60,
      "Scorpio": 70,
      "Sagittarius": 60,
      "Capricorn": 50,
      "Aquarius": 60,
      "Pisces": 70,
    },
    "Leo": {
      "Aries": 80,
      "Taurus": 50,
      "Gemini": 70,
      "Cancer": 60,
      "Leo": 80,
      "Virgo": 50,
      "Libra": 70,
      "Scorpio": 60,
      "Sagittarius": 80,
      "Capricorn": 50,
      "Aquarius": 70,
      "Pisces": 60,
    },
    "Virgo": {
      "Aries": 50,
      "Taurus": 80,
      "Gemini": 60,
      "Cancer": 40,
      "Leo": 50,
      "Virgo": 80,
      "Libra": 50,
      "Scorpio": 60,
      "Sagittarius": 50,
      "Capricorn": 70,
      "Aquarius": 50,
      "Pisces": 60,
    },
    "Libra": {
      "Aries": 70,
      "Taurus": 50,
      "Gemini": 80,
      "Cancer": 60,
      "Leo": 70,
      "Virgo": 50,
      "Libra": 80,
      "Scorpio": 70,
      "Sagittarius": 80,
      "Capricorn": 50,
      "Aquarius": 70,
      "Pisces": 60,
    },
    "Scorpio": {
      "Aries": 60,
      "Taurus": 60,
      "Gemini": 50,
      "Cancer": 70,
      "Leo": 60,
      "Virgo": 60,
      "Libra": 70,
      "Scorpio": 80,
      "Sagittarius": 60,
      "Capricorn": 60,
      "Aquarius": 70,
      "Pisces": 50,
    },
    "Sagittarius": {
      "Aries": 80,
      "Taurus": 50,
      "Gemini": 70,
      "Cancer": 60,
      "Leo": 80,
      "Virgo": 50,
      "Libra": 80,
      "Scorpio": 60,
      "Sagittarius": 80,
      "Capricorn": 50,
      "Aquarius": 70,
      "Pisces": 60,
    },
    "Capricorn": {
      "Aries": 50,
      "Taurus": 70,
      "Gemini": 60,
      "Cancer": 50,
      "Leo": 50,
      "Virgo": 70,
      "Libra": 50,
      "Scorpio": 60,
      "Sagittarius": 50,
      "Capricorn": 80,
      "Aquarius": 60,
      "Pisces": 70,
    },
    "Aquarius": {
      "Aries": 70,
      "Taurus": 50,
      "Gemini": 80,
      "Cancer": 60,
      "Leo": 70,
      "Virgo": 50,
      "Libra": 70,
      "Scorpio": 70,
      "Sagittarius": 70,
      "Capricorn": 60,
      "Aquarius": 80,
      "Pisces": 60,
    },
    "Pisces": {
      "Aries": 60,
      "Taurus": 60,
      "Gemini": 50,
      "Cancer": 70,
      "Leo": 60,
      "Virgo": 60,
      "Libra": 60,
      "Scorpio": 50,
      "Sagittarius": 60,
      "Capricorn": 70,
      "Aquarius": 60,
      "Pisces": 80,
    },
  };

  static int calculateCompatibility(String userSign, String partnerSign) {
    if (compatibilityMap.containsKey(userSign)) {
      Map<String, int> userCompatibility = compatibilityMap[userSign]!;
      if (userCompatibility.containsKey(partnerSign)) {
        return userCompatibility[partnerSign]!;
      }
    }
    return 0; // Default score if no match found
  }

  static String getCompatibilityInsights(String userSign, String partnerSign) {
    int compatibilityScore = calculateCompatibility(userSign, partnerSign);

    String userExplanation = getZodiacSignExplanation(userSign);
    String partnerExplanation = getZodiacSignExplanation(partnerSign);

    String insight;
    if (compatibilityScore >= 80) {
      insight = "You and $partnerSign are highly compatible! "
          "Your relationship is likely to be harmonious and fulfilling.\n\n"
          "About $userSign:\n$userExplanation\n\n"
          "About $partnerSign:\n$partnerExplanation";
    } else if (compatibilityScore >= 70) {
      insight = "You and $partnerSign have good compatibility. "
          "You complement each other well and share common interests.\n\n"
          "About $userSign:\n$userExplanation\n\n"
          "About $partnerSign:\n$partnerExplanation";
    } else if (compatibilityScore >= 60) {
      insight = "You and $partnerSign have moderate compatibility. "
          "Your relationship may require some compromise, but it can be rewarding.\n\n"
          "About $userSign:\n$userExplanation\n\n"
          "About $partnerSign:\n$partnerExplanation";
    } else if (compatibilityScore >= 50) {
      insight = "You and $partnerSign have fair compatibility. "
          "Building a strong relationship may take effort and understanding.\n\n"
          "About $userSign:\n$userExplanation\n\n"
          "About $partnerSign:\n$partnerExplanation";
    } else {
      insight = "You and $partnerSign have low compatibility. "
          "Your relationship might face challenges and require significant effort.\n\n"
          "About $userSign:\n$userExplanation\n\n"
          "About $partnerSign:\n$partnerExplanation";
    }

    return insight;
  }

  static String getZodiacSignExplanation(String sign) {
    switch (sign) {
      case "Aries":
        return "Aries is known for being energetic, adventurous, and enthusiastic.";
      case "Taurus":
        return "Taurus is known for being reliable, patient, and determined.";
      case "Gemini":
        return "Gemini is known for being curious, adaptable, and communicative.";
      case "Cancer":
        return "Cancer is known for being nurturing, empathetic, and protective.";
      case "Leo":
        return "Leo is known for being confident, generous, and charismatic.";
      case "Virgo":
        return "Virgo is known for being practical, diligent, and analytical.";
      case "Libra":
        return "Libra is known for being harmonious, diplomatic, and social.";
      case "Scorpio":
        return "Scorpio is known for being passionate, resourceful, and intense.";
      case "Sagittarius":
        return "Sagittarius is known for being optimistic, adventurous, and philosophical.";
      case "Capricorn":
        return "Capricorn is known for being responsible, disciplined, and ambitious.";
      case "Aquarius":
        return "Aquarius is known for being independent, inventive, and humanitarian.";
      case "Pisces":
        return "Pisces is known for being compassionate, artistic, and intuitive.";
      default:
        return "No information available.";
    }
  }
}