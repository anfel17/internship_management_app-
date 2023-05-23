import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/login/login_screen.dart';
import 'package:internship_management_system/screens/splash/allinonboardscreen.dart';
import 'package:internship_management_system/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/SplashScreen";
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin  {
  int currentIndex = 0;

  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
        "assets/images/intern1-removebg-preview.png",
        "Stay focused on your professional growth and let us handle the administrative details. Seamlessly navigate your internships and unlock new opportunities ",
        "Streamline your internship experience"),
    AllinOnboardModel(
        "assets/images/intern2-removebg-preview.png",
        "Track your academic progress effortlessly with Internify, Check your marks and attendance conveniently",
        "Stay organized and informed"),
    AllinOnboardModel(
        "assets/images/intern_11zon-removebg-preview_11zon.jpeg",
        "Say goodbye to complexities and uncertainties. Easily search and apply for internships in your desired field. Take control of your professional development.",
        "Find your dream internship"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
             Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Welcome to Internify",
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color:Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: allinonboardlist.length,
                  itemBuilder: (context, index) {
                    return PageBuilderWidget(
                      title: allinonboardlist[index].titlestr,
                      description: allinonboardlist[index].description,
                      imgurl: allinonboardlist[index].imgStr,
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                allinonboardlist.length,
                    (index) => buildDot(index: index),
              ),
            ),
          ),
          currentIndex < allinonboardlist.length - 1
              ? Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the right
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    padding: EdgeInsets.zero, // Remove default padding
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 136, 34),
                          Color.fromARGB(255, 255, 177, 41),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      "skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    width: 80,
                    padding: const EdgeInsets.all(16.0), // Add padding to the container
                  ),
                ),

              ],
            ),
          )
              : Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.2,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.routeName);
              },
              style: ButtonStyle( elevation: MaterialStateProperty.all(0), backgroundColor: MaterialStateProperty.all(Colors.transparent),),
              child:Container(
                alignment: Alignment.center,
                height: 50.0,
                width: size.width * 0.5,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 136, 34),
                          Color.fromARGB(255, 255, 177, 41)
                        ]
                    )
                ),
                child: Text("GET STARTED",style: TextStyle(color: Colors.white,fontSize: 14),),
                padding: const EdgeInsets.all(0),

              ),
            ),
          ),
        ],
      ),
    );


  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget(
      {Key? key,
        required this.title,
        required this.description,
        required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
          ),
          const SizedBox(
            height: 20,
          ),
          //Tite Text
          Text(title,
              textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color:Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //discription
          Text(description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
  }






