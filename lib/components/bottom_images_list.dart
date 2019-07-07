
class BottomMenuItemImage {
  String usualPath;
  String chosenPath;

  BottomMenuItemImage({this.usualPath, this.chosenPath});
}

class BottomMenuImages {
  static List<BottomMenuItemImage> images = <BottomMenuItemImage>[
    BottomMenuItemImage(
        usualPath: 'images/item_museum.png',
        chosenPath: 'images/item_museum_chosen.png'),
    BottomMenuItemImage(
        usualPath: 'images/item_theatre.png',
        chosenPath: 'images/item_museum_chosen.png'),
    BottomMenuItemImage(
        usualPath: 'images/item_memorial.png',
        chosenPath: 'images/item_museum_chosen.png'),
    BottomMenuItemImage(
        usualPath: 'images/item_stadium.png',
        chosenPath: 'images/item_museum_chosen.png'),
    BottomMenuItemImage(
        usualPath: 'images/item_park.png',
        chosenPath: 'images/item_museum_chosen.png')
  ];
}