package org.geonames
{
	import com.adobe.net.DynamicURLLoader;
	import com.adobe.webapis.URLLoaderBase;
	
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	import org.geonames.codes.Language;
	import org.geonames.codes.Style;
	import org.geonames.criteria.ToponymSearchCriteria;
	import org.geonames.events.GeoNamesEvent;

	//--------------------------------------
	//	Events
	//--------------------------------------
	
	[Event(name="children", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="cities", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="countryCode", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="countryInfo", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="countrySubdivision", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyPlaceName", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyPostalCodes", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyStreets", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyWeather", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyWikipedia", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearestAddress", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearestIntersection", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="getToponym", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="hierarchy", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="neighbourhood", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="neighbours", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="ocean", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="postalCodeCountryInfo", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="postalCodeSearch", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="search", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="siblings", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="timezone", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="wikipediaBoundingBox", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="wikipediaSearch", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class GeoNames extends URLLoaderBase
	{
		
	//------------------------------------------------------------------------------
	//	Class Variables
	//------------------------------------------------------------------------------
		
		private static const CHILDREN_URL:String = "/children?";
		
		private static const CITIES_URL:String = "/cities?";
		
		private static const COUNTRY_CODE_URL:String = "/countryCode?";
		
		private static const COUNTRY_INFO_URL:String = "/countryInfo?";
		
		private static const COUNTRY_SUBDIVISION_URL:String = "/countrySubdivision?";
		
		private static const FIND_NEARBY_PLACE_NAME_URL:String = "/findNearbyPlaceName?";
		
		private static const FIND_NEARBY_POSTAL_CODES_URL:String = "/findNearbyPostalCodes?";
		
		private static const FIND_NEARBY_STREETS_URL:String = "/findNearbyStreets?";
		
		private static const FIND_NEARBY_WEATHER_URL:String = "/findNearByWeather?";
		
		private static const FIND_NEARBY_WIKIPEDIA_URL:String = "/findNearbyWikipedia?";
		
		private static const FIND_NEAREST_ADDRESS_URL:String = "/findNearestAddress?";
		
		private static const FIND_NEAREST_INTERSECTION_URL:String = "/findNearestIntersection?";
		
		private static const GET_TOPONYM_URL:String = "/get?";
		
		private static const HIERARCHY_URL:String = "/hierarchy?";
		
		private static const NEIGHBOURHOOD_URL:String = "/neighbourhood?";
		
		private static const NEIGHBOURS_URL:String = "/neighbours?";
		
		private static const OCEAN_URL:String = "/ocean?";
		
		private static const POSTAL_CODE_COUNTRY_INFO:String = "/postalCodeCountryInfo?";
		
		private static const POSTAL_CODE_SEARCH_URL:String = "/postalCodeSearch?";
		
		private static const SEARCH_URL:String = "/search?";
		
		private static const SIBLINGS_URL:String = "/siblings?";
		
		private static const TIMEZONE_URL:String = "/timezone?";
		
		private static const WIKIPEDIA_BOUNDING_BOX_URL:String = "/wikipediaBoundingBox?";
		
		private static const WIKIPEDIA_SEARCH_URL:String = "/wikipediaSearch?";
		
	//------------------------------------------------------------------------------
	//	Constructor
	//------------------------------------------------------------------------------
		
		/**
		 * Constructor 
		 */		
		public function GeoNames():void
		{
			super();
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------	
		
		//----------------------------------
		//	defaultLanguage
		//----------------------------------
		
		/**
		 * @private
		 * Storage of the defaultLanguage property. 
		 */		
		private var _defaultLanguage:String = Language.ENGLISH;
		
		/**
		 * The default language to use for all methods that support a 
		 * language parameter.
		 * 
		 * You can override the default language set here for any method that has a 
		 * language parameter by passing in a value to the method, otherwise the 
		 * <code>defaultLanguage</code> property will be used.
		 * 
		 * @default "en"
		 * 
		 */		
		public function get defaultLanguage():String
		{
			return _defaultLanguage;
		}
		
		/**
		 * @private
		 */		
		public function set defaultLanguage(value:String):void
		{
			if (_defaultLanguage == value)
				return;
			
			_defaultLanguage = value;
		}
		
		//----------------------------------
		//	defaultStyle
		//----------------------------------
		
		/**
		 * @private
		 * Storage of the defaultStyle property.
		 */		
		private var _defaultStyle:String = Style.MEDIUM;
		
		[Inspectable(category="General", enumeration="short,medium,long,full", defaultValue="medium")]
		
		/**
		 * The style property controls the verbosity of returned xml document.
		 * 
		 * @default "medium" 
		 * 
		 */		
		public function get defaultStyle():String
		{
			return _defaultStyle;
		}
		
		/**
		 * @private 
		 */		
		public function set defaultStyle(value:String):void
		{
			if (_defaultStyle == value)
				return;
			
			_defaultStyle = value;
		}
		
		//----------------------------------
		//	geoNamesServer
		//----------------------------------
		
		/**
		 * @private
		 * Storage of the geoNames 
		 */		
		private var _geoNamesServer:String = "http://ws.geonames.org";
		
		/**
		 * @default "http://ws.geonames.org"
		 */		
		public function get geoNamesServer():String
		{
			return _geoNamesServer;
		}
		
		/**
		 * @private
		 */		
		public function set geoNamesServer(value:String):void
		{
			if (_geoNamesServer == value)
				return;
			
			_geoNamesServer = value;
		}
	
	//------------------------------------------------------------------------------
	//	Methods
	//------------------------------------------------------------------------------
		
		/**
		 * 
		 * @param url
		 * @param resultHandler
		 * @param params
		 * 
		 */		
		protected function invokeMethod(url:String, eventType:String, 
										params:Object = null):void
		{
			var loader:DynamicURLLoader = getURLLoader();
			var request:URLRequest = new URLRequest(geoNamesServer + url);
			loader.eventType = eventType;
			loader.addEventListener(Event.COMPLETE, completeHandler);
			request.data = params;
			loader.load(request);
		}
		
		/**
		 * 
		 * @param geonameId
		 * @param style
		 * @param language
		 * 
		 */		
		public function children(geonameId:int, style:String = null, 
								 language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.language = language ? language : defaultLanguage;
			params.style = style ? style : defaultStyle;
			invokeMethod(CHILDREN_URL, GeoNamesEvent.CHILDREN, params);
		}
		
		/**
		 * 
		 * @param north
		 * @param south
		 * @param east
		 * @param west
		 * @param maxRows
		 * @param language
		 * 
		 */		
		public function cities(north:Number, south:Number, east:Number, west:Number, 
							   maxRows:Number = 10, language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.north = north;
			params.south = south;
			params.east = east;
			params.west = west;
			params.maxRows = maxRows;
			params.style = defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(CITIES_URL, GeoNamesEvent.CITIES, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 */		
		public function countryCode(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat  = latitude;
			params.lng = longitude;
			invokeMethod(COUNTRY_CODE_URL, GeoNamesEvent.COUNTRY_CODE, params);
		}
		
		/**
		 * 
		 * @param country
		 * @param language
		 * 
		 */		
		public function countryInfo(country:String = null, 
									language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.country = country;
			params.language = language ? language : defaultLanguage;
			invokeMethod(COUNTRY_INFO_URL, GeoNamesEvent.COUNTRY_INFO, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * @param radius
		 * @param maxRows
		 * @param language
		 * 
		 */		
		public function countrySubdivision(latitude:Number, longitude:Number, 
										   radius:Number = 0, maxRows:Number = 10,
										   language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.radius = radius;
			params.maxRows = maxRows;
			params.language = language ? language : defaultLanguage;
			invokeMethod(COUNTRY_SUBDIVISION_URL, 
						 GeoNamesEvent.COUNTRY_SUBDIVISION, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * @param style
		 * @param language
		 * 
		 */		
		public function findNearbyPlaceName(latitude:Number, longitude:Number, 
											style:String = null, 
											language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.style = style ? style : defaultStyle;
			params.lang = language ? language : defaultLanguage;
			invokeMethod(FIND_NEARBY_PLACE_NAME_URL, 
						 GeoNamesEvent.FIND_NEARBY_PLACE_NAME, params);
		}
		
		/**
		 * 
		 * 
		 */		
		public function findNearbyPostalCodes(criteria:PostalCodeSearchCriteria):void
		{
			invokeMethod(FIND_NEARBY_POSTAL_CODES_URL, 
						 GeoNamesEvent.FIND_NEARBY_POSTAL_CODES, criteria);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 */		
		public function findNearbyStreets(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(FIND_NEARBY_STREETS_URL, 
						 GeoNamesEvent.FIND_NEARBY_STREETS, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * @param style
		 * 
		 */		
		public function findNearbyWeather(latitude:Number, longitude:Number, 
										  style:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.style = style ? style : defaultStyle;
			invokeMethod(FIND_NEARBY_WEATHER_URL, GeoNamesEvent.FIND_NEARBY_WEARTHER, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * @param language
		 * 
		 */		
		public function findNearbyWikipedia(latitude:Number, longitude:Number, 
											language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.language = language ? language : defaultLanguage;
			invokeMethod(FIND_NEARBY_WIKIPEDIA_URL, 
						 GeoNamesEvent.FIND_NEARBY_WIKIPEDIA, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * @param style
		 * 
		 */		
		public function findNearestAddress(latitude:Number, longitude:Number, 
										   style:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.style = style ? style : defaultStyle;
			invokeMethod(FIND_NEAREST_ADDRESS_URL, 
						 GeoNamesEvent.FIND_NEAREST_ADDRESS, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * @param style
		 * 
		 */		
		public function findNearestIntersection(latitude:Number, longitude:Number, 
												style:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.style = style ? style : defaultStyle;
			invokeMethod(FIND_NEAREST_INTERSECTION_URL, 
				GeoNamesEvent.FIND_NEAREST_INTERSECTION, params);
		}
		
		/**
		 * 
		 * @param geonameId
		 * @param style
		 * @param language
		 * 
		 */		
		public function getToponym(geonameId:int, style:String = null, 
								   language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(GET_TOPONYM_URL, GeoNamesEvent.GET_TOPONYM, params);
		}
		
		/**
		 * 
		 * @param geonameId
		 * @param style
		 * @param language
		 * 
		 */		
		public function hierarchy(geonameId:int, style:String = null, 
								  language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(HIERARCHY_URL, GeoNamesEvent.HIERARCHY, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * @param style
		 * 
		 */		
		public function neighbourhood(latitude:Number, longitude:Number, style:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.style = style ? style : defaultStyle;
			invokeMethod(NEIGHBOURHOOD_URL, GeoNamesEvent.NEIGHBOURHOOD, params);
		}
		
		/**
		 * 
		 * @param geonameId
		 * @param style
		 * @param language
		 * 
		 */		
		public function neighbours(geonameId:Number, style:String = null, 
								  language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(NEIGHBOURS_URL, GeoNamesEvent.NEIGHBOURS, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 */		
		public function ocean(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(OCEAN_URL, GeoNamesEvent.OCEAN, params);
		}
		
		/**
		 * 
		 * 
		 */		
		public function postalCodeCountryInfo():void
		{
			invokeMethod(POSTAL_CODE_COUNTRY_INFO, GeoNamesEvent.POSTAL_CODE_COUNTRY_INFO);
		}
		
		/**
		 * 
		 * @param criteria
		 * 
		 */		
		public function postalCodeSearch(criteria:PostalCodeSearchCriteria):void
		{
			invokeMethod(POSTAL_CODE_SEARCH_URL, GeoNamesEvent.POSTAL_CODE_SEARCH, criteria);
		}
		
		/**
		 * 
		 * @param criteria
		 * 
		 */		
		public function search(criteria:ToponymSearchCriteria):void
		{
			invokeMethod(SEARCH_URL, GeoNamesEvent.SEARCH, criteria);
		}
		
		/**
		 * 
		 * @param geonameId
		 * @param style
		 * @param language
		 * 
		 */		
		public function siblings(geonameId:int, style:String = null, 
								 language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(SIBLINGS_URL, GeoNamesEvent.SIBLINGS, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 */		
		public function timezone(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(TIMEZONE_URL, GeoNamesEvent.TIMEZONE, params);
		}
		
		/**
		 * 
		 * @param north
		 * @param south
		 * @param east
		 * @param west
		 * @param maxRows
		 * @param language
		 * 
		 */		
		public function wikipediaBoundingBox(north:Number, south:Number, 
											 east:Number, west:Number, 
											 maxRows:Number = 10, 
											 language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.north = north;
			params.south = south;
			params.east = east;
			params.west = west;
			params.maxRows = maxRows;
			params.language = language ? language : defaultLanguage;
			invokeMethod(WIKIPEDIA_BOUNDING_BOX_URL, GeoNamesEvent.WIKIPEDIA_BOUNDING_BOX, 
				params);
		}
		
		/**
		 * 
		 * @param placeName
		 * @param title
		 * @param maxRows
		 * @param language
		 * 
		 */		
		public function wikipediaSearch(placeName:String, title:String = null, 
										maxRows:Number = 10, 
										language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.q = placeName;
			if (title)
				params.title = title;
			params.maxRows = maxRows;
			params.language = language ? language : defaultLanguage;
			invokeMethod(WIKIPEDIA_SEARCH_URL, GeoNamesEvent.WIKIPEDIA_SEARCH, params);
		}
	
	//------------------------------------------------------------------------------
	//	Event Handlers
	//------------------------------------------------------------------------------
		
		private function completeHandler(event:Event):void
		{
			var loader:DynamicURLLoader = event.target as DynamicURLLoader;
			var resultEvent:GeoNamesEvent = new GeoNamesEvent(loader.eventType);
			resultEvent.data = GeoNamesDataParser.parse(loader.eventType, loader.data);
			dispatchEvent(resultEvent);
		}
		
	}
}