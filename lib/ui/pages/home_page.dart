import 'package:best_mentor_ui/model/category.dart';
import 'package:best_mentor_ui/shared/theme.dart';
import 'package:best_mentor_ui/ui/widgets/catergory_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var categorySelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categorySelected = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Note : Header
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          // Note: Photo
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/PICT1.png"),
                                )),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Good Morning,",
                                style: greyFontStyle.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              Text("Tubagus Adhitya P",
                                  style: whiteFontStyle.copyWith(
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/NOTIFICATION.png",
                        width: 18,
                      )
                    ],
                  ),
                ),

                // Note : Body
                Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: edgs, left: edgs, right: edgs, bottom: 12),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Find your favorite mentor",
                                        hintStyle: greyFontStyle,
                                        filled: true),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: orangeColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Icon(
                                Icons.search,
                                color: whiteColor,
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 12,
                      ),

                      // Note : List Category
                      Container(
                        height: 35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mockCategory.length,
                          itemBuilder: (context, index) {
                            return CategoryCardWidget(
                              category: mockCategory[index],
                              index: index,
                              isSelected:
                                  categorySelected == mockCategory[index].id,
                              onTap: () {
                                setState(() {
                                  categorySelected = mockCategory[index].id;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
