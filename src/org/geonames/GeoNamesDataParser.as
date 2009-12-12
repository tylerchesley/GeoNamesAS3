package org.geonames
{
	import com.adobe.utils.StringUtil;
	
	import org.geonames.data.Address;
	import org.geonames.data.Code;
	import org.geonames.data.Country;
	import org.geonames.data.CountrySubdivision;
	import org.geonames.data.Intersection;
	import org.geonames.data.Neighbourhood;
	import org.geonames.data.Ocean;
	import org.geonames.data.PostalCode;
	import org.geonames.data.PostalCodeCountryInfo;
	import org.geonames.data.PostalCodeSearchResult;
	import org.geonames.data.StreetSegment;
	import org.geonames.data.Timezone;
	import org.geonames.data.Toponym;
	import org.geonames.data.ToponymSearchResult;
	import org.geonames.data.WeatherObservation;
	import org.geonames.data.WikipediaEntry;
	import org.geonames.events.GeoNamesEvent;
	
	/**
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class GeoNamesDataParser
	{
		
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
				code.type = codeNode.type;
				code.value = codeNode.valueOf();
				codes.push(code);
			}
			subdivision.codes = codes;
			return subdivision;
		}
		
		<intersection>
			<street1>Roble Ave</street1>
			<street2>Curtis St</street2>
			<lat>37.450649</lat>
			<lng>-122.180842</lng>
			<distance>0.08</distance>
			<postalcode>94025</postalcode>
			<placename>Menlo Park</placename>
			<adminName2>San Mateo</adminName2>
			<adminCode1>CA</adminCode1>
			<adminName1>California</adminName1>
			<countryCode>US</countryCode>
			</intersection>
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
		
		public static function parseNeighborhood(node:XML):Neighbourhood
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
		
		public static function parsePostalCode(node:XML):PostalCode
		{
			var postalCode:PostalCode = new PostalCode();
			postalCode.adminCode1 = node.adminCode1;
			postalCode.adminCode2 = node.adminCode2;
			postalCode.adminName1 = node.adminName1;
			postalCode.adminName2 = node.adminName2;
			postalCode.postalCode = node.postalCode;
			postalCode.placeName  = node.name;
			return postalCode;
		}
		
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
		
		public static function parseStreetSegment(node:XML):StreetSegment
		{
			var segment:StreetSegment = new StreetSegment();
			segment.line = node.line;
			segment.distance = node.distance;
			segment.mtfcc = node.mtfcc;
			segment.name = node.name;
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
		 * 
		 * @param node
		 * @param style
		 * @return 
		 * 
		 */		
		public static function parseToponym(node:XML, style:String = null):Toponym
		{
			var toponym:Toponym = new Toponym();
			toponym.adminCode1 = node.adminCode1;
			toponym.adminCode2 = node.adminCode2;
			toponym.adminName1 = node.adminName1;
			toponym.adminName2 = node.adminName2;
			toponym.alternateNames = node.alternateNames;
			toponym.countryCode = node.countryCode;
			toponym.countryName = node.countryName;
			toponym.distance = node.distance;
			toponym.elevation = node.elevation;
			toponym.featureClass = node.fcl;
			toponym.featureCode = node.fcode;
			toponym.geoNameId = node.geonameId;
			toponym.latitude = node.lat;
			toponym.longitude = node.lng;
			toponym.name = node.name;
			toponym.numberOfChildren = node.numberOfChildren;
			toponym.population = node.population;
			var timezone:Timezone = new Timezone();
			timezone.dstOffset = node.timezone.@dstOffset;
			timezone.gmtOffset = node.timezone.@gmOffset;
			timezone.timezone = node.timezone;
			toponym.timezone = timezone;
			return toponym;
		}
		
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
			observation.observationTime = node.observationTime;
			observation.stationName = node.stationName;
			observation.temperature = node.temperature;
			observation.weatherCondition = node.weatherCondition;
			observation.windDirection = node.windDirection;
			observation.windSpeed = node.windSpeed;
			return observation;
		}
		
		public static function parseWikipediaEntry(node:XML):WikipediaEntry
		{
			var article:WikipediaEntry = new WikipediaEntry();
			article.language = node.lang;
			article.elevation = node.altitude;
			article.title = node.title;
			article.summary = node.summary;
			article.feature = node.feature;
			article.wikipediaUrl = node.wikipediaUrl;
			article.thumbnailImg = node.thumbnailImg;
			article.latitude = node.lat;
			article.longitude = node.lng;
			article.population = node.population;
			return article;
		}
		
		public static function parsePostalCodeSearchResult(data:XML):PostalCodeSearchResult
		{
			var result:PostalCodeSearchResult = new PostalCodeSearchResult();
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
		
		public static function parseOcean(node:XML):Ocean
		{
			var ocean:Ocean = new Ocean();
			ocean.name = node.name;
			return ocean;
		}
		
		/**
		 * 
		 * @param data
		 * @return 
		 * 
		 */		
		public static function parseToponymSearchResult(data:XML):ToponymSearchResult
		{
			var result:ToponymSearchResult = new ToponymSearchResult();
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
		
		public static function parseRepeatedElements(elementName:String, parseFunction:Function, data:XML):Array
		{
			var result:Array = [];
			
			for each (var node:XML in data.descendants(elementName))
			{
				result.push(parseFunction(node));
			}
			
			return result;
		}
		
		public static function parse(type:String, data:String):Object
		{
			var result:Object;
			
			switch(type) 
			{
				case GeoNamesEvent.CHILDREN:
				case GeoNamesEvent.HIERARCHY:
				case GeoNamesEvent.NEIGHBOURS:
				case GeoNamesEvent.SEARCH:
				case GeoNamesEvent.SIBLINGS:
					result = parseToponymSearchResult(XML(data));
					break;
				
				case GeoNamesEvent.CITIES:
				case GeoNamesEvent.FIND_NEARBY_PLACE_NAME:
					result = parseRepeatedElements("geoname", parseToponym, XML(data));
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
					result = parseIntersection(XML(data).intersection[0]);
					break;
				
				case GeoNamesEvent.GET_TOPONYM:
					result = parseToponym(XML(data));
					break;
				
				case GeoNamesEvent.NEIGHBOURHOOD:
					result = parseNeighborhood(XML(data).neighbourhood[0]);
					break;
				
				case GeoNamesEvent.OCEAN:
					result = parseOcean(XML(data).ocean[0]);
					break;
				
				case GeoNamesEvent.POSTAL_CODE_COUNTRY_INFO:
					result = parseRepeatedElements("country", parsePostalCodeCountryInfo, XML(data));
					break;
				
				case GeoNamesEvent.POSTAL_CODE_SEARCH:
					result = parsePostalCodeSearchResult(XML(data));
					break;
				
				case GeoNamesEvent.TIMEZONE:
					result = parseTimezone(XML(data).timezone[0]);
					break;
				
			}
			
			return result;
		}
		
	}
}