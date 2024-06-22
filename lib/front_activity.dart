import 'package:flutter/material.dart';
import 'check_activity.dart';
import 'zodiac_activity.dart';

class FrontActivity extends StatefulWidget {
  @override
  _FrontActivityState createState() => _FrontActivityState();
}

class _FrontActivityState extends State<FrontActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set scaffold background to transparent
      body: Stack(
        children: [
          // Background image using DecorationImage
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Navigation image positioned at the top with background from background.png
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/nav.png',
              fit: BoxFit.cover,
            ),
          ),
          // Main content wrapped in a Container to control layout
          Container(
            margin: EdgeInsets.only(top: 100), // Adjust top margin to position zodiacs belcow nav image
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: _buildZodiacWidgets(context),
                  ),
                ),
                SizedBox(height: 5),
                _buildButton(context, 'Check Compatibility', CheckActivity()),
                _buildButton(context, 'Find Your Zodiac Sign', ZodiacActivity()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildZodiacWidgets(BuildContext context) {
    List<String> zodiacs = [
      'Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo',
      'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'
    ];

    return zodiacs.map((zodiac) {
      return _buildZodiacTile(context, zodiac);
    }).toList();
  }

  Widget _buildZodiacTile(BuildContext context, String zodiac) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the size of the image dynamically based on screen width
    double imageSize = screenWidth / 5; // Adjust this ratio as per your design

    return GestureDetector(
      onTap: () {
        _showZodiacDefinitionDialog(context, zodiac);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/$zodiac.png',
            width: imageSize,
            height: imageSize,
          ),
          SizedBox(height: 8),
          Text(
            zodiac,
            style: TextStyle(
              fontFamily: 'Boorsok',
              color: Colors.white,
              fontSize: 16,
              shadows: [
                Shadow(
                  blurRadius: 1,
                  color: Colors.black,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildButton(BuildContext context, String text, Widget nextPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white, // Set the underline color here (white in this case)
                width: 1.0, // Underline thickness
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Boorsok',
              color: Colors.white,
              fontSize: 20,
              shadows: [
                Shadow(
                  blurRadius: 1,
                  color: Colors.black,
                  offset: Offset(2, 2),
                ),
              ],
              decoration: TextDecoration.none, // Remove underline from here
            ),
          ),
        ),
      ),
    );
  }

  void _showZodiacDefinitionDialog(BuildContext context, String zodiac) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          zodiac,
          style: TextStyle(
            fontFamily: 'Boorsok', // Set the desired font family here
          ),
        ),
        content: SingleChildScrollView(
          child: Text(
            _getZodiacDefinition(zodiac),
            textAlign: TextAlign.justify,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close',
              style: TextStyle(
                fontFamily: 'Boorsok', // Set the desired font family here
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }



  String _getZodiacDefinition(String zodiac) {
    switch (zodiac) {
      case 'Aries':
        return "`\n" +
            " Personality Traits of Aries:\n" +
            "1. Courageous and Adventurous: Aries are natural-born leaders who fearlessly venture into new territories. They thrive on challenges and are not afraid to take risks to achieve their goals.\n" +
            "2. Energetic and Dynamic: Known for their high energy levels, Aries approach life with enthusiasm and vitality. They are always on the go, seeking excitement and new experiences.\n" +
            "3. Independent: Aries value their independence and autonomy. They prefer to lead rather than follow and often excel in roles where they can make decisions and take initiative.\n" +
            "4. Assertive and Direct: Aries are straightforward and direct in their communication. They say what they mean and mean what they say, often preferring honesty over diplomacy.\n" +
            "5. Passionate: Whether it's pursuing a hobby, career, or relationship, Aries are deeply passionate individuals. They put their heart and soul into everything they do, which can make them inspiring and motivating to others.\n" +
            "6. Impulsive: Aries are known for their spontaneous nature. They act on instinct and are quick to make decisions, sometimes without fully considering the consequences.\n" +
            "7. Optimistic: Aries have a positive outlook on life and are naturally optimistic. They believe in their abilities to overcome challenges and often inspire others with their confidence.\n" +
            "8. Competitive: Aries thrive in competitive environments where they can showcase their skills and abilities. They enjoy challenges and strive to be the best in whatever they pursue.\n" +
            "\n" +
            " Relationships and Social Life:\n" +
            "- Friendship: Aries are loyal and supportive friends who enjoy spending time with like-minded individuals. They are generous with their time and energy and often take the lead in social settings.\n" +
            "- Romance: In relationships, Aries are passionate and attentive partners. They enjoy the thrill of the chase and value spontaneity and adventure in their romantic lives. However, they may need to learn patience and compromise to maintain long-term relationships.\n" +
            "- Family: Aries are protective and caring family members who take on a leadership role within their households. They are fiercely loyal to their loved ones and will go to great lengths to ensure their happiness and well-being.\n" +
            "\n" +
            " Career and Ambitions:\n" +
            "- Leadership Roles: Aries excel in leadership positions where they can take charge and make decisions independently. They thrive in fast-paced and challenging environments where their initiative and drive can shine.\n" +
            "- Entrepreneurship: Many Aries are drawn to entrepreneurship and startups because of their innovative ideas and risk-taking nature. They are not afraid to pursue unconventional paths to achieve success.\n" +
            "- Creative Professions: Aries are often creative individuals who excel in fields such as art, music, and design. Their passion and enthusiasm fuel their creativity and drive for excellence.\n" +
            "\n" +
            " In summary, Aries individuals are characterized by their courage, independence, and passion for life. They are natural leaders who thrive on challenges and enjoy pushing boundaries to achieve their goals. While their assertive nature can sometimes be seen as intimidating, it is their authenticity and zest for life that often draws others to them.";
      case 'Taurus':
        return " Personality Traits of Taurus:\n" +
            "1. Patient and Reliable: Taurus individuals are known for their steadfast nature. They approach life with patience and reliability, making them dependable in various situations.\n" +
            "2. Practical and Grounded: Taurus are practical beings who value stability and security. They prefer to build a solid foundation before embarking on new endeavors.\n" +
            "3. Sensual and Pleasure-seeking: Taurus have a deep appreciation for the pleasures of life, from luxurious comforts to delicious cuisine. They indulge their senses and enjoy the finer things in life.\n" +
            "4. Determined and Strong-willed: Once Taurus sets their sights on a goal, they are determined to achieve it. They possess strong willpower and can be incredibly persistent.\n" +
            "5. Loyal and Trustworthy: Taurus are fiercely loyal to their friends and loved ones. They prioritize trust and integrity in their relationships, making them reliable companions.\n" +
            "6. Stubborn and Fixed: Taurus can be stubborn at times, sticking to their beliefs and opinions even in the face of opposition. They are known for their strong convictions.\n" +
            "7. Practical and Methodical: Taurus approach tasks in a methodical manner, focusing on efficiency and tangible results. They are adept at managing resources and handling practical matters.\n" +
            "8. Earthy and Connected to Nature: Taurus have a deep connection to the Earth and its natural beauty. They find solace and rejuvenation in nature's tranquility.\n" +
            "\n" +
            "Relationships and Social Life:\n" +
            "- Friendship: Taurus are loyal and supportive friends who value long-term relationships. They cherish stability and reliability in their friendships and enjoy spending quality time with close companions.\n" +
            "- Romance: In relationships, Taurus are affectionate and devoted partners. They seek security and commitment in their romantic lives, prioritizing loyalty and trust.\n" +
            "- Family: Taurus are dedicated family members who prioritize the well-being and happiness of their loved ones. They provide a sense of stability and comfort within their households.\n" +
            "\n" +
            "Career and Ambitions:\n" +
            "- Stable Careers: Taurus excel in roles that offer stability and security. They are reliable workers who approach their tasks with diligence and practicality.\n" +
            "- Financial Management: Taurus are adept at managing finances and are often successful in careers related to banking, finance, or real estate.\n" +
            "- Creative Professions: Taurus have a creative side and may excel in artistic endeavors such as music, art, or design. They appreciate beauty and craftsmanship.\n" +
            "\n" +
            "In summary, Taurus individuals are characterized by their practicality, determination, and loyalty. They value stability and security in all aspects of life and are dedicated to achieving their goals with persistence and reliability.";
      case 'Gemini':
        return "Personality Traits of Gemini:\n" +
            "1. Adaptable and Versatile: Gemini are known for their ability to adapt to various situations and thrive in diverse environments. They are quick-witted and versatile in their approach to life.\n" +
            "2. Curious and Intellectual: Gemini possess a curious mind and a thirst for knowledge. They enjoy learning new things and exploring different perspectives.\n" +
            "3. Expressive and Communicative: Gemini are excellent communicators who excel in expressing their thoughts and ideas. They enjoy engaging in lively conversations and debates.\n" +
            "4. Social and Outgoing: Gemini are sociable beings who enjoy interacting with others. They have a wide circle of friends and acquaintances and thrive in social settings.\n" +
            "5. Inconsistent and Indecisive: Gemini can sometimes be indecisive and struggle with commitment. They may change their opinions or plans frequently.\n" +
            "6. Nervous and Restless: Gemini have a tendency to be restless and may find it challenging to relax or stay focused on one thing for too long.\n" +
            "7. Playful and Youthful: Gemini have a youthful spirit and enjoy having fun. They have a playful sense of humor and often bring a sense of lightness to their interactions.\n" +
            "8. Dual Nature: Gemini are symbolized by the Twins, representing their dual personality traits and ability to see both sides of a situation.\n" +
            "\n" +
            "                        Relationships and Social Life:\n" +
            "- Friendship: Gemini are friendly and approachable, making them popular among peers. They enjoy forming connections and engaging in intellectually stimulating conversations.\n" +
            "- Romance: In relationships, Gemini are charming and flirtatious partners. They enjoy the excitement of new relationships but may need to work on consistency and commitment.\n" +
            "- Family: Gemini value their family relationships and enjoy spending time with loved ones. They bring energy and enthusiasm to family gatherings and activities.\n" +
            "\n" +
            "Career and Ambitions:\n" +
            "- Versatile Careers: Gemini excel in professions that require flexibility and communication skills, such as journalism, sales, or teaching.\n" +
            "- Creative Professions: Gemini have a creative streak and may thrive in fields such as writing, media, or performing arts. They enjoy exploring new ideas and expressing themselves creatively.\n" +
            "\n" +
            "In summary, Gemini individuals are characterized by their adaptability, curiosity, and sociability. They have a dual nature that allows them to navigate various aspects of life with ease, though they may need to focus on consistency and decision-making to achieve their long-term goals.";
      case 'Cancer':
        return " Personality Traits of Cancer:\n" +
            "1. Nurturing and Compassionate: Cancer individuals are known for their caring and empathetic nature. They prioritize the well-being and happiness of others, often taking on a nurturing role.\n" +
            "2. Emotional and Sensitive: Cancer are deeply in tune with their emotions and the emotions of those around them. They are sensitive to their environment and value emotional connections.\n" +
            "3. Protective and Loyal: Cancer are fiercely loyal to their loved ones and will go to great lengths to protect them. They create a sense of security and stability within their relationships.\n" +
            "4. Intuitive and Empathetic: Cancer have a strong intuition and can empathize with others' feelings and experiences. They trust their gut instincts and often rely on their emotional intelligence.\n" +
            "5. Imaginative and Creative: Cancer possess a vivid imagination and enjoy expressing themselves creatively. They may excel in artistic pursuits or find fulfillment in hobbies that allow them to explore their creativity.\n" +
            "6. Moody and Temperamental: Cancer can experience mood swings and fluctuations in their emotions. They may be sensitive to changes in their surroundings or interpersonal dynamics.\n" +
            "7. Homely and Domestic: Cancer find comfort and solace in their home environment. They enjoy creating a nurturing space for themselves and their loved ones, prioritizing family and domestic life.\n" +
            "8. Tenacious and Persistent: Once Cancer sets their mind on a goal, they are determined to achieve it. They have a strong willpower and can overcome obstacles through persistence.\n" +
            "\n" +
            "Relationships and Social Life:\n" +
            "- Friendship: Cancer are loyal and supportive friends who value deep connections. They cherish friendships that offer emotional support and understanding.\n" +
            "- Romance: In relationships, Cancer are devoted and nurturing partners. They seek emotional security and intimacy, prioritizing loyalty and commitment.\n" +
            "- Family: Cancer place great importance on family bonds and traditions. They create a loving and supportive environment for their family members, often taking on caregiving roles.\n" +
            "\n" +
            "Career and Ambitions:\n" +
            "- Caring Professions: Cancer excel in professions that allow them to care for others, such as healthcare, counseling, or teaching.\n" +
            "- Creative Professions: Cancer's imaginative nature can lead them to thrive in artistic fields, such as writing, photography, or interior design.\n" +
            "- Entrepreneurship: Some Cancer individuals may succeed as entrepreneurs, particularly in ventures that cater to nurturing and caregiving needs.\n" +
            "\n" +
            "In summary, Cancer individuals are characterized by their nurturing nature, emotional depth, and strong family values. They are intuitive and empathetic, often creating supportive environments where others feel understood and cared for.";
      case 'Leo':
        return "Personality Traits of Leo:\n" +
            "1. Confident and Charismatic: Leo individuals exude confidence and charisma. They have a natural ability to lead and inspire others with their presence.\n" +
            "2. Generous and Warm-hearted: Leo are generous beings who enjoy showering their loved ones with love and affection. They have a big heart and are often seen as the life of the party.\n" +
            "3. Creative and Dramatic: Leo possess a creative flair and enjoy expressing themselves through various forms of art and entertainment. They have a theatrical side and enjoy being in the spotlight.\n" +
            "4. Loyal and Protective: Leo are fiercely loyal to their friends and family. They take pride in their relationships and will defend their loved ones fiercely.\n" +
            "5. Optimistic and Enthusiastic: Leo have a positive outlook on life and are naturally optimistic. They approach challenges with enthusiasm and inspire others with their upbeat attitude.\n" +
            "6. Arrogant and Stubborn: Leo can sometimes come across as arrogant due to their strong self-confidence. They may be stubborn in their beliefs and opinions.\n" +
            "7. Ambitious and Determined: Leo are driven by ambition and have a strong desire to succeed. They set high goals for themselves and work tirelessly to achieve them.\n" +
            "8. Proud and Regal: Leo have a regal bearing and take pride in their appearance and achievements. They enjoy being admired and recognized for their talents.\n" +
            "\n" +
            "Relationships and Social Life:\n" +
            "- Friendship: Leo are loyal and outgoing friends who enjoy being surrounded by people. They are generous with their time and resources, often taking the lead in social situations.\n" +
            "- Romance: In relationships, Leo are passionate and romantic partners. They enjoy grand gestures of love and appreciate being admired by their significant other.\n" +
            "- Family: Leo value their family ties and enjoy spending quality time with loved ones. They take on a protective role within their family unit and cherish traditions.\n" +
            "\n" +
            "Career and Ambitions:\n" +
            "- Leadership Roles: Leo excel in leadership positions where they can showcase their talents and charisma. They thrive in roles that allow them to take charge and make a positive impact.\n" +
            "- Creative Professions: Leo's artistic talents make them well-suited for careers in performing arts, fashion, or design. They enjoy expressing themselves creatively and thrive in dynamic environments.\n" +
            "- Entrepreneurship: Some Leo individuals may pursue entrepreneurship due to their ambitious nature and desire for independence. They are willing to take risks to achieve their goals.\n" +
            "\n" +
            "In summary, Leo individuals are characterized by their confidence, generosity, and creativity. They thrive in social settings and enjoy being the center of attention. While their strong personalities can sometimes lead to misunderstandings, it is their warmth and enthusiasm that often draw others to them.";
      case 'Virgo':
        return "Personality Traits of Virgo:\n" +
            "1. Analytical and Detail-Oriented: Virgo individuals have a sharp mind and pay attention to the smallest details. They excel in tasks that require precision and analytical thinking.\n" +
            "2. Practical and Hardworking: Virgo are practical beings who approach life with diligence and dedication. They are reliable workers who strive for excellence in everything they do.\n" +
            "3. Intelligent and Observant: Virgo possess keen intelligence and a knack for observing their surroundings. They enjoy learning and expanding their knowledge base.\n" +
            "4. Organized and Methodical: Virgo thrive in structured environments and prefer to have a clear plan of action. They are efficient at managing tasks and prioritize productivity.\n" +
            "5. Modest and Humble: Virgo are modest about their abilities and achievements. They prefer to let their work speak for itself rather than seeking attention or praise.\n" +
            "6. Perfectionist and Critical: Virgo have high standards for themselves and others. They may be critical of imperfections but strive to improve themselves and their surroundings.\n" +
            "7. Reserved and Practical: Virgo tend to be reserved in social settings and prefer meaningful conversations over small talk. They value practicality and logic in their interactions.\n" +
            "8. Health-Conscious: Virgo place importance on their health and well-being. They adopt healthy habits and may be interested in fitness or holistic wellness practices.\n" +
            "\n" +
            "Relationships and Social Life:\n" +
            "- Friendship: Virgo are loyal and supportive friends who offer practical advice and assistance. They value friendships based on trust and mutual respect.\n" +
            "- Romance: In relationships, Virgo are reliable and devoted partners. They appreciate stability and loyalty in their romantic lives, seeking practical solutions to relationship challenges.\n" +
            "- Family: Virgo prioritize family bonds and take on responsibilities within their family unit. They are attentive caregivers and enjoy creating a harmonious home environment.\n" +
            "\n" +
            "Career and Ambitions:\n" +
            "- Detail-Oriented Professions: Virgo excel in roles that require attention to detail, such as accounting, research, or quality control.\n" +
            "- Service-Oriented Professions: Virgo are compassionate and may thrive in caregiving professions such as nursing, social work, or counseling.\n" +
            "- Analytical Professions: Virgo's analytical skills make them well-suited for careers in science, technology, or data analysis. They enjoy solving complex problems and contributing to systematic improvements.\n" +
            "\n" +
            "In summary, Virgo individuals are characterized by their practicality, intelligence, and attention to detail. They excel in roles that require precision and analytical thinking, and they value loyalty and reliability in their relationships.";
      case 'Libra':
        return " Personality Traits of Libra:\n" +
            "1. Diplomatic and Charming: Libra individuals are known for their diplomatic nature and charm. They excel in situations that require mediation and strive to maintain harmony.\n" +
            "2. Social and People-Oriented: Libra are sociable beings who enjoy interacting with others. They have a wide circle of friends and value relationships based on mutual respect.\n" +
            "3. Fair-minded and Just: Libra have a strong sense of fairness and justice. They strive to make decisions that benefit everyone involved and advocate for equality.\n" +
            "4. Romantic and Idealistic: Libra are hopeless romantics who believe in love and partnerships. They appreciate beauty and seek balance and harmony in their relationships.\n" +
            "5. Indecisive and People-Pleasing: Libra can struggle with decision-making and may prioritize keeping others happy over their own needs. They may seek validation from others.\n" +
            "6. Cooperative and Team-Oriented: Libra work well in teams and value collaboration. They enjoy contributing to group efforts and fostering a supportive work environment.\n" +
            "7. Indulgent and Appreciative of Beauty: Libra have a deep appreciation for aesthetics and enjoy indulging in luxurious experiences. They seek beauty in their surroundings and relationships.\n" +
            "8. Peaceful and Avoids Conflict: Libra prefer to avoid conflict and seek peaceful resolutions. They strive to create a harmonious environment and may avoid confrontations.\n" +
            "\n" +
            "Relationships and Social Life:\n" +
            "- Friendship: Libra are loyal and supportive friends who enjoy spending time with their peers. They value friendships that are based on mutual understanding and shared interests.\n" +
            "- Romance: In relationships, Libra are romantic and attentive partners. They prioritize harmony and balance in their romantic lives, seeking to create a loving and nurturing partnership.\n" +
            "- Family: Libra value family traditions and enjoy creating a peaceful and harmonious home environment. They take on responsibilities within their family unit and prioritize familial bonds.\n" +
            "\n" +
            "Career and Ambitions:\n" +
            "- Mediation and Counseling: Libra excel in professions that require mediation, such as law, diplomacy, or counseling. They have a knack for resolving conflicts and finding common ground.\n" +
            "- Creative Professions: Libra's appreciation for beauty and aesthetics makes them well-suited for careers in art, design, or fashion. They enjoy expressing their creativity and creating visually appealing work.\n" +
            "- Service-Oriented Professions: Libra's desire to help others may lead them to careers in healthcare, social work, or nonprofit organizations. They are compassionate and enjoy making a positive impact on others.\n" +
            "\n" +
            "In summary, Libra individuals are characterized by their diplomatic nature, social charm, and appreciation for beauty and harmony. They excel in roles that require mediation and teamwork, and they prioritize creating balanced and harmonious relationships.";
      case 'Scorpio':
        return "Personality Traits of Scorpio:\n" +
            "1. Intense and Passionate: Scorpio individuals are known for their intense emotions and passionate nature. They approach life with depth and commitment.\n" +
            "2. Determined and Ambitious: Scorpio are driven by their ambitions and strive to achieve their goals with unwavering determination. They are willing to overcome obstacles to succeed.\n" +
            "3. Mysterious and Complex: Scorpio have an enigmatic personality that intrigues others. They may keep their true feelings and thoughts guarded, revealing them selectively.\n" +
            "4. Resourceful and Strategic: Scorpio possess a sharp mind and are adept at finding solutions to challenges. They approach problems with strategic thinking and resourcefulness.\n" +
            "5. Loyal and Protective: Scorpio are fiercely loyal to their loved ones and value trust and honesty in relationships. They are protective of those they care about.\n" +
            "6. Resilient and Transformational: Scorpio have the ability to undergo deep transformations and emerge stronger from life's challenges. They embrace change and growth.\n" +
            "7. Independent and Self-Sufficient: Scorpio value their independence and may prefer to work alone on certain tasks or projects. They are self-sufficient and capable of handling adversity.\n" +
            "8. Secretive and Suspicious: Scorpio may be secretive about their plans and motivations. They can be suspicious of others' intentions until trust is established.\n" +
            "\n" +
            "Relationships and Social Life:\n" +
            "- Friendship: Scorpio are loyal and trustworthy friends who value deep connections. They are selective about their friendships and prioritize honesty and loyalty.\n" +
            "- Romance: In relationships, Scorpio are intense and committed partners. They seek deep emotional connections and value loyalty and intimacy in their romantic lives.\n" +
            "- Family: Scorpio are dedicated family members who prioritize the well-being and happiness of their loved ones. They provide emotional support and protection within their family unit.\n" +
            "\n" +
            "Career and Ambitions:\n" +
            "- Leadership Roles: Scorpio excel in leadership positions where they can demonstrate their determination and strategic thinking. They thrive in challenging and transformative environments.\n" +
            "- Research and Investigation: Scorpio's analytical skills make them well-suited for careers in research, investigation, or forensic science. They enjoy delving deep into complex subjects.\n" +
            "- Creative Professions: Scorpio's intense emotions and depth of perception may lead them to excel in creative fields such as writing, art, or filmmaking. They bring a unique perspective to their work.\n" +
            "\n" +
            "In summary, Scorpio individuals are characterized by their intensity, determination, and depth. They thrive in roles that require resilience and strategic thinking, and they value deep emotional connections and loyalty in their relationships.";
      case 'Sagittarius':
        return " Personality Traits of Sagittarius:\n" +
            "1. Optimistic and Adventurous: Sagittarius individuals are known for their optimistic outlook and adventurous spirit. They approach life with enthusiasm and curiosity.\n" +
            "2. Independent and Free-spirited: Sagittarius value their freedom and independence. They enjoy exploring new ideas and experiences on their own terms.\n" +
            "3. Philosophical and Intellectual: Sagittarius have a deep interest in exploring philosophical ideas and expanding their intellectual horizons. They enjoy discussing big ideas and concepts.\n" +
            "4. Honest and Straightforward: Sagittarius are known for their honesty and directness. They speak their mind openly and value truthfulness in their interactions.\n" +
            "5. Generous and Friendly: Sagittarius are generous beings who enjoy helping others. They have a friendly and approachable demeanor that attracts people to them.\n" +
            "6. Impatient and Restless: Sagittarius can be impatient with routine and crave excitement and change. They may seek new challenges and experiences to satisfy their restless nature.\n" +
            "7. Commitment-averse: Sagittarius may struggle with commitment in relationships or projects. They value their independence and may fear being tied down.\n" +
            "8. Optimistic and Positive: Sagittarius maintain a positive attitude even in challenging situations. They believe in their ability to overcome obstacles and embrace life's adventures.\n" +
            "\n" +
            "Relationships and Social Life:\n" +
            "- Friendship: Sagittarius are friendly and outgoing friends who enjoy socializing and meeting new people. They value friendships based on shared interests and intellectual stimulation.\n" +
            "- Romance: In relationships, Sagittarius are spontaneous and fun-loving partners. They enjoy relationships that allow them to maintain their independence while exploring new experiences together.\n" +
            "- Family: Sagittarius value their family relationships and enjoy spending quality time with loved ones. They bring enthusiasm and positivity to family gatherings and activities.\n" +
            "\n" +
            "Career and Ambitions:\n" +
            "- Exploration and Travel: Sagittarius may excel in careers that involve travel, exploration, or international relations. They enjoy learning about different cultures and experiencing new environments.\n" +
            "- Teaching and Education: Sagittarius have a natural ability to inspire and educate others. They may thrive in roles that involve teaching, coaching, or mentoring.\n" +
            "- Entrepreneurship: Sagittarius may be drawn to entrepreneurship due to their adventurous spirit and innovative ideas. They are willing to take risks to pursue their passions.\n" +
            "\n" +
            "In summary, Sagittarius individuals are characterized by their optimism, independence, and love for adventure. They thrive in environments that allow them to explore new ideas and experiences, and they value honesty and intellectual stimulation in their relationships.";
      case 'Capricorn':
        return "Personality Traits of Capricorn:\n" +
            "\n" +
            "1. Disciplined and Responsible: Capricorns are known for their disciplined approach to life. They take their responsibilities seriously and are often seen as reliable and dependable individuals.\n" +
            "2. Ambitious and Determined: Capricorns are highly ambitious and have a strong desire to achieve their goals. They are willing to put in the hard work and dedication required to succeed.\n" +
            "3. Practical and Pragmatic: Capricorns are practical thinkers who value logic and realism. They focus on achievable goals and take a systematic approach to problem-solving.\n" +
            "4. Patient and Persevering: Capricorns possess a great deal of patience and perseverance. They understand that success takes time and are willing to stay the course even when faced with challenges.\n" +
            "5. Cautious and Conservative: Capricorns tend to be cautious and conservative in their approach. They prefer to evaluate risks carefully before making decisions and often avoid impulsive actions.\n" +
            "6. Self-Disciplined and Organized: Capricorns are known for their self-discipline and organizational skills. They thrive in structured environments and are excellent at managing their time and resources.\n" +
            "7. Reserved and Serious: Capricorns can be reserved and serious, often preferring to focus on their work and responsibilities rather than socializing. They value meaningful interactions over superficial ones.\n" +
            "8. Loyal and Trustworthy: Capricorns are loyal friends and partners who value honesty and integrity. They prioritize building trust in their relationships and are dependable allies.\n" +
            "Relationships and Social Life:\n" +
            "\n" +
            "Friendship: Capricorns are loyal and supportive friends who value long-term relationships. They prefer a small circle of close friends and enjoy meaningful conversations and activities.\n" +
            "Romance: In relationships, Capricorns are committed and dependable partners. They seek stability and security in their romantic lives and prioritize loyalty and mutual respect.\n" +
            "Family: Capricorns are dedicated family members who take on responsibilities within their households. They value family traditions and work hard to provide a stable and secure environment for their loved ones.\n" +
            "Career and Ambitions:\n" +
            "\n" +
            "Leadership Roles: Capricorns excel in leadership positions where they can utilize their organizational skills and work ethic. They thrive in roles that require strategic planning and long-term vision.\n" +
            "Finance and Management: Capricorns are well-suited for careers in finance, management, or law due to their practical nature and ability to handle complex tasks.\n" +
            "Entrepreneurship: Capricorns may pursue entrepreneurship, especially in ventures that require careful planning and long-term commitment. They are capable of building successful businesses from the ground up.\n" +
            "In summary, Capricorn individuals are characterized by their discipline, ambition, and practicality. They excel in roles that require responsibility and long-term commitment and value loyalty and stability in their relationships.\n" +
            "\n";
      case 'Aquarius':
        return "Personality Traits of Aquarius:\n" +
            "\n" +
            "1. Innovative and Original: Aquarians are known for their innovative and original thinking. They have a unique perspective on life and are often ahead of their time in their ideas and approaches.\n" +
            "2. Independent and Free-spirited: Aquarius individuals value their independence and freedom. They prefer to forge their own path and are not afraid to challenge conventional norms.\n" +
            "3. Humanitarian and Altruistic: Aquarians have a strong sense of social justice and are often driven by a desire to improve the world. They are compassionate and empathetic towards others.\n" +
            "4. Intellectual and Analytical: Aquarians are highly intellectual and enjoy engaging in deep and meaningful conversations. They have a keen interest in exploring new ideas and concepts.\n" +
            "5. Unconventional and Eccentric: Aquarians are often seen as unconventional and eccentric due to their unique outlook on life. They embrace individuality and are not afraid to stand out from the crowd.\n" +
            "6. Detached and Objective: Aquarians can be detached and objective in their approach to life. They prefer to analyze situations from a logical standpoint rather than being swayed by emotions.\n" +
            "7. Visionary and Forward-thinking: Aquarians have a visionary mindset and are always looking towards the future. They are driven by a desire to bring about positive change and innovation.\n" +
            "8. Social and Friendly: Aquarians are social beings who enjoy meeting new people and engaging in diverse social activities. They value friendships that offer intellectual stimulation and shared values.\n" +
            "Relationships and Social Life:\n" +
            "\n" +
            "Friendship: Aquarians are friendly and open-minded friends who enjoy connecting with others. They value friendships based on mutual respect and shared interests and often have a diverse social circle.\n" +
            "Romance: In relationships, Aquarians are independent and need space to maintain their individuality. They seek partners who share their values and can engage in intellectually stimulating conversations.\n" +
            "Family: Aquarians value their family relationships and enjoy spending time with their loved ones. They bring a sense of openness and innovation to family dynamics and are often seen as the ones who introduce new ideas and perspectives.\n" +
            "Career and Ambitions:\n" +
            "\n" +
            "Innovation and Technology: Aquarians excel in careers that involve innovation, technology, or research. They are drawn to fields that allow them to explore new ideas and contribute to societal progress.\n" +
            "Humanitarian Work: Aquarians may be drawn to humanitarian work or careers in social activism due to their strong sense of social justice and desire to make a positive impact.\n" +
            "Creative Professions: Aquarians have a creative streak and may thrive in careers such as writing, art, or design. They enjoy expressing their individuality and exploring new creative outlets.\n" +
            "In summary, Aquarius individuals are characterized by their innovation, independence, and humanitarian values. They excel in roles that allow them to explore new ideas and contribute to societal progress, and they value intellectual stimulation and independence in their relationships.";
      case 'Pisces':
        return "Personality Traits of Pisces:\n" +
            "\n" +
            "1. Empathetic and Compassionate: Pisces individuals are known for their deep empathy and compassion towards others. They are sensitive to the emotions of those around them and often go out of their way to help.\n" +
            "2. Imaginative and Creative: Pisces have a vivid imagination and a strong creative streak. They are often drawn to artistic pursuits and enjoy expressing themselves through various forms of art.\n" +
            "3. Intuitive and Spiritual: Pisces possess a strong intuition and are often in tune with their inner selves. They have a deep spiritual side and may be drawn to exploring metaphysical or mystical subjects.\n" +
            "4. Gentle and Nurturing: Pisces are gentle and nurturing individuals who create a sense of comfort and safety for those around them. They are supportive and often take on caregiving roles.\n" +
            "5. Adaptable and Flexible: Pisces are adaptable and can easily adjust to different situations. They are open to change and often go with the flow rather than resisting it.\n" +
            "6. Dreamy and Idealistic: Pisces have a tendency to be dreamy and idealistic, often seeing the world through a lens of what could be rather than what is. They have a strong sense of hope and optimism.\n" +
            "7. Sensitive and Emotional: Pisces are deeply sensitive and can be affected by the emotions and energies of their environment. They may need to retreat to recharge and protect their emotional well-being.\n" +
            "8. Selfless and Generous: Pisces are selfless and generous, often putting the needs of others before their own. They find fulfillment in helping and supporting others, sometimes to their own detriment.\n" +
            "Relationships and Social Life:\n" +
            "\n" +
            "Friendship: Pisces are loyal and compassionate friends who value deep connections. They are always there to offer a listening ear and emotional support, making them cherished companions.\n" +
            "Romance: In relationships, Pisces are loving and romantic partners. They seek deep emotional connections and are often willing to go to great lengths to nurture and maintain their relationships.\n" +
            "Family: Pisces are devoted family members who prioritize the well-being of their loved ones. They bring a sense of empathy and compassion to their family dynamics and often take on supportive roles.\n" +
            "Career and Ambitions:\n" +
            "\n" +
            "Caring Professions: Pisces excel in professions that allow them to care for others, such as healthcare, counseling, or social work. They are driven by a desire to make a positive impact on others' lives.\n" +
            "Creative Professions: Pisces' creativity makes them well-suited for careers in art, music, writing, or design. They enjoy exploring their imaginative ideas and bringing them to life.\n" +
            "Spiritual or Metaphysical Fields: Some Pisces may be drawn to careers in spiritual or metaphysical fields, such as astrology, healing, or counseling. They enjoy exploring the deeper aspects of life and offering guidance to others.\n" +
            "In summary, Pisces individuals are characterized by their empathy, creativity, and adaptability. They excel in roles that allow them to express their compassion and creativity, and they value deep emotional connections and nurturing relationships.\n" +
            "\n";
      default:
        return 'No definition found.';
    }
  }
}
