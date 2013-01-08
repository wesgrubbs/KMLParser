/*
KML Parser
January, 2013
Wesley Grubbs (www.pitchinteractive.com)

KML Parser is a simple parsing tool for parsing KML geolocation data.

Dependencies:
- a KML file. You can download your history from Google Latitude or OpenPaths.css. 

The sample KML file in this project was exported from OpenPaths.css

*/
String   source = "sample.kml"; //Points to KML file
XML      kml; //Loaded KML file
XML      track;  //XML elements in KML file we're interested with when/lat/lon values

//Data values in KML
String when; //timestamp 
float lon; //longitude
float lat; //latitude
float alt; //altitude. If you're lucky, you'll use something that tracks altitude. If you're not, you'll need to query a separat API to get the alitude. I'll include this in a later version

void setup() {
   
   parseKML(); 
}

void parseKML() {
   kml = loadXML(source);
   track = kml.getChild("Document/Placemark/gx:Track");
   
   //length of array
   int len = track.getChildCount();
   String coords;
   float[] coordsArr;
   
   for( int i = 2; i < len; i++ ) { //skipping the first two elements because they are not needed and cause errors
     
     if( track.getChild(i).hasChildren()) { //make sure we're not looking at blank lines and Processing 2 handles whitespace strangely
        
        //let's get the "when" attrib first
        if( track.getChild(i).getName() == "when") {
          
          when = track.getChild(i).getContent();
          
        } else { //get lon/lat/alt values

           coords = track.getChild(i).getContent();
           coordsArr = float(split(coords, " "));
           
           lon = coordsArr[0];
           lat = coordsArr[1];
           alt = coordsArr[2];
           
        }
        
        //Now you have all relevant items from file so do your thing here.
        
        println("Location Point: when "+when+" | lon "+lon+" | lat "+lat+" | alt "+alt);
     }
     
   }
}

