import 'package:art_guide_flutter/bloc/shared/wiki_details_current_bloc.dart';
import 'package:art_guide_flutter/components/app_bar.dart';
import 'package:art_guide_flutter/components/gif_guide.dart';
import 'package:art_guide_flutter/main/app_router.dart';
import 'package:art_guide_flutter/model/attraction.dart';
import 'package:art_guide_flutter/ui/colors.dart';
import 'package:art_guide_flutter/wiki_attr_details/tts_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:gif_ani/gif_ani.dart';
import 'package:provider/provider.dart';

class WikiDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WikiDetailsState();
  }
}

class WikiDetailsState extends State<WikiDetailsPage> {

  static final Map<bool, IconData> playIcons = {false: Icons.play_arrow, true: Icons.pause};

  bool isPlaying = false;
  TtsHelper ttsHelper;
  GifGuide gifGuide = GifGuide();

  @override
  void initState() {
    super.initState();
    ttsHelper = TtsHelper(() {
      setState(() {
        isPlaying = false;
        gifGuide.state.animationCtrl.stop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor:
          AppColors.colorGreenStatus, //or set color with: Color(0xFF0000FF)
    ));

    WikiDetailsSharedBloc detailsBloc =
        Provider.of<WikiDetailsSharedBloc>(context);

    Place place = detailsBloc.currentAttraction;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: MyAppBar(),
            backgroundColor: Colors.transparent,
            floating: true,
          ),
          SliverGroupBuilder(
              decoration: ShapeDecoration(
                image: DecorationImage(
                    image: AssetImage('images/main_map_graphic.png'),
                    fit: BoxFit.fill),
                shape: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.none,
                  width: 1,
                ),
              ),
              child: SliverList(
                  delegate: SliverChildListDelegate(
                      this.buildWidgets(context, place))))
        ],
      ),
    );
  }

  List<Widget> buildWidgets(BuildContext context, Place place) {
    int id = place.id;
    String description = place.description;
    String title = place.title;
    String imageBigPath = place.imageBig;

    var list = List<Widget>();

    list.add(Column(
      children: <Widget>[
        Image.asset(
          imageBigPath,
          width: MediaQuery.of(context).size.width * 0.95,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description, style: TextStyle(fontSize: 15)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: gifGuide),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                      shape: StadiumBorder(),
                      onPressed: () => onListenClicked(description),
                      color: AppColors.colorGreen,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 8.0),
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(playIcons[isPlaying],
                                  color: Colors.white, size: 20),
                            ),
                            Text("Послушать",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(30, 25))),
                      onPressed: () => onWikiPressed(context),
                      color: AppColors.colorGreen,
                      child: Row(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.arrow_back, color: Colors.white, size: 20),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("      WIKI      ",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        )
      ],
    ));
    return list;
  }

  void onWikiPressed(BuildContext context) =>
      Navigator.of(context).popAndPushNamed(AppRouter.WIKI_LIST_PAGE);

  void onListenClicked(String description) {
    bool isAnimating = gifGuide.state.animationCtrl.isAnimating;
    if (isAnimating) {
      gifGuide.state.animationCtrl.stop(canceled: true);
      ttsHelper.stop();
    } else {
      gifGuide.state.animationCtrl.repeat();
      ttsHelper.start(description);
    }
    setState(() {
      isPlaying = !isAnimating;
    });
  }
}

/////////////////////////////////////// Run Alone
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<WikiDetailsSharedBloc>(
        builder: (_) => WikiDetailsSharedBloc(),
        child: WikiDetailsPage(),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
