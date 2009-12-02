package org.geonames.data
{
	import org.geonames.PostalCodeSearchResult;

	

	/**
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class XMLDataParser
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
			return address;
		}
		
		public static function parseCities(data:XML):Vector.<Toponym>
		{
			var cities:Vector.<Toponym> = new Vector.<Toponym>;
			
			for each (var node:XML in data..geoname)
			{
				cities.push(parseToponym(node));
			}
			
			return cities;
		}
		
		public static function parseCountryInfo(data:XML):Vector.<Country>
		{
			var countries:Vector.<Country> = new Vector.<Country>();
			for each (var node:XML in data..country)
			{
				countries.push(parseCountry(node));
			}
			return countries;
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
		
		public static function parseIntersection(node:XML):Intersection
		{
			var intersection:Intersection = new Intersection();
			return intersection;
		}
		
		public static function parseNeighborhood(node:XML):Neighborhood
		{
			var neighborhood:Neighborhood = new Neighborhood();
			neighborhood.adminCode1 = node.adminCode1;
			neighborhood.adminCode2 = node.adminCode2;
			neighborhood.adminName1 = node.adminCode1;
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
			toponym.elevation = node.elevation;
			toponym.featureClass = node.fcl;
			toponym.featureCode = node.fcode;
			toponym.geoNameId = node.geonameId;
			toponym.latitude = node.latitude;
			toponym.longitude = node.longitude;
			toponym.name = node.name;
			toponym.numberOfChildren = node.numberOfChildren;
			toponym.population = node.population;
			toponym.timezone = new Timezone(node.timezone.@dstOffset, 
											node.timezone.@gmOffset, 
											node.timezone);
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
		
		public static function parseWikipediaArticle(node:XML):WikipediaArticle
		{
			var article:WikipediaArticle = new WikipediaArticle();
			article.language = node.lang;
			article.elevation = node.altitude;
			article.title = node.title;
			article.summary = node.summary;
			article.feature = node.feature;
			article.wikipediaUrl = node.wikipediaArticle;
			article.thumbnailImg = node.thumbnailImg;
			article.latitude = node.latitude;
			article.longitude = node.longitude;
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
		
	}
}