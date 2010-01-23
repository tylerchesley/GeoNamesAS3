package org.geonames.events
{
	import com.adobe.webapis.events.ServiceEvent;
	
	import flash.events.Event;

	/**
	 * The event that is broadcast when the results are loaded and parsed after a 
	 * call an GeoNames API call.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 *
	 */
	public class GeoNamesEvent extends ServiceEvent
	{
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to an astergdem API call.
		 * 
		 * @eventType astergdem
		 * 
		 * @see http://www.geonames.org/export/web-services.html#astergdem
		 */		
		public static const ASTERGDEM:String = "astergdem";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a children API call.
		 * 
		 * @eventType children
		 * 
		 * @see http://www.geonames.org/export/place-hierarchy.html#children
		 */
		public static const CHILDREN:String = "children";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a cities API call.
		 * 
		 * @eventType cities
		 * 
		 * @see http://www.geonames.org/export/JSON-webservices.html#citiesJSON
		 */
		public static const CITIES:String = "cities";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a countryCode API call.
		 * 
		 * @eventType countryCode
		 * 
		 * @see http://www.geonames.org/export/web-services.html#countrycode
		 */
		public static const COUNTRY_CODE:String = "countryCode";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a countryInfo API call.
		 * 
		 * @eventType countryInfo
		 * 
		 * @see http://www.geonames.org/export/web-services.html#countryInfo
		 */
		public static const COUNTRY_INFO:String = "countryInfo";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a countrySubdivision API call.
		 * 
		 * @eventType countrySubdivision
		 * 
		 * @see http://www.geonames.org/export/web-services.html#countrysubdiv
		 */
		public static const COUNTRY_SUBDIVISION:String = "countrySubdivision";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a extendedFindNearby API call.
		 * 
		 * @eventType extendedFindNearby
		 * 
		 * @see http://www.geonames.org/export/web-services.html#extendedFindNearby
		 */
		public static const EXTENDED_FIND_NEARBY:String = "extendedFindNearby";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a findNearby API call.
		 * 
		 * @eventType findNearby
		 * 
		 * @see http://www.geonames.org/export/web-services.html#findNearby
		 */
		public static const FIND_NEARBY:String = "findNearby";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to an findNearbyPlaceName API call.
		 * 
		 * @eventType findNearbyPlaceName
		 * 
		 * @see http://www.geonames.org/export/web-services.html#findNearbyPlaceName
		 */
		public static const FIND_NEARBY_PLACE_NAME:String = "findNearbyPlaceName";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a findNearbyPostalCodes API call.
		 * 
		 * @eventType findNearbyPostalCodes
		 * 
		 * @see http://www.geonames.org/export/web-services.html#findNearbyPostalCodes
		 */
		public static const FIND_NEARBY_POSTAL_CODES:String = "findNearbyPostalCodes";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a findNearbyStreets API call.
		 * 
		 * @eventType findNearbyStreets
		 * 
		 * @see http://www.geonames.org/maps/us-reverse-geocoder.html#findNearbyStreets
		 */
		public static const FIND_NEARBY_STREETS:String = "findNearbyStreets";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a findNearbyStreetsOSM API call.
		 * 
		 * @eventType findNearbyStreetsOSM
		 * 
		 * @see http://www.geonames.org/maps/osm-reverse-geocoder.html#findNearbyStreetsOSM
		 */
		public static const FIND_NEARBY_STREETS_OSM:String = "findNearbyStreetsOSM";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a findNearbyWeather API call.
		 * 
		 * @eventType findNearbyWeather
		 * 
		 * @see http://www.geonames.org/export/JSON-webservices.html#findNearByWeatherJSON
		 */
		public static const FIND_NEARBY_WEARTHER:String = "findNearByWeatherXML";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a findNearbyWikipedia API call.
		 * 
		 * @eventType findNearbyWikipedia
		 * 
		 * @see http://www.geonames.org/export/wikipedia-webservice.html#findNearbyWikipedia
		 */
		public static const FIND_NEARBY_WIKIPEDIA:String = "findNearbyWikipedia";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a findNearestAddress API call.
		 * 
		 * @eventType findNearestAddress
		 * 
		 * @see http://www.geonames.org/maps/us-reverse-geocoder.html#findNearestAddress
		 */
		public static const FIND_NEAREST_ADDRESS:String = "findNearestAddress";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a findNearestIntersection API call.
		 * 
		 * @eventType findNearestIntersection
		 * 
		 * @see http://www.geonames.org/maps/us-reverse-geocoder.html#findNearestIntersection
		 */
		public static const FIND_NEAREST_INTERSECTION:String = "findNearestIntersection";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a findNearestIntersectionOSM API call.
		 * 
		 * @eventType findNearestIntersectionOSM
		 * 
		 * @see http://www.geonames.org/maps/osm-reverse-geocoder.html#findNearestIntersectionOSM
		 */
		public static const FIND_NEAREST_INTERSECTION_OSM:String = "findNearestIntersectionOSM";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a get API call.
		 * 
		 * @eventType get
		 * 
		 * @see http://www.geonames.org/#
		 */
		public static const GET_TOPONYM:String = "get";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a gtopo30 API call.
		 * 
		 * @eventType gtopo30
		 * 
		 * @see http://www.geonames.org/export/web-services.html#gtopo30
		 */
		public static const GTOPO30:String = "gtopo30";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a hierarchy API call.
		 * 
		 * @eventType hierarchy
		 * 
		 * @see http://www.geonames.org/export/place-hierarchy.html#hierarchy
		 */
		public static const HIERARCHY:String = "hierarchy";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a neighbourhood API call.
		 * 
		 * @eventType neighbourhood
		 * 
		 * @see http://www.geonames.org/export/web-services.html#neighbourhood
		 */
		public static const NEIGHBOURHOOD:String = "neighbourhood";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a neighbours API call.
		 * 
		 * @eventType neighbours
		 * 
		 * @see http://www.geonames.org/export/place-hierarchy.html#neighbours
		 */
		public static const NEIGHBOURS:String = "neighbours";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to an ocean API call.
		 * 
		 * @eventType ocean
		 * 
		 * @see http://www.geonames.org/export/web-services.html#ocean
		 */
		public static const OCEAN:String = "ocean";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a postalCodeCountryInfo API call.
		 * 
		 * @eventType postalCodeCountryInfo
		 * 
		 * @see http://www.geonames.org/export/web-services.html#postalCodeCountryInfo
		 */
		public static const POSTAL_CODE_COUNTRY_INFO:String = "postalCodeCountryInfo";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a gtopo30 API call.
		 * 
		 * @eventType gtopo30
		 * 
		 * @see http://www.geonames.org/export/web-services.html#postalCodeSearch
		 */
		public static const POSTAL_CODE_SEARCH:String = "postalCodeSearch";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a search API call.
		 * 
		 * @eventType search
		 * 
		 * @see http://www.geonames.org/export/geonames-search.html
		 */
		public static const SEARCH:String = "search";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a siblings API call.
		 * 
		 * @eventType siblings
		 * 
		 * @see http://www.geonames.org/export/place-hierarchy.html#siblings
		 */
		public static const SIBLINGS:String = "siblings";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a timezone API call.
		 * 
		 * @eventType timezone
		 * 
		 * @see http://www.geonames.org/export/web-services.html#timezone
		 */
		public static const TIMEZONE:String = "timezone";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a wikipediaBoundingBox API call.
		 * 
		 * @eventType wikipediaBoundingBox
		 * 
		 * @see http://www.geonames.org/export/wikipedia-webservice.html#wikipediaBoundingBox
		 */
		public static const WIKIPEDIA_BOUNDING_BOX:String = "wikipediaBoundingBox";
		
		/**
		 * The event type for the event broadcast when the results have been loaded
		 * in response to a wikipediaSearch API call.
		 * 
		 * @eventType wikipediaSearch
		 * 
		 * @see http://www.geonames.org/export/wikipedia-webservice.html#wikipediaSearch
		 */
		public static const WIKIPEDIA_SEARCH:String = "wikipediaSearch";
		
		/**
		 * The event type for the event broadcast when the an exception is returned 
		 * from the GeoNames server.
		 * 
		 * @eventType geonamesException
		 * 
		 * @see http://www.geonames.org/export/webservice-exception.html
		 */
		public static const GEONAMES_EXCEPTION:String = "geonamesException";
		
		/**
		 * Constructor
		 * 
		 * @param type The type of event that the instance represents.
		 * 
		 * <p>Creates a new <code>GeoNamesEvent/code> object.
		 */		
		public function GeoNamesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	//------------------------------------------------------------------------------
	//	Overriden Methods
	//------------------------------------------------------------------------------
		
		/**
		 * Override of the clone function in the parent class <code>ServiceEvent</code>.
		 * 
		 * @return A new <code>GeoNamesEvent</code> object.
		 */
		override public function clone() : Event
		{
			return new GeoNamesEvent(type);
		}
		
	}
}