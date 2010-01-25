package org.geonames
{
	import com.adobe.net.DynamicURLLoader;
	import com.adobe.webapis.URLLoaderBase;
	
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.utils.describeType;
	
	import org.geonames.codes.Style;
	import org.geonames.criteria.FindNearbyCriteria;
	import org.geonames.criteria.FindNearbyPostalCodesCriteria;
	import org.geonames.criteria.PostalCodeSearchCriteria;
	import org.geonames.criteria.ToponymSearchCriteria;
	import org.geonames.criteria.WikipediaSearchCriteria;
	import org.geonames.data.GeoNamesException;
	import org.geonames.events.GeoNamesEvent;

	//--------------------------------------
	//	Events
	//--------------------------------------
	
	/**
	 * Event broadcast when the elevation has been retrieved from GeoNames servers 
	 * in response to <code>astergdem</code> being called.
	 * 
	 * <p>The event will contain a number representing the elevation in the 
	 * <code>data</code> property</p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #astergdem()
	 */	
	[Event(name="astergdem", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>children</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>ToponymResult</code> object.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #children()
	 * @see org.geonames.data.ToponymResult
	 */
	[Event(name="children", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>cities</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			the <code>Toponym</code> objects retrieved from 
	 * 			the geonames server.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #cities()
	 * @see org.geonames.data.Toponym
	 */
	[Event(name="cities", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the country code has been retrieved from GeoNames servers 
	 * in response to <code>countryCode</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>String</code> object - a string representing the ISO 
	 * 			alpha 2 country code.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #countryCode()
	 */
	[Event(name="countryCode", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the country information has been retrieved from 
	 * GeoNames servers in response to <code>countryInfo</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			the <code>Country/code> objects retrieved from 
	 * 			the geonames server.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #countryInfo()
	 * @see org.geonames.data.Country
	 */
	[Event(name="countryInfo", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the country subdivisons have been retrieved 
	 * from GeoNames servers in response to <code>countrySubdivion</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			the <code>CountrySubdivision</code> objects retrieved from 
	 * 			the geonames server.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #countrySubdivision()
	 * @see org.geonames.data.CountrySubdivision
	 */
	[Event(name="countrySubdivision", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>extendedFindNearby</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			the <code>Toponym</code> objects retrieved from 
	 * 			the geonames server.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #extendedFindNearby()
	 * @see org.geonames.data.ToponymResult
	 */
	[Event(name="extendedFindNearby", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>findNearby</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			the <code>Toponym</code> objects retrieved from 
	 * 			the geonames server.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #findNearby()
	 * @see org.geonames.data.Toponym
	 */
	[Event(name="findNearby", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>findNearbyPlaceName</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			the <code>Toponym</code> objects retrieved from 
	 * 			the geonames server.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #findNearbyPlaceName()
	 * @see org.geonames.data.Toponym
	 */
	[Event(name="findNearbyPlaceName", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>findNearbyPostalCodes</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			the <code>PostalCode</code> objects retrieved from 
	 * 			the geonames server.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #findNearbyPostalCodes()
	 * @see org.geonames.data.PostalCode
	 */
	[Event(name="findNearbyPostalCodes", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>findNearbyStreets</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			the <code>StreetSegments</code> objects retrieved from 
	 * 			the geonames server.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #findNearbyStreets()
	 * @see org.geonames.data.StreetSegment
	 */
	[Event(name="findNearbyStreets", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>findNearbyStreetsOSM</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			the <code>StreetSegments</code> objects retrieved from 
	 * 			the geonames server.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #findNearbyStreetsOSM()
	 * @see org.geonames.data.StreetSegment
	 */
	[Event(name="findNearbyStreetsOSM", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>findNearbyWeather</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			the <code>WeatherObservation</code> objects retrieved from 
	 * 			the geonames server.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #findNearbyWeather()
	 * @see org.geonames.data.WeatherObservation
	 */
	[Event(name="findNearByWeatherXML", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>findNearbyWikipediar</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			<code>WikipediaEntry</code> objects.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #findNearbyWikipedia()
	 * @see org.geonames.data.WeatherObservation
	 */
	[Event(name="findNearbyWikipedia", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>findNearestAddress</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Address</code> object - an object representing the 
	 * 			nearest address found.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #findNearestAddress()
	 * @see org.geonames.data.Address
	 */
	[Event(name="findNearestAddress", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>findNearestIntersection</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Intersection</code> object - an object representing the 
	 * 			nearest intersection found.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #findNearestIntersection()
	 * @see org.geonames.data.Intersection
	 */
	[Event(name="findNearestIntersection", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>findNearestIntersectionOSM</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Intersection</code> object - an object representing the 
	 * 			nearest intersection found.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #findNearestIntersectionOSM()
	 * @see org.geonames.data.Intersection
	 */
	[Event(name="findNearestIntersectionOSM", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>getToponym</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Toponym</code> object - an object representing the 
	 * 			the geonames object with the given geonameId.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #getToponym()
	 * @see org.geonames.data.Toponym
	 */
	[Event(name="get", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the elevation has been retrieved from GeoNames servers 
	 * in response to <code>gtopo30</code> being called.
	 * 
	 * <p>The event will contain a number representing the elevation in the 
	 * <code>data</code> property</p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #gtopo30()
	 */	
	[Event(name="gtopo30", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>hierarchy</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>ToponymResult</code> object.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #children()
	 * @see org.geonames.data.ToponymResult
	 */
	[Event(name="hierarchy", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>neighbourhood</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Neighbourhood</code> object.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #neighbourhood()
	 * @see org.geonames.data.Neighbourhood
	 */
	[Event(name="neighbourhood", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>neighbours</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>ToponymResult</code> object.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #neighbours()
	 * @see org.geonames.data.ToponymResult
	 */
	[Event(name="neighbours", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>Ocean</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Ocean</code> object.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #ocean()
	 * @see org.geonames.data.Ocean
	 */
	[Event(name="ocean", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>postalCodeCountryInfo</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			<code>PostalCodeCountryInfo</code> objects.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #postalCodeCountryInfo()
	 * @see org.geonames.data.PostalCodeCountryInfo
	 */
	[Event(name="postalCodeCountryInfo", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>postalCodeSearch</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>PostalCodeResult</code> object.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #postalCodeSearch()
	 * @see org.geonames.data.PostalCodeResult
	 */
	[Event(name="postalCodeSearch", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>search</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>ToponymResult</code> object.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #search()
	 * @see org.geonames.data.ToponymResult
	 */
	[Event(name="search", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>siblings</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>ToponymResult</code> object.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #siblings()
	 * @see org.geonames.data.ToponymResult
	 */
	[Event(name="siblings", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>srtm3</code> being called.
	 * 
	 * <p>The event will contain a number representing the elevation in the 
	 * <code>data</code> property</p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #srtm3()
	 * @see org.geonames.data.ToponymResult
	 */
	[Event(name="srtm3", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>timezone</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Timezone</code> object.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #timezone()
	 * @see org.geonames.data.Timezone
	 */
	[Event(name="timezone", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>wikipediaBoundingBox</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			<code>WikipediaEntry</code> objects.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #wikipediaBoundingBox()
	 * @see org.geonames.data.WikipediaEntry
	 */
	[Event(name="wikipediaBoundingBox", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when the results have been retrieved from GeoNames servers 
	 * in response to <code>wikipediaSearch</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>Array</code> object - an array containing 
	 * 			<code>WikipediaEntry</code> objects.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see #wikipediaSearch()
	 * @see org.geonames.data.WikipediaSearch
	 */
	[Event(name="wikipediaSearch", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Event broadcast when an exception has occured on the GeoNames servers.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>GeoNamesException</code> object.</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType org.geonames.events.GeoNamesEvent
	 * 
	 * @see org.geonames.data.GeoNamesException
	 */
	[Event(name="geonamesException", type="org.geonames.events.GeoNamesEvent")]
	
	/**
	 * Class that provides an ActionScript 3.0 interface to the remote
     * GeoNames XML API.
	 * 
	 * @langversion ActionScript 3.0
     * @playerversion Flash 9
     * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see http://www.geonames.org/
	 * @see http://www.geonames.org/export/ws-overview.html
	 */	
	public class GeoNamesService extends URLLoaderBase
	{
		
		/**
		 * Constructor 
		 * 
		 * <p>Creates a new <code>GeoNamesService</code> object.</p>
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
		private var _defaultLanguage:String = "en";
		
		/**
		 * The default language to use for all methods that support a 
		 * language parameter.
		 * 
		 * <p>You can override the default language set here for any method that has a 
		 * language parameter by passing in a value to the method, otherwise the 
		 * <code>defaultLanguage</code> property will be used.</p>
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
		private function invokeMethod(eventType:String, 
										params:Object = null):void
		{
			var loader:DynamicURLLoader = getURLLoader();
			var url:String = geoNamesServer +  "/" + eventType + "?";
			var request:URLRequest = new URLRequest(url);
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
			invokeMethod(GeoNamesEvent.ASTERGDEM, params);
		}
		
		/**
		 * Retrieves the children for a given geonameId.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>children</code> 
		 * when the children have been retrieved and parsed. The result event 
		 * contains a <code>ToponymResult</code> object.</p>
		 * 
		 * @param geonameId The geonameId of the parent.
		 * @param maxRows The number of rows returned, default is 200.
		 * @param style 
		 * @param language
		 * 
		 * @see #event:children
		 * @see org.geonames.data.ToponymResult
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
			invokeMethod(GeoNamesEvent.CHILDREN, params);
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
							   maxRows:Number = 10, language:String = ""):void
		{
			var params:URLVariables = new URLVariables();
			params.north = north;
			params.south = south;
			params.east = east;
			params.west = west;
			params.maxRows = maxRows;
			params.style = defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(GeoNamesEvent.CITIES, params);
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
			invokeMethod(GeoNamesEvent.COUNTRY_CODE, params);
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
			invokeMethod(GeoNamesEvent.COUNTRY_INFO, params);
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
			invokeMethod(GeoNamesEvent.COUNTRY_SUBDIVISION, params);
		}
		
		/**
		 * Retrieves the most detailed information for the given latitude/longitude.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>extendedFindNearby</code> 
		 * when the result has been retrieved and parsed. In the U.S. it returns the 
		 * address information. In other countries it returns the hierarchy service. 
		 * On the oceans it returns the ocean name.</p>
		 *  
		 * @param latitude
		 * @param longitude
		 * @param style
		 * @param language
		 * 
		 * @see #event:extendedFindNearby
		 * @see org.geonames.data.Address
		 * @see #ocean()
		 * @see #hierarchy()
		 * @see http://www.geonames.org/export/web-services.html#extendedFindNearby
		 */			
		public function extendedFindNearby(latitude:Number, longitude:Number, 
										   style:String = "", 
										   language:String = ""):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.style = style ? style : defaultStyle;
			params.lang = language ? language : defaultLanguage;
			invokeMethod(GeoNamesEvent.EXTENDED_FIND_NEARBY, params);
		}
		
		/**
		 * Retrieves the closest toponym for the given latitude/longitude and 
		 * other criteria.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>findNearby</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>Toponym</code> objects.</p>
		 *  
		 * @param criteria
		 * 
		 * @see #event:findNearby
		 * @see org.geonames.data.Toponym
		 * @see http://www.geonames.org/export/web-services.html#findNearby
		 */		
		public function findNearby(criteria:FindNearbyCriteria):void
		{
			invokeMethod(GeoNamesEvent.FIND_NEARBY, criteria);
		}
		
		/**
		 * 	Retrieves the closest populated place for the given latitude/longitued.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>findNearbyPlaceName</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>Toponym</code> objects.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * @param style
		 * @param language
		 * 
		 * @see #event:findNearbyPlaceName
		 * @see org.geonames.data.Toponym
		 * @see http://www.geonames.org/export/web-services.html#findNearbyPlaceName
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
			invokeMethod(GeoNamesEvent.FIND_NEARBY_PLACE_NAME, params);
		}
		
		/**
		 * Retrieves a list of postalcodes and places for the latitude/longitude.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>findNearbyPostalCodes</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>PostalCode</code> objects.</p>
		 * 
		 * <p>This service comes in two flavors. You can either pass the 
		 * latitude/longitude or a postalcode/placename.</p>
		 * 
		 * @param criteria
		 * 
		 * @see #event:findNearbyPostalCodes
		 * @see org.geonames.data.PostalCode
		 * @see org.geonames.criteria.FindNearbyPostalCodesCriteria
		 * @see http://www.geonames.org/export/web-services.html#findNearbyPostalCodes
		 */		
		public function findNearbyPostalCodes(criteria:FindNearbyPostalCodesCriteria):void
		{
			invokeMethod(GeoNamesEvent.FIND_NEARBY_POSTAL_CODES, criteria);
		}
		
		/**
		 * Retrieves a list of streets for the latitude/longitude. (U.S. Only)
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>findNearbyStreets</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>StreetSegments</code> objects.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 * 
		 * @see #event:findNearbyStreets
		 * @see org.geonames.data.StreetSegment
		 * @see http://www.geonames.org/maps/us-reverse-geocoder.html#findNearbyStreets
		 */		
		public function findNearbyStreets(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GeoNamesEvent.FIND_NEARBY_STREETS, params);
		}
		
		/**
		 * Retrieves a list of streets for the latitude/longitude.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>findNearbyStreetsOSM</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>StreetSegments</code> objects.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:findNearbyStreetsOSM
		 * @see org.geonames.data.StreetSegment
		 * @see http://www.geonames.org/maps/osm-reverse-geocoder.html#findNearbyStreetsOSM
		 */		
		public function findNearbyStreetsOSM(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GeoNamesEvent.FIND_NEARBY_STREETS_OSM, params);
		}
		
		/**
		 * Retrieves a weather station with the most recent weather observation.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>findNearByWeatherXML</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains a <code>WeatherObservation</code> object.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:findNearbyWeather
		 * @see org.geonames.data.WeatherObservation
		 * @see http://www.geonames.org/export/JSON-webservices.html#findNearByWeatherJSON
		 */		
		public function findNearbyWeather(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GeoNamesEvent.FIND_NEARBY_WEARTHER, params);
		}
		
		/**
		 * Retrieves a list of wikipedia entries for the latitude/longitude.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>findNearbyWikipedia</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>WikipediaEntry</code> objects.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * @param language
		 * 
		 * 
		 * @see #event:findNearbyWikipedia
		 * @see org.geonames.data.WikipediaEntry
		 * @see http://www.geonames.org/export/wikipedia-webservice.html#findNearbyWikipedia
		 */		
		public function findNearbyWikipedia(latitude:Number, longitude:Number, 
											language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			params.language = language ? language : defaultLanguage;
			invokeMethod(GeoNamesEvent.FIND_NEARBY_WIKIPEDIA, params);
		}
		
		/**
		 * Retrieves the nearest address for the given latitude/longitude. (U.S. Only)
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>findNearestAddress</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Address</code> object.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:findNearestAddress
		 * @see org.geonames.data.Address
		 * @see http://www.geonames.org/maps/us-reverse-geocoder.html#findNearestAddress
		 */		
		public function findNearestAddress(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GeoNamesEvent.FIND_NEAREST_ADDRESS, params);
		}
		
		/**
		 * Retrieves the nearest intersection for the given latitude/longitude. (U.S. Only)
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>findNearestIntersection</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Intersection/code> object.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:findNearestIntersection
		 * @see org.geonames.data.Intersection
		 * @see http://www.geonames.org/maps/us-reverse-geocoder.html#findNearestIntersection
		 */		
		public function findNearestIntersection(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GeoNamesEvent.FIND_NEAREST_INTERSECTION, params);
		}
		
		/**
		 * Retrieves the nearest intersection for the given latitude/longitude.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>findNearestIntersectionOSM</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Intersection/code> object.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:findNearestIntersection
		 * @see org.geonames.data.Intersection
		 * @see http://www.geonames.org/maps/osm-reverse-geocoder.html#findNearestIntersectionOSM
		 */		
		public function findNearestIntersectionOSM(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GeoNamesEvent.FIND_NEAREST_INTERSECTION_OSM, params);
		}
		
		/**
		 * Retrieves the toponym for the given geonameId.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>get</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains a <code>Toponym/code> object.</p>
		 * 
		 * @param geonameId
		 * @param style The verbosity of the return result. If no style is specified the <code>defaultStyle</code>.
		 * @param language
		 * 
		 * @see #event:get
		 * @see org.geonames.data.Toponym
		 * @see http://www.geonames.org/#
		 */		
		public function getToponym(geonameId:int, style:String = null, 
								   language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(GeoNamesEvent.GET_TOPONYM, params);
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
			invokeMethod(GeoNamesEvent.GTOPO30, params);
		}
		
		/**
		 * Retrieves all toponyms higher up in the hierarchy of a the given 
		 * <code>geonameId</code>.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>hierarchy</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains a <code>ToponymResult/code> object.</p>
		 * 
		 * @param geonameId
		 * @param style
		 * @param language
		 * 
		 * @see #event:hierarchy
		 * @see org.geonames.data.ToponymResult
		 * @see http://www.geonames.org/export/place-hierarchy.html#hierarchy
		 */		
		public function hierarchy(geonameId:int, style:String = null, 
								  language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(GeoNamesEvent.HIERARCHY, params);
		}
		
		/**
		 * Retrieves the neighbourhood information for the given latitude/longitude. 
		 * Data provided by Zillow under cc-by-sa license. (U.S. Only)
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>neighbourhood</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains a <code>Neighbourhood/code> object.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:neighbourhood
		 * @see org.geonames.data.Neighbourhood
		 * @see http://www.geonames.org/export/web-services.html#neighbourhood
		 */		
		public function neighbourhood(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GeoNamesEvent.NEIGHBOURHOOD, params);
		}
		
		/**
		 * Retrieves the neighbour toponyms for the given <code>geonameId</code>.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>hierarchy</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains a <code>ToponymResult/code> object.</p>
		 * 
		 * @param geonameId
		 * @param style
		 * @param language
		 * 
		 * @see #event:neighbours
		 * @see org.geonames.data.ToponymResult
		 * @see http://www.geonames.org/export/place-hierarchy.html#neighbours
		 */		
		public function neighbours(geonameId:Number, style:String = null, 
								  language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(GeoNamesEvent.NEIGHBOURS, params);
		}
		
		/**
		 * Retrieves the ocean name for the given latitude/longitude.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>ocean</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Ocean/code> object.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:ocean
		 * @see org.geonames.data.Ocean
		 * @see http://www.geonames.org/export/web-services.html#ocean
		 */		
		public function ocean(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GeoNamesEvent.OCEAN, params);
		}
		
		/**
		 * Retrieves the postal code information for which postal code geocoding is available.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>postalCodeCountryInfo</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>PostalCodeCountryInfo</code> objects.</p>
		 * 
		 * @see #event:postalCodeCountryInfo
		 * @see org.geonames.data.PostalCodeCountryInfo
		 * @see http://www.geonames.org/export/web-services.html#postalCodeCountryInfo
		 */		
		public function postalCodeCountryInfo():void
		{
			invokeMethod(GeoNamesEvent.POSTAL_CODE_COUNTRY_INFO);
		}
		
		/**
		 * Retrieves a list of postal codes and places for the 
		 * placename/postalcode query.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>postalCodeCountryInfo</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>PostalCodeCountryInfo</code> objects.</p>
		 * 
		 * <p>For the US the first returned zip code is determined using zip code 
		 * area shapes, the following zip codes are based on the centroid. For all 
		 * other supported countries all returned postal codes are based on 
		 * centroids.</p>
		 * 
		 * @param criteria
		 * 
		 * @see #event:postalCodeSearch
		 * @see org.geonames.data.PostalCode
		 * @see http://www.geonames.org/export/web-services.html#postalCodeSearch
		 */		
		public function postalCodeSearch(criteria:PostalCodeSearchCriteria):void
		{
			invokeMethod(GeoNamesEvent.POSTAL_CODE_SEARCH, criteria);
		}
		
		/**
		 * Retrieves the toponyms found for the search criteria.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>search</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>Toponym</code> objects.</p>
		 * 
		 * @param criteria
		 * 
		 * @see #event:search
		 * @see org.geonames.data.Toponym
		 * @see org.geonames.criteria.ToponymSearchCriteria
		 * @see http://www.geonames.org/export/geonames-search.html
		 */		
		public function search(criteria:ToponymSearchCriteria):void
		{
			invokeMethod(GeoNamesEvent.SEARCH, criteria);
		}
		
		/**
		 * Retrieves the siblings of the given <code>geonameId</code>.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>siblings</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains a <code>ToponymResult/code> object.</p>
		 * 
		 * @param geonameId
		 * @param style
		 * @param language
		 * 
		 * @see #event:siblings
		 * @see org.geonames.data.ToponymResult
		 * @see http://www.geonames.org/export/place-hierarchy.html#siblings
		 */		
		public function siblings(geonameId:int, style:String = null, 
								 language:String = null):void
		{
			var params:URLVariables = new URLVariables();
			params.geonameId = geonameId;
			params.style = style ? style : defaultStyle;
			params.language = language ? language : defaultLanguage;
			invokeMethod(GeoNamesEvent.SIBLINGS, params);
		}
		
		/**
		 * Retrieves the elevation for the given latitude/longitude.
		 * 
		 * <p>Shuttle Radar Topography Mission (SRTM) elevation data. SRTM consisted 
		 * of a specially modified radar system that flew onboard the Space Shuttle 
		 * Endeavour during an 11-day mission in February of 2000. The dataset covers 
		 * land areas between 60 degrees north and 56 degrees south. 
		 * This web service is using SRTM3 data with data points located every 
		 * 3-arc-second (approximately 90 meters) on a latitude/longitude grid.</p>
		 *  
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:srtm3
		 * @see http://www.geonames.org/export/web-services.html#srtm3
		 * @see http://www2.jpl.nasa.gov/srtm/
		 */
		public function srtm3(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GeoNamesEvent.SRTM3, params);
		}
		
		/**
		 * Retrieves the timezone for the given latitude/longitude.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>timezone</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains a <code>Timezone/code> object.</p>
		 * 
		 * @param latitude
		 * @param longitude
		 * 
		 * @see #event:timezone
		 * @see org.geonames.data.Timezone
		 * @see http://www.geonames.org/export/web-services.html#timezone
		 */		
		public function timezone(latitude:Number, longitude:Number):void
		{
			var params:URLVariables = new URLVariables();
			params.lat = latitude;
			params.lng = longitude;
			invokeMethod(GeoNamesEvent.TIMEZONE, params);
		}
		
		/**
		 * Retrieves the wikipedia entries within the bounding box.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>wikipediaBoundingBox</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>WikipediaEntry</code> objects.</p>
		 * 
		 * @param north
		 * @param south
		 * @param east
		 * @param west
		 * @param maxRows
		 * @param language
		 * 
		 * @see #event:wikipediaBoundingBox
		 * @see org.geonames.data.WikipediaEntry
		 * @see http://www.geonames.org/export/wikipedia-webservice.html#wikipediaBoundingBox
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
			invokeMethod(GeoNamesEvent.WIKIPEDIA_BOUNDING_BOX, params);
		}
		
		/**
		 * Retrieves the wikipedia entries found for the search criteria.
		 * 
		 * <p>Dispatches a <code>GeoNamesEvent</code> of type <code>wikipediaSearch</code> 
		 * when the result has been retrieved and parsed. The result event 
		 * contains an <code>Array</code> of <code>WikipediaEntry</code> objects.</p>
		 * 
		 * @param criteria
		 * 
		 * @see #event:wikipediaSearch
		 * @see org.geonames.data.WikipediaEntry
		 * @see http://www.geonames.org/export/wikipedia-webservice.html#wikipediaSearch
		 */		
		public function wikipediaSearch(criteria:WikipediaSearchCriteria):void
		{
			invokeMethod(GeoNamesEvent.WIKIPEDIA_SEARCH, criteria);
		}
	
	//------------------------------------------------------------------------------
	//	Event Handlers
	//------------------------------------------------------------------------------
		
		/**
		 * @private
		 */		
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