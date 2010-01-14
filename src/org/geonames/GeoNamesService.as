package org.geonames
{
	import com.adobe.net.DynamicURLLoader;
	import com.adobe.webapis.URLLoaderBase;
	
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.utils.describeType;
	
	import org.geonames.codes.Language;
	import org.geonames.codes.Style;
	import org.geonames.criteria.FindNearbyCriteria;
	import org.geonames.criteria.FindNearbyPostalCodesCriteria;
	import org.geonames.criteria.PostalCodeSearchCriteria;
	import org.geonames.criteria.ToponymSearchCriteria;
	import org.geonames.data.GeoNamesException;
	import org.geonames.events.GeoNamesEvent;

	//--------------------------------------
	//	Events
	//--------------------------------------
	
	[Event(name="astergdem", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="children", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="cities", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="countryCode", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="countryInfo", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="countrySubdivision", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="extendedFindNearby", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearby", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyPlaceName", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyPostalCodes", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyStreets", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyStreetsOSM", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyWeather", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearbyWikipedia", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearestAddress", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearestIntersection", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="findNearestIntersectionOSM", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="getToponym", type="org.geonames.events.GeoNamesEvent")]
	
	[Event(name="gtopo30", type="org.geonames.events.GeoNamesEvent")]
	
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
	
	[Event(name="geonamesException", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class GeoNamesService extends URLLoaderBase
	{
		
	//------------------------------------------------------------------------------
	//	Class Methods
	//------------------------------------------------------------------------------
		
		/**
		 * Method used to copy criteria values to a new params object 
		 * without any properties that are null. This prevents errors 
		 * from the geonames server for null values.
		 *  
		 * @param criteria
		 * @return 
		 * 
		 */		
		public static function criteriaToParams(criteria:Object):URLVariables
		{
			var params:URLVariables = new URLVariables();
			var type:XML = describeType(criteria);
			
			for each (var param:XML in type..variable)
			{
				var name:String = param.@name;
				var value:* = criteria[name];
				if (value)
				{
					params[name] = value;
				}
			}
			
			return params;
		}
		
	//------------------------------------------------------------------------------
	//	Class Constants
	//------------------------------------------------------------------------------
		
		private static const ASTERGDEM_URL:String = "/astergdem?"
		
		private static const CHILDREN_URL:String = "/children?";
		
		private static const CITIES_URL:String = "/cities?";
		
		private static const COUNTRY_CODE_URL:String = "/countryCode?";
		
		private static const COUNTRY_INFO_URL:String = "/countryInfo?";
		
		private static const COUNTRY_SUBDIVISION_URL:String = "/countrySubdivision?";
		
		private static const EXTENDED_FIND_NEARBY_URL:String = "/extendedFindNearby?";
		
		private static const FIND_NEARBY_URL:String = "/findNearby?";
		
		private static const FIND_NEARBY_PLACE_NAME_URL:String = "/findNearbyPlaceName?";
		
		private static const FIND_NEARBY_POSTAL_CODES_URL:String = "/findNearbyPostalCodes?";
		
		private static const FIND_NEARBY_STREETS_URL:String = "/findNearbyStreets?";
		
		private static const FIND_NEARBY_STREETS_OSM_URL:String = "/findNearbyStreetsOSM?";
		
		private static const FIND_NEARBY_WEATHER_URL:String = "/findNearByWeather?";
		
		private static const FIND_NEARBY_WIKIPEDIA_URL:String = "/findNearbyWikipedia?";
		
		private static const FIND_NEAREST_ADDRESS_URL:String = "/findNearestAddress?";
		
		private static const FIND_NEAREST_INTERSECTION_URL:String = "/findNearestIntersection?";
		
		private static const FIND_NEAREST_INTERSECTION_OSM_URL:String = "/findNearestIntersectionOSM?";
		
		private static const GET_TOPONYM_URL:String = "/get?";
		
		private static const GTOPO30_URL:String = "/gtopo30?";
		
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
		public function GeoNamesService():void
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
		 * @private
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
		 * Retrieves the elevation in meters according to aster gdem, 
		 * ocean areas have been masked as "no data" and have been assigned 
		 * a value of -9999.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>astergdem</code> 
		 * when the elevation has been retrieved. The result event 
		 * contains a number representing the elevation.</p>
		 *  
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:astergdem
		 * @see http://www.geonames.org/export/web-services.html#astergdem
		 * @see http://asterweb.jpl.nasa.gov/gdem.asp
		 */		
		public function astergdem(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(ASTERGDEM_URL, GeoNamesEvent.ASTERGDEM, params);
		}
		
		/**
		 * Retrieves the children for a given geonameId.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>children</code> 
		 * when the children have been retrieved and parsed. The result event 
		 * contains a <code>ToponymSearchResult</code> object.</p>
		 * 
		 * @param geonameId The geonameId of the parent.
		 * @param maxRows The number of rows returned, default is 200.
		 * @param style 
		 * @param language
		 * 
		 * @see #event:children
		 * @see org.geonames.data.ToponymSearchResult
		 * @see http://www.geonames.org/export/place-hierarchy.html#children
		 */		
		public function children(geonameId:int, maxRows:Number = 200, 
								 style:String = null, language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.maxRows = maxRows;
			params.language = language ? language : defaultLanguage;
			params.style = style ? style : defaultStyle;
			invokeMethod(CHILDREN_URL, GeoNamesEvent.CHILDREN, params);
		}
		
		/**
		 * Retrieves a list of cities and placenames in the bounding box, ordered by 
		 * relevancy (capital/population). Placenames close together are filterered 
		 * out and only the larger name is included in the resulting list.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>cities</code> 
		 * when the list of cities has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>Toponym</code> objects.</p>
		 * 
		 * @param north The northren coordinate of bounding box. 
		 * @param south The southren coordinate of bounding box.
		 * @param east The eastern coordinate of bounding box.
		 * @param west The western coordinate of bounding box.
		 * @param maxRows The maximal number of rows returned (default = 10).
		 * @param language The language of placenames and wikipedia urls (default = en).
		 * 
		 * @see #event:cities
		 * @see org.geonames.data.Toponym
		 * @see http://www.geonames.org/export/JSON-webservices.html#citiesJSON
		 */		
		public function cities(north:Number, south:Number, east:Number, west:Number, 
							   maxRows:Number = 10, language:String = Language.ENGLISH):void
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
		 * Retrieves the iso country code for the given latitude/longitude.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>countryCode</code> 
		 * when the country code has been retrieved. The result event 
		 * contains a two character <code>String</code> representing the 
		 * country code.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:countryCode
		 * @see http://www.geonames.org/export/JSON-webservices.html#countrycode
		 */		
		public function countryCode(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat  = latitude;
			params.lng = longitude;
			invokeMethod(COUNTRY_CODE_URL, GeoNamesEvent.COUNTRY_CODE, params);
		}
		
		/**
		 * Retrieves the capital, population, area in square km, bounding box 
		 * of mainland (excluding offshore islands).
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>countryInfo</code> 
		 * when the country information has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>Country</code> objects.</p>
		 * 
		 * @param country The ISO 2 country code (default = all countries).
		 * @param language ISO-639-1 language code (en,de,fr,it,es,...) (default = english).
		 * 
		 * @see #event:countryInfo
		 * @see org.geonames.data.Country
		 * @see http://www.geonames.org/export/JSON-webservices.html#countryinfo
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
		 * Retrieves the iso country code and the administrative subdivision of any given point. 
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>countrySubdivision</code> 
		 * when the country subdivision information has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>CountrySubdivion</code> objects.</p>
		 * 
		 * <p>With the parameters 'radius' and 'maxRows' you get the closest subdivisions ordered by distance</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * @param radius A buffer in km for closest country in coastal areas.
		 * @param maxRows
		 * @param language
		 * 
		 * @see #event:countrySubdivision
		 * @see org.geonames.data.CountrySubdivision
		 * @see http://www.geonames.org/export/JSON-webservices.html#countrysubdivision
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
		
		public function extendedFindNearby(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(EXTENDED_FIND_NEARBY_URL, 
				GeoNamesEvent.EXTENDED_FIND_NEARBY, params);
		}
		
		public function findNearby(criteria:FindNearbyCriteria):void
		{
			var params:URLVariables = criteriaToParams(criteria);
			invokeMethod(FIND_NEARBY_URL, GeoNamesEvent.FIND_NEARBY, params);
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
		public function findNearbyPostalCodes(criteria:FindNearbyPostalCodesCriteria):void
		{
			var params:URLVariables = criteriaToParams(criteria);
			invokeMethod(FIND_NEARBY_POSTAL_CODES_URL, 
						 GeoNamesEvent.FIND_NEARBY_POSTAL_CODES, params);
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
		
		public function findNearbyStreetsOSM(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(FIND_NEARBY_STREETS_OSM_URL, 
						 GeoNamesEvent.FIND_NEARBY_STREETS_OSM, params);
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
		public function findNearestIntersection(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(FIND_NEAREST_INTERSECTION_URL, 
				GeoNamesEvent.FIND_NEAREST_INTERSECTION, params);
		}
		
		/**
		 * 
		 * @param latitude
		 * @param longitude
		 * @param style
		 * 
		 */		
		public function findNearestIntersectionOSM(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(FIND_NEAREST_INTERSECTION_OSM_URL, 
				GeoNamesEvent.FIND_NEAREST_INTERSECTION_OSM, params);
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
		 * Retrieves the elevation in meters according to gtopo30, ocean areas have 
		 * been masked as "no data" and have been assigned a value of -9999.
		 * 
		 * <p>GTOPO30 is a global digital elevation model (DEM) with a horizontal grid 
		 * spacing of 30 arc seconds (approximately 1 kilometer). GTOPO30 was 
		 * derived from several raster and vector sources of topographic information.</p>
		 *  
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:gtopo30
		 * @see http://www.geonames.org/export/web-services.html#gtopo30
		 */		
		public function gtopo30(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GTOPO30_URL, GeoNamesEvent.GTOPO30, params);
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
			var params:URLVariables = criteriaToParams(criteria);
			
			if (!params.postalcode && !params.placename)
					throw new Error("postalcode or placename is required.");
			
			invokeMethod(POSTAL_CODE_SEARCH_URL, GeoNamesEvent.POSTAL_CODE_SEARCH, params);
		}
		
		/**
		 * 
		 * @param criteria
		 * 
		 */		
		public function search(criteria:ToponymSearchCriteria):void
		{
			var params:URLVariables = criteriaToParams(criteria);
			
			if (!params.q && !params.name && !params.name_equals)
				throw new Error("q, name or name_equals is required.");
			
			invokeMethod(SEARCH_URL, GeoNamesEvent.SEARCH, params);
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
			var data:Object = GeoNamesResultParser.parse(loader.eventType, loader.data);
			var type:String = data is GeoNamesException ? GeoNamesEvent.GEONAMES_EXCEPTION : 
														  loader.eventType;
			var resultEvent:GeoNamesEvent = new GeoNamesEvent(type);
			resultEvent.data = data;
			dispatchEvent(resultEvent);
		}
		
	}
}