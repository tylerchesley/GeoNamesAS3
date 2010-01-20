package org.geonames.events
{
	import com.adobe.webapis.events.ServiceEvent;
	
	import org.geonames.data.GeoNamesException;

	/**
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class GeoNamesEvent extends ServiceEvent
	{
		
		public static const ASTERGDEM:String = "astergdem";
		
		public static const CHILDREN:String = "children";
		
		public static const CITIES:String = "cities";
		
		public static const COUNTRY_CODE:String = "countryCode";
		
		public static const COUNTRY_INFO:String = "countryInfo";
		
		public static const COUNTRY_SUBDIVISION:String = "countrySubdivision";
		
		public static const EXTENDED_FIND_NEARBY:String = "extendedFindNearby";
		
		public static const FIND_NEARBY:String = "findNearby";
		
		public static const FIND_NEARBY_PLACE_NAME:String = "findNearbyPlaceName";
		
		public static const FIND_NEARBY_POSTAL_CODES:String = "findNearbyPostalCodes";
		
		public static const FIND_NEARBY_STREETS:String = "findNearbyStreets";
		
		public static const FIND_NEARBY_STREETS_OSM:String = "findNearbyStreetsOSM";
		
		public static const FIND_NEARBY_WEARTHER:String = "findNearByWeatherXML";
		
		public static const FIND_NEARBY_WIKIPEDIA:String = "findNearbyWikipedia";
		
		public static const FIND_NEAREST_ADDRESS:String = "findNearestAddress";
		
		public static const FIND_NEAREST_INTERSECTION:String = "findNearestIntersection";
		
		public static const FIND_NEAREST_INTERSECTION_OSM:String = "findNearestIntersectionOSM";
		
		public static const GET_TOPONYM:String = "get";
		
		public static const GTOPO30:String = "gtopo30";
		
		public static const HIERARCHY:String = "hierarchy";
		
		public static const NEIGHBOURHOOD:String = "neighbourhood";
		
		public static const NEIGHBOURS:String = "neighbours";
		
		public static const OCEAN:String = "ocean";
		
		public static const POSTAL_CODE_COUNTRY_INFO:String = "postalCodeCountryInfo";
		
		public static const POSTAL_CODE_SEARCH:String = "postalCodeSearch";
		
		public static const SEARCH:String = "search";
		
		public static const SIBLINGS:String = "siblings";
		
		public static const TIMEZONE:String = "timezone";
		
		public static const WIKIPEDIA_BOUNDING_BOX:String = "wikipediaBoundingBox";
		
		public static const WIKIPEDIA_SEARCH:String = "wikipediaSearch";
		
		public static const GEONAMES_EXCEPTION:String = "geonamesException";
		
		public function GeoNamesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var exception:GeoNamesException;
	
	}
}