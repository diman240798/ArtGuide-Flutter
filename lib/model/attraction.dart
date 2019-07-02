import 'attraction_type.dart';

class Place {
   final int id;
   final String title;
   final double latitude;
   final double longitude;
   final String imageSmall;
   final String  imageBig;
   final String description;
   final AttractionType type;

  Place(this.id, this.title, this.latitude, this.longitude, this.imageSmall, this.imageBig, this.description, this.type);

}