package org.geonames.tests
{
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.geonames.GeoNamesService;
	import org.geonames.criteria.FindNearbyPostalCodesCriteria;
	import org.geonames.data.Address;
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
	
	public class GeoNamesServiceTest
	{
		
		private static var geonames:GeoNamesService = new GeoNamesService();
		
		private static const TIMEOUT:int = 5000;
		
		// Reference declaration for class to test
		private var classToTestRef : org.geonames.GeoNamesService;
		
		public function GeoNamesServiceTest()
		{
		}
		
		[Test(async)]
		// http://ws.geonames.org/astergdem?lat=50.01&lng=10.2 
		public function testAstergdem():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.ASTERGDEM, astergdemHandler, TIMEOUT);
			geonames.astergdem(50.01, 10.2);
		}
		
		private function astergdemHandler(event:GeoNamesEvent, params:*):void
		{
			Assert.assertEquals(192, event.data);
		}
		
		[Test(async)]
		// http://ws.geonames.org/children?geonameId=3175395
		public function testChildren():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.CHILDREN, childrenHandler, TIMEOUT);
			geonames.children(3175395);
		}
		
		/*<totalResultsCount>20</totalResultsCount>
		<geoname>
			<name>Abruzzo</name>
			<lat>42.25</lat>
			<lng>13.75</lng>
			<geonameId>3183560</geonameId>
			<countryCode>IT</countryCode>
			<countryName>Italy</countryName>
			<fcl>A</fcl>
			<fcode>ADM1</fcode>
			<numberOfChildren>4</numberOfChildren>
		</geoname>*/
		private function childrenHandler(event:GeoNamesEvent, params:*):void
		{
			var result:ToponymSearchResult = event.data as ToponymSearchResult;
			var toponym:Toponym = result.toponyms[0];
			Assert.assertEquals(20, result.total);
			Assert.assertEquals("Abruzzo", toponym.name);
			Assert.assertEquals(42.25, toponym.latitude);
			Assert.assertEquals(13.75, toponym.longitude);
			Assert.assertEquals(3183560, toponym.geoNameId);
			Assert.assertEquals("IT", toponym.countryCode);
			Assert.assertEquals("Italy", toponym.countryName);
			Assert.assertEquals("A", toponym.featureClass);
			Assert.assertEquals("ADM1", toponym.featureCode);
			Assert.assertEquals(4, toponym.numberOfChildren);
		}
		
		[Test(async)]
		// http://ws.geonames.org/cities?north=44.1&south=-9.9&east=-22.4&west=55.2
		public function testCities():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.CITIES, citiesHandler, TIMEOUT);
			geonames.cities(44.1, -9.9, -22.4, 55.2);
		}
		
		/*<geoname>
			<name>Mexico City</name>
			<lat>19.4341667</lat>
			<lng>-99.1386111</lng>
			<geonameId>3530597</geonameId>
			<countryCode>MX</countryCode>
			<countryName>Mexico</countryName>
			<fcl>P</fcl>
			<fcode>PPLC</fcode>
		</geoname>*/
		private function citiesHandler(event:GeoNamesEvent, params:*):void
		{
			var city:Toponym = event.data[0];
			Assert.assertEquals("Mexico City", city.name);
			Assert.assertEquals(19.4341667, city.latitude);
			Assert.assertEquals(-99.1386111, city.longitude);
			Assert.assertEquals(3530597, city.geoNameId);
			Assert.assertEquals("MX", city.countryCode);
			Assert.assertEquals("Mexico", city.countryName);
			Assert.assertEquals("P", city.featureClass);
			Assert.assertEquals("PPLC", city.featureCode);
		}
		
		[Test(async)]
		// http://ws.geonames.org/countryCode?lat=47.03&lng=10.2
		public function testCountryCode():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.COUNTRY_CODE, countryCodeHandler, TIMEOUT);
			geonames.countryCode(47.03, 10.2);
		}
		
		private function countryCodeHandler(event:GeoNamesEvent, params:*):void
		{
			Assert.assertEquals("AT", event.data);
		}
		
		[Test(async)]
		// http://ws.geonames.org/countryInfo?
		public function testCountryInfo():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.COUNTRY_INFO, countryInfoHandler, TIMEOUT);
			geonames.countryInfo("AD");
		}
		
		/*<country>
			<countryCode>AD</countryCode>
			<countryName>Andorra</countryName>
			<isoNumeric>20</isoNumeric>
			<isoAlpha3>AND</isoAlpha3>
			<fipsCode>AN</fipsCode>
			<continent>EU</continent>
			<capital>Andorra la Vella</capital>
			<areaInSqKm>468.0</areaInSqKm>
			<population>72000</population>
			<currencyCode>EUR</currencyCode>
			<languages>ca,fr-AD,pt</languages>
			<geonameId>3041565</geonameId>
			<bBoxWest>1.42211079597473</bBoxWest>
			<bBoxNorth>42.6586990356445</bBoxNorth>
			<bBoxEast>1.78038918972015</bBoxEast>
			<bBoxSouth>42.4350738525391</bBoxSouth>
		</country>*/
		private function countryInfoHandler(event:GeoNamesEvent, params:*):void
		{
			var country:Country = event.data[0];
			Assert.assertEquals("AD", country.countryCode);
			Assert.assertEquals("Andorra", country.countryName);
			Assert.assertEquals(20, country.isoNumeric);
			Assert.assertEquals("AND", country.isoAlpha3);
			Assert.assertEquals("AN", country.fipsCode);
			Assert.assertEquals("EU", country.continent);
			Assert.assertEquals("Andorra la Vella", country.capital);
			Assert.assertEquals(468.0, country.areaInSqKm);
			Assert.assertEquals(72000, country.population);
			Assert.assertEquals("EUR", country.currencyCode);
			Assert.assertEquals("ca,fr-AD,pt", country.languages);
			Assert.assertEquals(3041565, country.geonameId);
			Assert.assertEquals(1.42211079597473, country.bBoxWest);
			Assert.assertEquals(42.6586990356445, country.bBoxNorth);
			Assert.assertEquals(1.78038918972015, country.bBoxEast);
			Assert.assertEquals(42.4350738525391, country.bBoxSouth);
		}
		
		[Test(async)]
		// http://ws.geonames.org/countrySubdivision?lat=47.03&lng=10.2&maxRows=10&radius=40
		public function testCountrySubdivision():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.COUNTRY_SUBDIVISION, 
				countrySubdivisionHandler, TIMEOUT);
			geonames.countrySubdivision(47.03, 10.2, 40, 10);
		}
		
		/*<countrySubdivision>
			<countryCode>AT</countryCode>
			<countryName>Austria</countryName>
			<adminCode1>07</adminCode1>
			<adminName1>Tyrol</adminName1>
			<code type="FIPS10-4">07</code>
			<code type="ISO3166-2">7</code>
			<distance>0.0</distance>
		</countrySubdivision>*/
		private function countrySubdivisionHandler(event:GeoNamesEvent, params:*):void
		{
			var subdivisions:Array = event.data as Array;
			var subdivision:CountrySubdivision = subdivisions[0];
			Assert.assertEquals(5, subdivisions.length);
			Assert.assertEquals("AT", subdivision.countryCode);
			Assert.assertEquals("Austria", subdivision.countryName);
			Assert.assertEquals(07, subdivision.adminCode1);
			Assert.assertEquals("Tyrol", subdivision.adminName1);
			Assert.assertEquals(0.0, subdivision.distance);
			Assert.assertEquals(2, subdivision.codes.length);
		}
		
		[Test(async)]
		// http://ws.geonames.org/findNearbyPlaceName?lat=47.3&lng=9
		public function testFindNearbyPlaceName():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.FIND_NEARBY_PLACE_NAME, 
				findNearbyPlaceNameHandler, TIMEOUT);
			geonames.findNearbyPlaceName(47.3, 9);
		}
		
		/*<geoname>
			<name>Atzmännig</name>
			<lat>47.287633</lat>
			<lng>8.988454</lng>
			<geonameId>6559633</geonameId>
			<countryCode>CH</countryCode>
			<countryName>Switzerland</countryName>
			<fcl>P</fcl>
			<fcode>PPL</fcode>
			<distance>1.6276</distance>
		</geoname>*/
		private function findNearbyPlaceNameHandler(event:GeoNamesEvent, params:*):void
		{
			var toponyms:Array = event.data as Array;
			var toponym:Toponym = toponyms[0];
			Assert.assertEquals(1, toponyms.length);
			Assert.assertEquals("Atzmännig", toponym.name);
			Assert.assertEquals(47.287633, toponym.latitude);
			Assert.assertEquals(8.988454, toponym.longitude);
			Assert.assertEquals(6559633, toponym.geoNameId);
			Assert.assertEquals("CH", toponym.countryCode);
			Assert.assertEquals("Switzerland", toponym.countryName);
			Assert.assertEquals("P", toponym.featureClass);
			Assert.assertEquals("PPL", toponym.featureCode);
			Assert.assertEquals(1.6276, toponym.distance);
		}
		
		[Test(async)]
		// http://ws.geonames.org/findNearbyPostalCodes?lat=47&lng=9
		public function testFindNearbyPostalCodes():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.FIND_NEARBY_POSTAL_CODES, 
				findNearbyPostalCodesHandler, TIMEOUT);
			var criteria:FindNearbyPostalCodesCriteria = new FindNearbyPostalCodesCriteria();
			criteria.lat = 47;
			criteria.lng = 9;
			geonames.findNearbyPostalCodes(criteria);
		}
		
		/*<code>
			<postalcode>8750</postalcode>
			<name>Klöntal</name>
			<countryCode>CH</countryCode>
			<lat>47.0209991250926</lat>
			<lng>8.97896272642767</lng>
			<adminCode1>GL</adminCode1>
			<adminName1>Glarus</adminName1>
			<adminCode2>800</adminCode2>
			<adminName2>Glarus</adminName2>
			<adminCode3>1609</adminCode3>
			<adminName3>Glarus</adminName3>
			<distance>2.827649162427546</distance>
		</code>*/
		private function findNearbyPostalCodesHandler(event:GeoNamesEvent, params:*):void
		{
			var code:PostalCode = event.data[0] as PostalCode;
			Assert.assertEquals(8750, code.postalCode);
			Assert.assertEquals("Klöntal", code.name);
		}
		
		[Test(async)]
		// http://ws.geonames.org/findNearbyStreets?lat=37.451&lng=-122.18
		public function testFindNearbyStreets():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.FIND_NEARBY_STREETS, 
				findNearbyStreetsHandler, TIMEOUT);
			geonames.findNearbyStreets(37.451, -122.18);
		}
		
		/*<streetSegment>
			<line>
			-122.179753 37.451953,-122.17997 37.451692,-122.180624 37.450909,-122.180842 37.450649
			</line>
			<distance>0.06</distance>
			<mtfcc>S1400</mtfcc>
			<name>Roble Ave</name>
			<fraddl>601</fraddl>
			<fraddr>600</fraddr>
			<toaddl>735</toaddl>
			<toaddr>698</toaddr>
			<postalcode>94025</postalcode>
			<placename>Menlo Park</placename>
			<adminCode2>081</adminCode2>
			<adminName2>San Mateo</adminName2>
			<adminCode1>CA</adminCode1>
			<adminName1>California</adminName1>
			<countryCode>US</countryCode>
		</streetSegment>*/
		private function findNearbyStreetsHandler(event:GeoNamesEvent, params:*):void
		{
			var segment:StreetSegment = event.data[0];
			Assert.assertEquals("Roble Ave", segment.placeName);
			Assert.assertEquals(601, segment.fraddl);
			Assert.assertEquals(600, segment.fraddr);
			Assert.assertEquals(735, segment.toaddl);
			Assert.assertEquals(698, segment.toaddr);
		}
		
		[Test(async)]
		// http://ws.geonames.org/findNearByWeatherXML?lat=43&lng=-2
		public function testFindNearbyWeather():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.FIND_NEARBY_WEARTHER, 
				findNearbyWeatherHandler, TIMEOUT);
			geonames.findNearbyWeather(43, -2);
		}
		
		/*<observation>
			<observation>LESO 112030Z 05004KT 9999 FEW015 07/05 Q1020</observation>
			<observationTime>2009-12-11 20:30:00</observationTime>
			<stationName>San Sebastian / Fuenterrabia</stationName>
			<ICAO>LESO</ICAO>
			<countryCode>ES</countryCode>
			<elevation>8</elevation>
			<lat>43.35</lat>
			<lng>-1.8</lng>
			<temperature>7</temperature>
			<dewPoint>5</dewPoint>
			<humidity>87</humidity>
			<clouds>few clouds</clouds>
			<weatherCondition>n/a</weatherCondition>
			<hectoPascAltimeter>1020.0</hectoPascAltimeter>
			<windDirection>50.0</windDirection>
			<windSpeed>04</windSpeed>
		</observation>*/
		private function findNearbyWeatherHandler(event:GeoNamesEvent, params:*):void
		{
			var observation:WeatherObservation = event.data[0] as WeatherObservation;
			Assert.assertEquals("ES", observation.countryCode);
			Assert.assertEquals("San Sebastian / Fuenterrabia", observation.stationName);
		}
		
		[Test(async)]
		// http://ws.geonames.org/findNearbyWikipedia?lat=47&lng=9
		public function testFindNearbyWikipedia():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.FIND_NEARBY_WIKIPEDIA, 
				findNearbyWikipediaHandler, TIMEOUT);
			geonames.findNearbyWikipedia(47, 9);
		}
		
		/*<entry>
			<lang>en</lang>
			<title>Glärnisch</title>
			−
			<summary>
			The Glärnisch is a mountain of the Glarus Alps, Switzerland, consisting of two ridges of either side of the ''Glärnischfirn'' glacier: the ''Ruchen'' at 2901 m to the west, rising above the Klöntalersee, and the ''Bächistock'' at 2914 m to the southwest. The best known peak is the ''Vrenelisgärtli'' at 2904 m.  (...)
			</summary>
			<feature>mountain</feature>
			<countryCode>CH</countryCode>
			<population>0</population>
			<elevation>0</elevation>
			<lat>46.9986</lat>
			<lng>8.9986</lng>
			<wikipediaUrl>http://en.wikipedia.org/wiki/Gl%C3%A4rnisch</wikipediaUrl>
			<thumbnailImg/>
			<distance>0.1869</distance>
		</entry>*/
		private function findNearbyWikipediaHandler(event:GeoNamesEvent, params:*):void
		{
			var entry:WikipediaEntry = event.data[0];
			Assert.assertEquals("en", entry.language);
			Assert.assertEquals("Glärnisch", entry.title);
			Assert.assertNotNull(entry.summary);
			Assert.assertEquals("mountain", entry.feature);
			Assert.assertEquals(0, entry.population);
			Assert.assertEquals(0, entry.elevation);
			Assert.assertEquals(46.9986, entry.latitude);
			Assert.assertEquals(8.9986, entry.longitude);
			Assert.assertEquals("http://en.wikipedia.org/wiki/Gl%C3%A4rnisch", entry.wikipediaUrl);
			Assert.assertEquals("", entry.thumbnailImg);
		}
		
		[Test(async)]
		// http://ws.geonames.org/findNearestAddress?lat=37.451&lng=-122.18
		public function testFindNearestAddress():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.FIND_NEAREST_ADDRESS, 
				findNearestAddressHandler, TIMEOUT);
			geonames.findNearestAddress(37.451, -122.18);
		}
		
		/*<address>
			<street>Roble Ave</street>
			<streetNumber>671</streetNumber>
			<lat>37.45126961535734</lat>
			<lng>-122.1803227963682</lng>
			<distance>0.04</distance>
			<postalcode>94025</postalcode>
			<placename>Menlo Park</placename>
			<adminCode2>081</adminCode2>
			<adminName2>San Mateo</adminName2>
			<adminCode1>CA</adminCode1>
			<adminName1>California</adminName1>
			<countryCode>US</countryCode>
		</address>*/
		private function findNearestAddressHandler(event:GeoNamesEvent, params:*):void
		{
			var address:Address = event.data as Address;
			Assert.assertEquals("Roble Ave", address.street);
			Assert.assertEquals(671, address.streetNumber);
			Assert.assertEquals(37.45126961535734, address.latitude);
			Assert.assertEquals(-122.1803227963682, address.longitude);
			Assert.assertEquals(0.04, address.distance);
			Assert.assertEquals(94025, address.postalCode);
			Assert.assertEquals("Menlo Park", address.placeName);
			Assert.assertEquals("CA", address.adminCode1);
			Assert.assertEquals("California", address.adminName1);
			Assert.assertEquals("081", address.adminCode2);
			Assert.assertEquals("San Mateo", address.adminName2);
			Assert.assertEquals("US", address.countryCode);
		}
		
		[Test(async)]
		// http://ws.geonames.org/findNearestIntersection?lat=37.451&lng=-122.18
		public function testFindNearestIntersection():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.FIND_NEAREST_INTERSECTION, 
				findNearestIntersectionHandler, TIMEOUT);
			geonames.findNearestIntersection(37.451, -122.18);
		}
		
		/*<intersection>
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
		</intersection>*/
		private function findNearestIntersectionHandler(event:GeoNamesEvent, params:*):void
		{
			var intersection:Intersection = event.data as Intersection;
			Assert.assertEquals("Roble Ave", intersection.street);
			Assert.assertEquals("Curtis St", intersection.street2);
			Assert.assertEquals(37.450649, intersection.latitude);
			Assert.assertEquals(-122.180842, intersection.longitude);
			Assert.assertEquals(0.08, intersection.distance);
			Assert.assertEquals(94025, intersection.postalCode);
			Assert.assertEquals("Menlo Park", intersection.placeName);
			Assert.assertEquals("CA", intersection.adminCode1);
			Assert.assertEquals("California", intersection.adminName1);
			Assert.assertEquals("San Mateo", intersection.adminName2);
			Assert.assertEquals("US", intersection.countryCode);
		}
		
		[Test(async)]
		// http://ws.geonames.org/get?geonameId=6295630&style=short
		public function testGetToponym():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.GET_TOPONYM, 
				getToponymHandler, TIMEOUT);
			geonames.getToponym(6295630);
		}
		
		/*<geoname>
			<name>Earth</name>
			<lat>0.0</lat>
			<lng>0.0</lng>
			<geonameId>6295630</geonameId>
			<countryCode/>
			<countryName/>
			<fcl>L</fcl>
			<fcode/>
			<fclName>parks,area, ...</fclName>
			<fcodeName/>
			<population/>
			<alternateNames>
				Aarde,Earth,Erde,Foeld,Föld,Globe,Jorden,Lurra,Maa,Mondo,Mundo,Mundua,Orbs,Pamant,Pamânt,Planeta Tierra,Tero,Terra,Terre,Tierra,Zemlja,el mon,el món,el planeta,nuestro planeta,Γη,Υδρόγειος,Земля
			</alternateNames>
			<elevation/>
			<adminCode1>20</adminCode1>
			<adminName1>Opština Priština</adminName1>
			<adminCode2/>
			<adminName2/>
			<timezone dstOffset="2.0" gmtOffset="1.0">Europe/Zurich</timezone>
		</geoname>*/
		private function getToponymHandler(event:GeoNamesEvent, params:*):void
		{
			var toponym:Toponym = event.data as Toponym;
			Assert.assertEquals("Earth", toponym.name);
			Assert.assertEquals(0, toponym.latitude);
			Assert.assertEquals(0, toponym.longitude);
			Assert.assertEquals(6295630, toponym.geoNameId);
			Assert.assertEquals("L", toponym.featureClass);
			Assert.assertEquals(20, toponym.adminCode1);
			Assert.assertEquals("Opština Priština", toponym.adminName1);
		}
		
		[Test(async)]
		// http://ws.geonames.org/gtopo30?lat=47.01&lng=10.2
		public function testGtopo30():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.GTOPO30, gtopo30Handler, TIMEOUT);
			geonames.gtopo30(47.01, 10.2);
		}
		
		private function gtopo30Handler(event:GeoNamesEvent, params:*):void
		{
			Assert.assertEquals(2632, event.data);
		}
		
		[Test(async)]
		// http://ws.geonames.org/hierarchy?geonameId=2657896
		public function testHierarchy():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.HIERARCHY, 
				hierarchyHandler, TIMEOUT);
			geonames.hierarchy(2657896);
		}
		
		/*<geoname>
			<name>Earth</name>
			<lat>0.0</lat>
			<lng>0.0</lng>
			<geonameId>6295630</geonameId>
			<countryCode/>
			<countryName/>
			<fcl>L</fcl>
			<fcode/>
		</geoname>*/
		private function hierarchyHandler(event:GeoNamesEvent, params:*):void
		{
			var result:ToponymSearchResult = event.data as ToponymSearchResult;
			var toponym:Toponym = result.toponyms[0];
			Assert.assertEquals("Earth", toponym.name);
			Assert.assertEquals(0, toponym.latitude);
			Assert.assertEquals(0, toponym.longitude);
			Assert.assertEquals("L", toponym.featureClass);
		}
		
		[Test(async)]
		// http://ws.geonames.org/neighbourhood?lat=40.78343&lng=-73.96625
		public function testNeighbourhood():void 
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.NEIGHBOURHOOD, 
				neighbourhoodHandler, TIMEOUT);
			geonames.neighbourhood(40.78343, -73.96625);
		}
		
		/*<neighbourhood>
			<countryCode>US</countryCode>
			<countryName>United States</countryName>
			<adminCode1>NY</adminCode1>
			<adminName1>New York</adminName1>
			<adminCode2>061</adminCode2>
			<adminName2>New York County</adminName2>
			<city>New York City-Manhattan</city>
			<name>Central Park</name>
		</neighbourhood>*/
		private function neighbourhoodHandler(event:GeoNamesEvent, params:*):void
		{
			var neighbourhood:Neighbourhood = event.data as Neighbourhood;
			Assert.assertEquals("US", neighbourhood.countryCode);
			Assert.assertEquals("United States", neighbourhood.countryName);
			Assert.assertEquals("NY", neighbourhood.adminCode1);
			Assert.assertEquals("New York", neighbourhood.adminName1);
			Assert.assertEquals("061", neighbourhood.adminCode2);
			Assert.assertEquals("New York County", neighbourhood.adminName2);
			Assert.assertEquals("New York City-Manhattan", neighbourhood.city);
			Assert.assertEquals("Central Park", neighbourhood.name);
		}
		
		[Test(async)]
		// http://ws.geonames.org/neighbours?geonameId=2658434
		public function testNeighbours():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.NEIGHBOURS, 
				neighboursHandler, TIMEOUT);
			geonames.neighbours(2658434);
		}
		
		/*<geoname>
			<name>Austria</name>
			<lat>47.3333333</lat>
			<lng>13.3333333</lng>
			<geonameId>2782113</geonameId>
			<countryCode>AT</countryCode>
			<countryName>Austria</countryName>
			<fcl>A</fcl>
			<fcode>PCLI</fcode>
		</geoname>*/
		private function neighboursHandler(event:GeoNamesEvent, params:*):void
		{
			var result:ToponymSearchResult = event.data as ToponymSearchResult;
			var toponym:Toponym = result.toponyms[0];
			Assert.assertEquals(5, result.toponyms.length);
			Assert.assertEquals("Austria", toponym.name);
			Assert.assertEquals(47.3333333, toponym.latitude);
			Assert.assertEquals(13.3333333, toponym.longitude);
			Assert.assertEquals("AT", toponym.countryCode);
			Assert.assertEquals("Austria", toponym.countryName);
			Assert.assertEquals("A", toponym.featureClass);
			Assert.assertEquals("PCLI", toponym.featureCode);
		}
		
		[Test(async)]
		// http://ws.geonames.org/ocean?lat=40.78343&lng=-43.96625
		public function testOceans():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.OCEAN, 
				oceanHandler, TIMEOUT);
			geonames.ocean(40.78343, -43.96625);
		}
		
		/*<ocean>
			<name>North Atlantic Ocean</name>
		</ocean>*/
		private function oceanHandler(event:GeoNamesEvent, params:*):void
		{
			var ocean:Ocean = event.data as Ocean;
			Assert.assertEquals("North Atlantic Ocean", ocean.name);
		}
		
		[Test(async)]
		// http://ws.geonames.org/postalCodeCountryInfo?
		public function testPostalCodeCountryInfo():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.POSTAL_CODE_COUNTRY_INFO, 
				postalCodeCountryInfoHandler, TIMEOUT);
			geonames.postalCodeCountryInfo();
		}
		
		/*<country>
			<countryCode>AD</countryCode>
			<countryName>Andorra</countryName>
			<numPostalCodes>7</numPostalCodes>
			<minPostalCode>AD100</minPostalCode>
			<maxPostalCode>AD700</maxPostalCode>
		</country>*/
		private function postalCodeCountryInfoHandler(event:GeoNamesEvent, params:*):void
		{
			var country:PostalCodeCountryInfo = event.data[0] as PostalCodeCountryInfo;
			Assert.assertEquals("AD", country.countryCode);
			Assert.assertEquals("Andorra", country.countryName);
			Assert.assertEquals(7, country.numPostalCodes);
			Assert.assertEquals("AD100", country.minPostalCode);
			Assert.assertEquals("AD700", country.maxPostalCode);
		}
		
		[Test(async)]
		// http://ws.geonames.org/postalCodeSearch?postalcode=9011&maxRows=10
		public function testPostalCodeSearch():void
		{
			/*var criteria:PostalCodeSearchCriteria = new PostalCodeSearchCriteria("9011");
			Async.handleEvent(this, geonames, GeoNamesEvent.POSTAL_CODE_SEARCH, 
				postalCodeSearchHandler, TIMEOUT);
			geonames.postalCodeSearch(criteria);*/
		}
		
		private function postalCodeSearchHandler(event:GeoNamesEvent):void
		{
			var result:PostalCodeSearchResult = event.data as PostalCodeSearchResult;
			Assert.assertEquals(10, result.total);
		}
		
		[Test(async)]
		public function testSearch():void
		{
			
		}
		
		[Test(async)]
		// http://ws.geonames.org/siblings?geonameId=3017382
		public function testSiblings():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.SIBLINGS, 
				siblingsHandler, TIMEOUT);
			geonames.siblings(3017382);
		}
		
		/*<geoname>
			<name>Albania</name>
			<lat>41.0</lat>
			<lng>20.0</lng>
			<geonameId>783754</geonameId>
			<countryCode>AL</countryCode>
			<countryName>Albania</countryName>
			<fcl>A</fcl>
			<fcode>PCLI</fcode>
		</geoname>*/
		private function siblingsHandler(event:GeoNamesEvent, params:*):void
		{
			var result:ToponymSearchResult = event.data as ToponymSearchResult;
			var toponym:Toponym = result.toponyms[0];
			Assert.assertEquals(48, result.total);
			Assert.assertEquals("Albania", toponym.name);
			Assert.assertEquals(41.0, toponym.latitude);
			Assert.assertEquals(783754, toponym.geoNameId);
			Assert.assertEquals("AL", toponym.countryCode);
			Assert.assertEquals("Albania", toponym.countryName);
			Assert.assertEquals("A", toponym.featureClass);
			Assert.assertEquals("PCLI", toponym.featureCode);
		}
		
		[Test(async)]
		// http://ws.geonames.org/timezone?lat=47.01&lng=10.2
		public function testTimezone():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.TIMEZONE, 
				timezoneHandler, TIMEOUT);
			geonames.timezone(47.01, 10.2);
		}
		
		/*<timezone>
			<countryCode>AT</countryCode>
			<countryName>Austria</countryName>
			<lat>47.01</lat>
			<lng>10.2</lng>
			<timezoneId>Europe/Vienna</timezoneId>
			<dstOffset>2.0</dstOffset>
			<gmtOffset>1.0</gmtOffset>
			<rawOffset>1.0</rawOffset>
			<time>2009-12-11 21:09</time>
		</timezone>*/
		private function timezoneHandler(event:GeoNamesEvent, params:*):void
		{
			var timezone:Timezone = event.data as Timezone;
			Assert.assertEquals("AT", timezone.countryCode);
			Assert.assertEquals("Austria", timezone.countryName);
			Assert.assertEquals(47.01, timezone.latitude);
			Assert.assertEquals(10.2, timezone.longitude);
			Assert.assertEquals("Europe/Vienna", timezone.timezone);
			Assert.assertEquals(2.0, timezone.dstOffset);
			Assert.assertEquals(1.0, timezone.gmtOffset);
			Assert.assertEquals(1.0, timezone.rawOffset);
		}
		
		[Test(async)]
		// http://ws.geonames.org/wikipediaBoundingBox?north=44.1&south=-9.9&east=-22.4&west=55.2
		public function testWikipediaBoundingBox():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.WIKIPEDIA_BOUNDING_BOX, 
				wikipediaBoundingBoxHandler, TIMEOUT);
			geonames.wikipediaBoundingBox(44.1, -9.9, -22.4, 55.2);
		}
		
		private function wikipediaBoundingBoxHandler(event:GeoNamesEvent, params:*):void
		{
			var entries:Array = event.data as Array;
			var first:WikipediaEntry = entries[0];
			var last:WikipediaEntry = entries[entries.length - 1];
			Assert.assertEquals("Chongqing", first.title);
			Assert.assertEquals("India", last.title);
		}
		
		[Test(async)]
		// http://ws.geonames.org/wikipediaSearch?q=london&maxRows=10
		public function testWikipediaSearch():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.WIKIPEDIA_SEARCH, 
				wikipediaSearchHandler, TIMEOUT);
			geonames.wikipediaSearch("london");
		}
		
		private function wikipediaSearchHandler(event:GeoNamesEvent, params:*):void
		{
			var entries:Array = event.data as Array;
			var first:WikipediaEntry = entries[0];
			var last:WikipediaEntry = entries[entries.length - 1];
			var middle:WikipediaEntry = entries[4];
			Assert.assertEquals("London", first.title);
			Assert.assertEquals("London Arch", last.title);
			Assert.assertEquals("London Borough of Lewisham", middle.title);
		}
		
	}
}