package org.geonames
{
	import com.adobe.webapis.URLLoaderBase;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	import org.geonames.data.XMLDataParser;
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
	
	[Event(name="neighborhood", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="neighbors", type="org.geonames.events.GeoNamesEvent")]
	
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
		
		private static const NEIGHBORHOOD_URL:String = "/neighborhood?";
		
		private static const NEIGHBORS_URL:String = "/neighbors?";
		
		private static const OCEAN_URL:String = "/ocean?";
		
		private static const POSTAL_CODE_COUNTRY_INFO:String = "/postalCodeCountryInfo?";
		
		private static const POSTAL_CODE_SEARCH_URL:String = "/postalCodeSearch?";
		
		private static const SEARCH_URL:String = "/search?";
		
		private static const SIBLINGS_URL:String = "/siblings?";
		
		private static const TIMEZONE_URL:String = "/timezone?";
		
		private static const WIKIPEDIA_BOUNDING_BOX_URL:String = "/wikipediaBoundingBox?";
		
		private static const WIKIPEDIA_SEARCH_URL:String = "/wikipediaSearch?";
		
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
		
		public function get geoNamesServer():String
		{
			return _geoNamesServer;
		}
		
		public function set geoNamesServer(value:String):void
		{
			if (_geoNamesServer == value)
				return;
			
			_geoNamesServer = value;
		}
	
	//------------------------------------------------------------------------------
	//	Methods
	//------------------------------------------------------------------------------
		
		protected function invokeMethod(url:String, resultHandler:Function, 
								params:Object = null):void
		{
			var loader:URLLoader = getURLLoader();
			var request:URLRequest = new URLRequest(geoNamesServer + url);
			loader.addEventListener(Event.COMPLETE, resultHandler);
			request.data = params;
			loader.load(request);
		}
		
		protected function processAndDispatch(data:String, type:String, 
											  parseFunction:Function):void
		{
			var result:XML = XML(data);
			var event:GeoNamesEvent = new GeoNamesEvent(type);
			event.data = parseFunction(XML(data));
			dispatchEvent(event);
		}
		
		public function children(geonameId:int, style:String = null, 
								 language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.language = language ? language : defaultLanguage;
			params.style = style ? style : defaultStyle;
			invokeMethod(CHILDREN_URL, childrenHandler, params);
		}
		
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
			invokeMethod(CITIES_URL, citiesHandler, params);
		}
		
		public function countryCode(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.latitude  = latitude;
			params.longitude = longitude;
			invokeMethod(COUNTRY_CODE_URL, countryCodeHandler, params);
		}
		
		public function countryInfo(country:String = null, 
									language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.country = country;
			params.language = language ? language : defaultLanguage;
			invokeMethod(COUNTRY_INFO_URL, countryInfoHandler, params);
		}
		
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
						 countrySubdivisionHandler, params);
		}
		
		public function findNearbyPlaceName(latitude:Number, longitude:Number, 
											style:String = null, 
											language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.latitude = latitude;
			params.longitude = longitude;
			params.style = style ? style : defaultStyle;
			params.lang = language ? language : defaultLanguage;
			invokeMethod(FIND_NEARBY_PLACE_NAME_URL, 
						 findNearbyPlaceNameHandler, params);
		}
		
		public function findNearbyPostalCodes():void
		{
			var params:URLVariables = new URLVariables();
			invokeMethod(FIND_NEARBY_POSTAL_CODES_URL, 
						 findNearbyPostalCodesHandler, params);
		}
		
		public function findNearbyStreets(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.latitude = latitude;
			params.longitude = longitude;
			invokeMethod(FIND_NEARBY_STREETS_URL, 
						 findNearbyStreetsHandler, params);
		}
		
		public function findNearbyWeather(latitude:Number, longitude:Number, 
										  style:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.style = style ? style : defaultStyle;
			invokeMethod(FIND_NEARBY_WEATHER_URL, findNearbyWeatherHandler, params);
		}
		
		public function findNearbyWikipedia(latitude:Number, longitude:Number, 
											language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.latitude = latitude;
			params.longitude = longitude;
			params.language = language;
			invokeMethod(FIND_NEARBY_WIKIPEDIA_URL, 
						 findNearbyWikipediaHandler, params);
		}
		
		public function findNearestAddress(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.latitude = latitude;
			params.longitude = longitude;
			invokeMethod(FIND_NEAREST_ADDRESS_URL, 
						 findNearestAddressHandler, params);
		}
		
		public function findNearestIntersection(latitude:Number, longitude:Number, 
												style:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.style = style ? style : defaultStyle;
			invokeMethod(FIND_NEAREST_INTERSECTION_URL, 
				findNearestIntersectionHandler, params);
		}
		
		public function getToponym(geonameId:int, style:String = null, 
								   language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameid = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(GET_TOPONYM_URL, getToponymHandler, params);
		}
		
		public function hierarchy(geonameId:int, style:String = null, 
								  language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameid = geonameId;
			params.style = style;
			params.language = language;
			invokeMethod(HIERARCHY_URL, hierarchyHandler, params);
		}
		
		public function neighborhood(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.latitude = latitude;
			params.longitude = longitude;
			invokeMethod(NEIGHBORHOOD_URL, neighborhoodHandler, params);
		}
		
		public function neighbors(geonameId:Number, style:String = null, 
								  language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameid = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(NEIGHBORS_URL, neighborsHandler, params);
		}
		
		public function ocean(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(OCEAN_URL, oceanHandler, params);
		}
		
		public function postalCodeCountryInfo():void
		{
			invokeMethod(POSTAL_CODE_COUNTRY_INFO, postalCodeCountryInfoHandler);
		}
		
		public function postalCodeSearch(criteria:PostalCodeSearchCriteria):void
		{
			invokeMethod(POSTAL_CODE_SEARCH_URL, postalCodeSearchHandler, criteria);
		}
		
		public function search(criteria:ToponymSearchCriteria):void
		{
			invokeMethod(SEARCH_URL, searchHandler, criteria);
		}
		
		public function siblings(geonameId:int, style:String = null, 
								 language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameid = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(SIBLINGS_URL, siblingsHandler, params);
		}
		
		public function timezone(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.latitude = latitude;
			params.longitude = longitude;
			invokeMethod(TIMEZONE_URL, timezoneHandler, params);
		}
		
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
			invokeMethod(WIKIPEDIA_BOUNDING_BOX_URL, wikipediaBoundingBoxHandler, 
				params);
		}
		
		public function wikipediaSearch(placeName:String, title:String = null, 
										maxRows:Number = 10, 
										language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.q = placeName;
			params.title = title;
			params.maxRows = maxRows;
			params.language = language ? language : defaultLanguage;
			invokeMethod(WIKIPEDIA_SEARCH_URL, wikipediaSearchHandler, params);
		}
	
	//------------------------------------------------------------------------------
	//	Event Handlers
	//------------------------------------------------------------------------------
		
		protected function childrenHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.CHILDREN, 
							   XMLDataParser.parseToponymSearchResult);
		}
		
		protected function citiesHandler(event:Event):void
		{
			var result:GeoNamesEvent = new GeoNamesEvent(GeoNamesEvent.CITIES);
			
		}
		
		protected function countryCodeHandler(event:Event):void
		{
			var result:GeoNamesEvent = new GeoNamesEvent(GeoNamesEvent.COUNTRY_CODE);
			result.data = URLLoader(event.target).data;
			dispatchEvent(result);
		}
		
		protected function countryInfoHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.COUNTRY_INFO, 
							   XMLDataParser.parseCountryInfo);
		}
		
		protected function countrySubdivisionHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.COUNTRY_SUBDIVISION, 
							   XMLDataParser.parseCountrySubdivision);
		}
		
		protected function findNearbyPlaceNameHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.FIND_NEARBY_PLACE_NAME, 
				XMLDataParser.parseToponym);
		}
		
		protected function findNearbyPostalCodesHandler(event:Event):void
		{
			
		}
		
		protected function findNearbyStreetsHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.FIND_NEARBY_STREETS, 
							   XMLDataParser.parseStreetSegment);
		}
		
		protected function findNearbyWeatherHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.FIND_NEARBY_WEARTHER, 
							   XMLDataParser.parseWeatherObservation);
		}
		
		protected function findNearbyWikipediaHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.FIND_NEARBY_WIKIPEDIA, 
				XMLDataParser.parseWikipediaArticle);
		}
		
		protected function findNearestAddressHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.FIND_NEAREST_ADDRESS, 
				XMLDataParser.parseAddress);
		}
		
		protected function findNearestIntersectionHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.FIND_NEAREST_INTERSECTION, 
				XMLDataParser.parseIntersection);
		}
		
		protected function getToponymHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.GET_TOPONYM, 
				XMLDataParser.parseToponym);
		}
		
		protected function hierarchyHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.HIERARCHY, 
				XMLDataParser.parseToponymSearchResult);
		}
		
		protected function neighborhoodHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.NEIGHBORHOOD, 
				XMLDataParser.parseNeighborhood);
		}
		
		protected function neighborsHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.NEIGHBORS, 
				XMLDataParser.parseToponymSearchResult);
		}
		
		protected function oceanHandler(event:Event):void
		{
			
		}
		
		protected function postalCodeCountryInfoHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.POSTAL_CODE_COUNTRY_INFO, 
				XMLDataParser.parsePostalCodeCountryInfo);
		}
		
		protected function postalCodeSearchHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.POSTAL_CODE_SEARCH, 
				XMLDataParser.parsePostalCodeSearchResult);
		}
		
		protected function searchHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.SEARCH, 
				XMLDataParser.parseToponymSearchResult);
		}
		
		protected function siblingsHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data, GeoNamesEvent.SIBLINGS, 
				XMLDataParser.parseToponymSearchResult);
		}
		
		protected function timezoneHandler(event:Event):void
		{
			
		}
		
		protected function wikipediaBoundingBoxHandler(event:Event):void
		{
			
		}
		
		protected function wikipediaSearchHandler(event:Event):void
		{
			
		}
		
	}
}