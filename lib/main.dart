import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
    debugShowCheckedModeBanner: false,
  ));
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List imglist = [
    "coco.png"
        "cono.png",
    "copa.png",
    "loro.png",
    "gato.png",
    "flamenco.png",
    "coco.png"
        "cono.png",
    "copa.png",
    "loro.png",
    "gato.png",
    "flamenco.png"
  ];

  List visiblelist = List.filled(12, true);

  int click = 1, pos1 = 0;
  String str1 = "", str2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pic_Match"),
      ),
      body: Center(
        child: Column(
          children: [
            Slider(
              value: s,
              min: 1,
              max: 6,
              onChanged: (value) {},
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  ),
              itemCount: imglist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (click == 1) {
                        print("first click");
                        visiblelist[index] = true;
                        str1 = imglist[index];
                        pos1 = index;
                        click = 2;
                      } else if (click == 2) {
                        print("second click");
                        visiblelist[index] = true;
                        str2 = imglist[index];
                        if (str1 == str2) {
                          print("match");
                        } else {
                          print("not match");
                          Future.delayed(Duration(milliseconds: 500))
                              .then((value) {
                            setState(() {
                              visiblelist[pos1] = false;
                              visiblelist[index] = false;
                            });
                          });
                        }
                        if (!visiblelist.contains(false)) {
                          print("win");
                        }
                        click == 1;
                      }
                    });
                  },
                  child: Visibility(
                    visible: visiblelist[index],
                    child: Container(height: 100,width: 100,
                      child: Image.asset("images/${imglist[index]}"),
                    ),
                    replacement: Container(height: 100,width: 100,
                      color: Colors.teal,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  double s = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    imglist.shuffle();
    get();
  }

  get() async {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(seconds: 3));
      setState(() {
        s++;

      });
    }
    setState(() {
      visiblelist = List.filled(12, false);
    });
  }

////////////////////////////////////////////

/*class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pic_Match"),),
      body: Column(
        children: [
          Slider(value: s, min: 1,max: 6,onChanged: (value) {

          },),
          Visibility(visible: v,child: Container(height: 100,
            width: 100,
            child: Image.asset("images/loro.png"),),
            replacement: Container(
              width: 100,
              height: 100,
              color: Colors.teal,
            ),)


        ],
      ),
    );
  }
  double s =1;
  bool v =true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  async {
    for(int i=1;i<=5;i++)
    {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        s++;
      });
    }
    v=false;


  }*/
}
