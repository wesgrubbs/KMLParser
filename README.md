KMLParser
=========

A KML parser for Processing (processing.org). I tested with Google Latitude's KML exported file as well as the OpenPaths.cc KML file (the samle.kml file). No modifications are needed on the KML file, you just need to make sure you're pointing to the correct file. 

This is currently just a parser. There are not visual outputs other than the println statments you will see in your console the confirm the coordinates are there. You can do a lot from this point and you're more than welcome to :)

To Do's
=======
- Incorporate an altitude API to request the approximate altitude for any lon/lat coordinate that does not have an altitude (Google Latitude does not track altitude).

- Build a few examples for visual representations
