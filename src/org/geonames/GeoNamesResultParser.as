package org.geonames
{
	import com.adobe.utils.StringUtil;
	
	import org.geonames.data.Address;
	import org.geonames.data.Code;
	import org.geonames.data.Country;
	import org.geonames.data.CountrySubdivision;
	import org.geonames.data.GeoNamesException;
	import org.geonames.data.Intersection;
	import org.geonames.data.Neighbourhood;
	import org.geonames.data.Ocean;
	import org.geonames.data.PostalCode;
	import org.geonames.data.PostalCodeCountryInfo;
	import org.geonames.data.PostalCodeResult;
	import org.geonames.data.StreetSegment;
	import org.geonames.data.Timezone;
	import org.geonames.data.Toponym;
	import org.geonames.data.ToponymResult;
	import org.geonames.data.WeatherObservation;
	import org.geonames.data.WikipediaEntry;
	import org.geonames.events.GeoNamesEvent;
	
	/**
	 * Class that contains internal helper functions used to parse
     * the XML returned from the GeoNames servers to create the relevant
     * objects.
     * 
     * Only meant as helpers for the library; NOT meant for use by
     * developers using the library.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 *
	 */
	public class GeoNamesResultParser
	{
		
		/**
		 * Creates an <code>Address</code> object.
		 * 
		 * @param node The XML representation of the address.
		 * @return A new <code>Address</code> object.
		 * 
		 * @see org.geonames.data.Address
		 */		
		public static function parseAddress(node:XML):Address
		{
			var address:Address = new Address();
			address.street = node.street;
			address.streetNumber = node.streetNumber;
			address.postalCode = node.postalCode;
			address.placeName = node.placename;
			address.latitude = node.lat;
			address.longitude = node.lng;
			address.adminCode1 = node.adminCode1;
			address.adminCode2 = node.adminCode2;
			address.adminName1 = node.adminName1;
			address.adminName2 = node.adminName2;
			address.distance = node.distance;
			address.countryCode = node.countryCode;
			address.postalCode = node.postalcode;
			return address;
		}
		
		/**
		 * Creates a <code>Country</code> object.
		 * 
		 * @param node The XML representation of the country.
		 * @return A new <code>Country</code> object.
		 * 
		 * @see org.geonames.data.Country
		 */	
		public static function parseCountry(node:XML):Country
		{
			var country:Country = new Country();
			country.areaInSqKm = node.areaInSqKm;
			country.bBoxEast = node.bBoxEast;
			country.bBoxNorth = node.bBoxNorth;
			country.bBoxSouth = node.bBoxSouth;
			country.bBoxWest = node.bBoxWest;
			country.capital = node.capital;
			country.continent = node.continent;
			country.countryCode = node.countryCode;
			country.countryName = node.countryName;
			country.currencyCode = node.currencyCode;
			country.fipsCode = node.fipsCode;
			country.geonameId = node.geonameId;
			country.isoAlpha3 = node.isoAlpha3;
			country.isoNumeric = node.isoNumeric;
			country.languages = node.languages;
			country.population = node.population;
			return country;
		}
		
		/**
		 * Parses the results for the <code>extendedFindNearby</code>.
		 * 
		 * @param node The XML result.
		 * @return Either an <code>array</code> of <code>Toponym</code> objects, 
		 * an <code>array</code> of <code>Address</code> objects or an 
		 * <code>Ocean</code> object.
		 * 
		 * @see org.geonames.data.Address
		 * @see org.geonames.data.Ocean
		 * @see org.geonames.data.Toponym
		 */		
		public static function parseExtendedFindNearby(node:XML):Object
		{
			var result:Object;
			
			if (node.descendants("geoname").length() > 0)
			{
				result = parseRepeatedElements("geoname", parseToponym, node);
			}
			else if (node.descendants("address").length() > 0)
			{
				result = parseRepeatedElements("address", parseAddress, node);
			}
			else if (node.descendants("ocean").length() > 0)
			{
				result = parseOcean(node.ocean[0]);
			}
			
			return result;
		}
		
		/**
		 * Creates a <code>CountrySubdivision</code> object.
		 * 
		 * @param node The XML representation of the country subdivision.
		 * @return A new <code>CountrySubdivision</code> object.
		 * 
		 * @see org.geonames.data.CountrySubdivision
		 */	
		public static function parseCountrySubdivision(node:XML):CountrySubdivision
		{
			var subdivision:CountrySubdivision = new CountrySubdivision();
			subdivision.adminCode1 = node.adminCode1;
			subdivision.adminName1 = node.adminName1;
			subdivision.countryCode = node.countryCode;
			subdivision.countryName = node.countryName;
			subdivision.distance = node.distance;
			var codes:Array = [];
			for each (var codeNode:XML in node..code)
			{
				var code:Code = new Code();
				code.type = codeNode.@type;
				code.value = codeNode.valueOf();
				codes.push(code);
			}
			subdivision.codes = codes;
			return subdivision;
		}
		
		/**
		 * Creates a <code>Intersection</code> object.
		 * 
		 * @param node The XML representation of the intersection.
		 * @return A new <code>Intersection</code> object.
		 * 
		 * @see org.geonames.data.Intersection
		 */
		public static function parseIntersection(node:XML):Intersection
		{
			var intersection:Intersection = new Intersection();
			intersection.street = node.street1;
			intersection.street2 = node.street2;
			intersection.latitude = node.lat;
			intersection.longitude = node.lng;
			intersection.distance = node.distance;
			intersection.postalCode = node.postalcode;
			intersection.placeName = node.placename;
			intersection.adminCode1 = node.adminCode1;
			intersection.adminName1 = node.adminName1;
			intersection.adminName2 = node.adminName2;
			intersection.countryCode = node.countryCode;
			return intersection;
		}
		
		/**
		 * Creates a <code>Neighbourhood</code> object.
		 * 
		 * @param node The XML representation of the neighbourhood.
		 * @return A new <code>Neighbourhood</code> object.
		 * 
		 * @see org.geonames.data.Neighbourhood
		 */
		public static function parseNeighbourhood(node:XML):Neighbourhood
		{
			var neighborhood:Neighbourhood = new Neighbourhood();
			neighborhood.adminCode1 = node.adminCode1;
			neighborhood.adminCode2 = node.adminCode2;
			neighborhood.adminName1 = node.adminName1;
			neighborhood.adminName2 = node.adminName2;
			neighborhood.city = node.city;
			neighborhood.countryCode = node.countryCode;
			neighborhood.countryName = node.countryName;
			neighborhood.name = node.name;
			return neighborhood;
		}
		
		/**
		 * Creates a <code>PostalCode</code> object.
		 * 
		 * @param node The XML representation of the postal code.
		 * @return A new <code>PostalCode</code> object.
		 * 
		 * @see org.geonames.data.PostalCode
		 */
		public static function parsePostalCode(node:XML):PostalCode
		{
			var postalCode:PostalCode = new PostalCode();
			postalCode.adminCode1 = node.adminCode1;
			postalCode.adminCode2 = node.adminCode2;
			postalCode.adminCode3 = node.adminCode3;
			postalCode.adminName1 = node.adminName1;
			postalCode.adminName2 = node.adminName2;
			postalCode.adminName3 = node.adminName3;
			postalCode.postalCode = node.postalcode;
			postalCode.name  = node.name;
			postalCode.distance = node.distance;
			postalCode.countryCode = node.countryCode;
			postalCode.latitude = node.lat;
			postalCode.longitude = node.lng;
			return postalCode;
		}
		
		/**
		 * Creates a <code>PostalCodeCountryInfo</code> object.
		 * 
		 * @param node The XML representation of the postal code country info.
		 * @return A new <code>PostalCodeCountryInfo</code> object.
		 * 
		 * @see org.geonames.data.PostalCodeCountryInfo
		 */
		public static function parsePostalCodeCountryInfo(node:XML):PostalCodeCountryInfo
		{
			var info:PostalCodeCountryInfo = new PostalCodeCountryInfo();
			info.countryCode = node.countryCode;
			info.countryName = node.countryName;
			info.maxPostalCode = node.maxPostalCode;
			info.minPostalCode = node.minPostalCode;
			info.numPostalCodes = node.numPostalCodes;
			return info;
		}
		
		/**
		 * Creates a <code>StreetSegment</code> object.
		 * 
		 * @param node The XML representation of the street segment.
		 * @return A new <code>StreetSegment</code> object.
		 * 
		 * @see org.geonames.data.StreetSegment
		 */
		public static function parseStreetSegment(node:XML):StreetSegment
		{
			var segment:StreetSegment = new StreetSegment();
			segment.line = node.line;
			segment.distance = node.distance;
			segment.mtfcc = node.mtfcc;
			segment.name = node.name;
			segment.placeName = node.placename;
			segment.fraddl = node.fraddl;
			segment.fraddr = node.fraddr;
			segment.toaddl = node.toaddl;
			segment.toaddr = node.toaddr;
			segment.postalCode = node.postalcode;
			segment.placeName = node.placename;
			segment.adminCode1 = node.adminCode1;
			segment.adminCode2 = node.adminCode2;
			segment.adminName1 = node.adminName1;
			segment.adminName2 = node.adminName2;
			segment.countryCode = node.countryCode;
			return segment;
		}
		
		/**
		 * Creates a <code>Toponym</code> object.
		 * 
		 * @param node The XML representation of the toponym.
		 * @param style Passed in by the <code>parseToponymResult</code> method.
		 * @return A new <code>Toponym</code> object.
		 * 
		 * @see org.geonames.data.Toponym
		 */		
		public static function parseToponym(node:XML, style:String = null):Toponym
		{
			var toponym:Toponym = new Toponym();
			toponym.adminCode1 = node.adminCode1;
			toponym.adminCode2 = node.adminCode2;
			toponym.adminName1 = node.adminName1;
			toponym.adminName2 = node.adminName2;
			toponym.alternateNames = node.alternateNames;
			var altNames:Object = {};
			for each (var altName:XML in node..alternateName)
			{
				altNames[altName.@lang] = altName.toString();
			}
			toponym.alternateNamesByLanguage = altNames;
			toponym.continentCode = node.continentCode;
			toponym.countryCode = node.countryCode;
			toponym.countryName = node.countryName;
			toponym.distance = node.distance;
			toponym.elevation = node.elevation;
			toponym.featureClass = node.fcl;
			toponym.featureClassName = node.fclName;
			toponym.featureCode = node.fcode;
			toponym.featureCodeName = node.fcodeName;
			toponym.geoNameId = node.geonameId;
			toponym.latitude = node.lat;
			toponym.longitude = node.lng;
			toponym.name = node.name;
			toponym.numberOfChildren = node.numberOfChildren;
			toponym.population = node.population;
			var timezone:Timezone = new Timezone();
			timezone.dstOffset = node.timezone.@dstOffset;
			timezone.gmtOffset = node.timezone.@gmtOffset;
			timezone.timezone = node.timezone;
			toponym.timezone = timezone;
			return toponym;
		}
		
		/**
		 * Creates a <code>WeatherObservation</code> object.
		 * 
		 * @param node The XML representation of the weather observation.
		 * @return A new <code>WeatherObservation</code> object.
		 * 
		 * @see org.geonames.data.WeatherObservation
		 */
		public static function parseWeatherObservation(node:XML):WeatherObservation
		{
			var observation:WeatherObservation = new WeatherObservation();
			observation.clouds = node.clouds;
			observation.countryCode = node.countryCode;
			observation.dewPoint = node.dewPoint;
			observation.elevation = node.elevation;
			observation.hectoPascAltimeter = node.hectoPascAltimeter;
			observation.humidity = node.humidity;
			observation.ICAO = node.ICAO;
			observation.latitude = node.lat;
			observation.longitude = node.lng;
			observation.observation = node.observation;
			observation.observationTime = new Date(node.observationTime);
			observation.stationName = node.stationName;
			observation.temperature = node.temperature;
			observation.weatherCondition = node.weatherCondition;
			observation.windDirection = node.windDirection;
			observation.windSpeed = node.windSpeed;
			return observation;
		}
		
		/**
		 * Creates a <code>WikipediaEntry</code> object.
		 * 
		 * @param node The XML representation of the wikipedia entry.
		 * @return A new <code>WikipediaEntry</code> object.
		 * 
		 * @see org.geonames.data.WikipediaEntry
		 */
		public static function parseWikipediaEntry(node:XML):WikipediaEntry
		{
			var entry:WikipediaEntry = new WikipediaEntry();
			entry.countryCode = node.countryCode;
			entry.language = node.lang;
			entry.elevation = node.altitude;
			entry.title = node.title;
			entry.summary = node.summary;
			entry.feature = node.feature;
			entry.wikipediaUrl = node.wikipediaUrl;
			entry.thumbnailImg = node.thumbnailImg;
			entry.latitude = node.lat;
			entry.longitude = node.lng;
			entry.population = node.population;
			return entry;
		}
		
		/**
		 * Creates a <code>PostalCodeResult</code> object.
		 * 
		 * @param data The XML representation of the postal code result.
		 * @return A new <code>PostalCodeResult</code> object.
		 * 
		 * @see org.geonames.data.PostalCodeResult
		 */
		public static function parsePostalCodeResult(data:XML):PostalCodeResult
		{
			var result:PostalCodeResult = new PostalCodeResult();
			result.total = data.totalResultsCount;
			var postalCodes:Array = [];
			var postalCode:PostalCode;
			for each (var node:XML in data..code)
			{
				postalCodes.push(parsePostalCode(node));
			}
			result.postalCodes = postalCodes;
			return result;
		}
		
		/**
		 * Creates a <code>Timezone</code> object.
		 * 
		 * @param node The XML representation of the timezone.
		 * @return A new <code>Timezone</code> object.
		 * 
		 * @see org.geonames.data.Timezone
		 */
		public static function parseTimezone(node:XML):Timezone
		{
			var timezone:Timezone = new Timezone();
			timezone.countryCode = node.countryCode;
			timezone.countryName = node.countryName;
			timezone.dstOffset = node.dstOffset;
			timezone.gmtOffset = node.gmtOffset;
			timezone.latitude = node.lat;
			timezone.longitude = node.lng;
			timezone.rawOffset = node.rawOffset;
			timezone.time = new Date(node.time);
			timezone.timezone = node.timezoneId;
			return timezone;
		}
		
		/**
		 * Creates a <code>Ocean</code> object.
		 * 
		 * @param node The XML representation of the ocean.
		 * @return A new <code>Ocean</code> object.
		 * 
		 * @see org.geonames.data.Ocean
		 */
		public static function parseOcean(node:XML):Ocean
		{
			var ocean:Ocean = new Ocean();
			ocean.name = node.name;
			return ocean;
		}
		
		/**
		 * Creates a <code>ToponymResult</code> object.
		 * 
		 * @param node The XML representation of the toponym result.
		 * @return A new <code>ToponymResult</code> object.
		 * 
		 * @see org.geonames.data.ToponymResult
		 */	
		public static function parseToponymResult(data:XML):ToponymResult
		{
			var result:ToponymResult = new ToponymResult();
			var style:String = data.@style;
			result.style = style;
			result.total = data.totalResultsCount;
			var toponyms:Array = [];
			for each (var node:XML in data..geoname)
			{
				toponyms.push(parseToponym(node, style));
			}
			result.toponyms = toponyms;
			return result;
		}
		
		/**
		 * @private
		 *  
		 * Utility function parse repeated elements.
		 * 
		 * @param elementName The repeated element name.
		 * @param parseFunction The function used to parse the repeated element.
		 * @param data The data containing the repeated elements.
		 * @return An array of the repeated elements.
		 * 
		 */		
		private static function parseRepeatedElements(elementName:String, parseFunction:Function, data:XML):Array
		{
			var result:Array = [];
			
			for each (var node:XML in data.descendants(elementName))
			{
				result.push(parseFunction(node));
			}
			
			return result;
		}
		
		/**
		 * Creates a <code>GeoNamesException</code> object.
		 * 
		 * @param node The XML representation of the exception.
		 * @return A new <code>GeoNamesException</code> object.
		 * 
		 * @see org.geonames.data.GeoNamesException
		 */
		public static function parseException(data:XML):GeoNamesException
		{
			var exception:GeoNamesException = new GeoNamesException();
			exception.code = data.value;
			exception.message = data.message;
			return exception;
		}
		
		/**
		 * @private
		 * 
		 * Method that checks for GeoNamesExceptions.
		 * 
		 * @param data Raw data to check for GeoNames exception.
		 * @return True if there is an exception or false otherwise.
		 * 
		 */		
		private static function checkException(data:XML):Boolean
		{
			var status:XMLList = data.descendants("status");
			return status.length() > 0 ? true : false;
		}
		
		/**
		 * Determines the correct parse method for the returned data.
		 *  
		 * @param type The event type used to determine the correct parse method.
		 * @param data The raw data returned from the GeoNames server.
		 * @return The parsed result object.
		 * 
		 */		
		public static function parse(type:String, data:String):Object
		{
			var result:Object;
			
			// Check for any exceptions
			if (checkException(XML(data)))
				return parseException(XML(data));
			
			switch(type) 
			{
				case GeoNamesEvent.ASTERGDEM:
				case GeoNamesEvent.GTOPO30:
				case GeoNamesEvent.SRTM3:
					return Number(data);
					break;
				
				case GeoNamesEvent.CHILDREN:
				case GeoNamesEvent.HIERARCHY:
				case GeoNamesEvent.NEIGHBOURS:
				case GeoNamesEvent.SEARCH:
				case GeoNamesEvent.SIBLINGS:
					result = parseToponymResult(XML(data));
					break;
				
				case GeoNamesEvent.CITIES:
				case GeoNamesEvent.FIND_NEARBY:
				case GeoNamesEvent.FIND_NEARBY_PLACE_NAME:
					result = parseRepeatedElements("geoname", parseToponym, XML(data));
					break;
				
				case GeoNamesEvent.EXTENDED_FIND_NEARBY:
					result = parseExtendedFindNearby(XML(data));
					break;
				
				case GeoNamesEvent.COUNTRY_CODE:
					result = StringUtil.trim(data);
					break;
				
				case GeoNamesEvent.COUNTRY_INFO:
					result = parseRepeatedElements("country", parseCountry, XML(data));
					break;
				
				case GeoNamesEvent.COUNTRY_SUBDIVISION:
					result = parseRepeatedElements("countrySubdivision", parseCountrySubdivision, XML(data));
					break;
				
				case GeoNamesEvent.FIND_NEARBY_POSTAL_CODES:
					result = parseRepeatedElements("code", parsePostalCode, XML(data));
					break;
				
				case GeoNamesEvent.FIND_NEARBY_STREETS:
				case GeoNamesEvent.FIND_NEARBY_STREETS_OSM:
					result = parseRepeatedElements("streetSegment", parseStreetSegment, XML(data));
					break;
				
				case GeoNamesEvent.FIND_NEARBY_WEARTHER:
					result = parseRepeatedElements("observation", parseWeatherObservation, XML(data));
					break;
				
				case GeoNamesEvent.FIND_NEARBY_WIKIPEDIA:
				case GeoNamesEvent.WIKIPEDIA_BOUNDING_BOX:
				case GeoNamesEvent.WIKIPEDIA_SEARCH:
					result = parseRepeatedElements("entry", parseWikipediaEntry, XML(data));
					break;
				
				case GeoNamesEvent.FIND_NEAREST_ADDRESS:
					result = parseAddress(XML(data).address[0]);
					break;
				
				case GeoNamesEvent.FIND_NEAREST_INTERSECTION:
				case GeoNamesEvent.FIND_NEAREST_INTERSECTION_OSM:
					result = parseIntersection(XML(data).intersection[0]);
					break;
				
				case GeoNamesEvent.GET_TOPONYM:
					result = parseToponym(XML(data));
					break;
				
				case GeoNamesEvent.NEIGHBOURHOOD:
					result = parseNeighbourhood(XML(data).neighbourhood[0]);
					break;
				
				case GeoNamesEvent.OCEAN:
					result = parseOcean(XML(data).ocean[0]);
					break;
				
				case GeoNamesEvent.POSTAL_CODE_COUNTRY_INFO:
					result = parseRepeatedElements("country", parsePostalCodeCountryInfo, XML(data));
					break;
				
				case GeoNamesEvent.POSTAL_CODE_SEARCH:
					result = parsePostalCodeResult(XML(data));
					break;
				
				case GeoNamesEvent.TIMEZONE:
					result = parseTimezone(XML(data).timezone[0]);
					break;
				
			}
			
			return result;
		}
		
	}
}