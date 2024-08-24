/*

Google Maps Flutter 

Overview of Google Map API Console

Map key Used In Project : AIzaSyAKbyY5pk-YOkK0wccchfzJhIZxclQiY10

We do have a controller for google map

Completer<GoogleMapController>_controller=Completer();

Implementaton :

onMapCreated: (GoogleMapController controller){
_controller.complete(controller as FutureOr<GoogleMap>?) ;
}

Types of maps 

maptype: Maptype.hybrid
maptype:Maptype.normal
maptype:Maptype.satellite
maptype:Maptype.terrain

we can also access our own location on Google Map Using..

myLocationEnable: true ,

Add Multiple Markers on Map

List<Marker>_marker=[];
List<Marker>_list=const [
Marker(
markerId:MarkerId("1"),
Position:LatLng(37.42796, -122.085)
), 
];

void initState(){
_marker.addAll(_list);
}

How to Conv lat/long Coordinates() to address

Flutter Geocoder package converts lat/long Coordinates to address and vice versa but Support older version

For Co-ordinate to address
onTap:()async{
final coordinates=new Coordinate(37.6992.72.72938);
var address=await Geocoder.local.findAddressFromCoordinates(coordinates)
 
var first=address.first;
print(first.feautureame.toString()+first.addressLine.toString());
}

From Address To Co-ordinates
onTap;(){
final query="1600 Amphiteatre Parkway , Mountain veiw",
var coordinates=Geocoder.local.findAddressFromQuery(query);
var second=coordinates.first;
}

Newer Method By Geocoding package
String staddress="";
List<Location> location=await locationFromAddress(" address here");

setState((){
staddress=
location.last.longitude.toString()+location.last.latitude.toString();
});

Get User Location and Show on marker with Address

we have to add some run time permission in our andriodManifest file in order to get location and we will use packer flutter geolocator package in pubspec yaml .

 Using floating Action Button after body: GoogleMap(); 

floatingActionButton=FloatingActionButton(
onpressed:()async{
getUserCurrentLocation().then((value){
print(value.lattitide.toString()+value.longitude.toString());
}):;  //Future Function  
}) 

Function Implementation

Future<Position> getUserCurrentLocation() async {
  await Geolocator.requestPermission().then((value) {}).onError((error, stackTrace) {
    print("Error: " + error.toString());
  });  
  return await Geolocator.getCurrentPosition();
}}

 Through this implementation we can get the user current location on terminal


*/ 