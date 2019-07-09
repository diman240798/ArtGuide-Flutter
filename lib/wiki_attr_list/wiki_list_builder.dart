import 'package:art_guide_flutter/bloc/shared/wiki_details_current_bloc.dart';
import 'package:art_guide_flutter/main/app_router.dart';
import 'package:art_guide_flutter/model/attraction.dart';
import 'package:art_guide_flutter/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WikiListBuilder {
  static List buildWikiCard(List<Place> attractions, BuildContext context) {

    List<Widget> result = List<Widget>();

    attractions.forEach((attraction) {
      String imagePath = attraction.imageSmall;
      String description = attraction.description;
      String title = attraction.title;
      int id = attraction.id;

    var card = Container(
        margin: EdgeInsets.only(bottom: 20, right: 20),
        height: 150,
        foregroundDecoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: new BorderRadius.only(
                bottomRight: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0))),
        child: Material(
          borderOnForeground: false,
          child: InkWell(
            splashColor: AppColors.colorGreen,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
            onTap: () => onCardClicked(context, attraction),
            child: Row(
              children: <Widget>[
                // ICON
                Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.fill,
                ),

                // TEXT
                Column(
                  children: <Widget>[
                    // TITLE
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40.0,
                        width: 200.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            title,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.body2,
                          ),
                        ),
                      ),
                    ),
                    // DESCRIPTION
                    SizedBox(
                        height: 30.0,
                        width: 220.0,
                        child: Text(description,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.body1)),
                    Container(
                      margin: EdgeInsets.only(top: 12.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: FlatButton(
                              shape: StadiumBorder(),
                              color: AppColors.colorGreen,
                              onPressed: () {},
                              child: Text('Show more',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'на карте',
                              style: TextStyle(
                                  color: AppColors.colorGreen,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Container(
                              child: Image.asset('images/build_road_red.png'),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
      result.add(card);
    });
    return result;
  }

  static onCardClicked(BuildContext context, Place attraction) {
    WikiDetailsSharedBloc detailsBloc = Provider.of<WikiDetailsSharedBloc>(context);
    detailsBloc.setCurrentAttraction(attraction);
    Navigator.of(context).pushNamed(AppRouter.WIKI_DETAILS_PAGE);
  }
}