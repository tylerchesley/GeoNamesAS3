package org.geonames.tests
{
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.geonames.GeoNames;
	import org.geonames.data.Address;
	import org.geonames.data.Country;
	import org.geonames.data.CountrySubdivision;
	import org.geonames.data.Intersection;
	import org.geonames.data.Neighbourhood;
	import org.geonames.data.Ocean;
	import org.geonames.data.PostalCodeCountryInfo;
	import org.geonames.data.StreetSegment;
	import org.geonames.data.Timezone;
	import org.geonames.data.Toponym;
	import org.geonames.data.ToponymSearchResult;
	import org.geonames.data.WeatherObservation;
	import org.geonames.data.WikipediaEntry;
	import org.geonames.events.GeoNamesEvent;
	
	public class GeoNamesTest
	{
		
		private static var geonames:GeoNames = new GeoNames();
		
		private static const TIMEOUT:int = 1000000;
		
		// Reference declaration for class to test
		private var classToTestRef : org.geonames.GeoNames;
		
		public function GeoNamesTest()
		{
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
			Assert.assertEquals(result.total, 20);
			Assert.assertEquals(toponym.name, "Abruzzo");
			Assert.assertEquals(toponym.latitude, 42.25);
			Assert.assertEquals(toponym.longitude, 13.75);
			Assert.assertEquals(toponym.geoNameId, 3183560);
			Assert.assertEquals(toponym.countryCode, "IT");
			Assert.assertEquals(toponym.countryName, "Italy");
			Assert.assertEquals(toponym.featureClass, "A");
			Assert.assertEquals(toponym.featureCode, "ADM1");
			Assert.assertEquals(toponym.numberOfChildren, 4);
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
			Assert.assertEquals(city.name, "Mexico City");
			Assert.assertEquals(city.latitude, 19.4341667);
			Assert.assertEquals(city.longitude, -99.1386111);
			Assert.assertEquals(city.geoNameId, 3530597);
			Assert.assertEquals(city.countryCode, "MX");
			Assert.assertEquals(city.countryName, "Mexico");
			Assert.assertEquals(city.featureClass, "P");
			Assert.assertEquals(city.featureCode, "PPLC");
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
			Assert.assertEquals(event.data, "AT");
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
			Assert.assertEquals(country.countryCode, "AD");
			Assert.assertEquals(country.countryName, "Andorra");
			Assert.assertEquals(country.isoNumeric, 20);
			Assert.assertEquals(country.isoAlpha3, "AND");
			Assert.assertEquals(country.fipsCode, "AN");
			Assert.assertEquals(country.continent, "EU");
			Assert.assertEquals(country.capital, "Andorra la Vella");
			Assert.assertEquals(country.areaInSqKm, 468.0);
			Assert.assertEquals(country.population, 72000);
			Assert.assertEquals(country.currencyCode, "EUR");
			Assert.assertEquals(country.languages, "ca,fr-AD,pt");
			Assert.assertEquals(country.geonameId, 3041565);
			Assert.assertEquals(country.bBoxWest, 1.42211079597473);
			Assert.assertEquals(country.bBoxNorth, 42.6586990356445);
			Assert.assertEquals(country.bBoxEast, 1.78038918972015);
			Assert.assertEquals(country.bBoxSouth, 42.4350738525391);
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
			Assert.assertEquals(subdivisions.length, 5);
			Assert.assertEquals(subdivision.countryCode, "AT");
			Assert.assertEquals(subdivision.countryName, "Austria");
			Assert.assertEquals(subdivision.adminCode1, 07);
			Assert.assertEquals(subdivision.adminName1, "Tyrol");
			Assert.assertEquals(subdivision.distance, 0.0);
			Assert.assertEquals(subdivision.codes.length, 2);
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
			Assert.assertEquals(toponyms.length, 1);
			Assert.assertEquals(toponym.name, "Atzmännig");
			Assert.assertEquals(toponym.latitude, 47.287633);
			Assert.assertEquals(toponym.longitude, 8.988454);
			Assert.assertEquals(toponym.geoNameId, 6559633);
			Assert.assertEquals(toponym.countryCode, "CH");
			Assert.assertEquals(toponym.countryName, "Switzerland");
			Assert.assertEquals(toponym.featureClass, "P");
			Assert.assertEquals(toponym.featureCode, "PPL");
			Assert.assertEquals(toponym.distance, 1.6276);
		}
		
		[Test(async)]
		// http://ws.geonames.org/findNearbyPostalCodes?lat=47&lng=9
		public function testFindNearbyPostalCodes():void
		{
			Async.handleEvent(this, geonames, GeoNamesEvent.FIND_NEARBY_POSTAL_CODES, 
				findNearbyPostalCodesHandler, TIMEOUT);
			geonames.findNearbyPostalCodes();
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
			Assert.assertEquals(segment.name, "Roble Ave");
			Assert.assertEquals(segment.fraddl, 601);
			Assert.assertEquals(segment.fraddr, 600);
			Assert.assertEquals(segment.toaddl, 735);
			Assert.assertEquals(segment.toaddr, 698);
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
			Assert.assertEquals(entry.language, "en");
			Assert.assertEquals(entry.title, "Glärnisch");
			Assert.assertNotNull(entry.summary);
			Assert.assertEquals(entry.feature, "mountain");
			Assert.assertEquals(entry.population, 0);
			Assert.assertEquals(entry.elevation, 0);
			Assert.assertEquals(entry.latitude, 46.9986);
			Assert.assertEquals(entry.longitude, 8.9986);
			Assert.assertEquals(entry.wikipediaUrl, "http://en.wikipedia.org/wiki/Gl%C3%A4rnisch");
			Assert.assertEquals(entry.thumbnailImg, "");
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
			Assert.assertEquals(address.street, "Roble Ave");
			Assert.assertEquals(address.streetNumber, 671);
			Assert.assertEquals(address.latitude, 37.45126961535734);
			Assert.assertEquals(address.longitude, -122.1803227963682);
			Assert.assertEquals(address.distance, 0.04);
			Assert.assertEquals(address.postalCode, 94025);
			Assert.assertEquals(address.placeName, "Menlo Park");
			Assert.assertEquals(address.adminCode1, "CA");
			Assert.assertEquals(address.adminName1, "California");
			Assert.assertEquals(address.adminCode2, "081");
			Assert.assertEquals(address.adminName2, "San Mateo");
			Assert.assertEquals(address.countryCode, "US");
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
			Assert.assertEquals(intersection.street, "Roble Ave");
			Assert.assertEquals(intersection.street2, "Curtis St");
			Assert.assertEquals(intersection.latitude, 37.450649);
			Assert.assertEquals(intersection.longitude, -122.180842);
			Assert.assertEquals(intersection.distance, 0.08);
			Assert.assertEquals(intersection.postalCode, 94025);
			Assert.assertEquals(intersection.placeName, "Menlo Park");
			Assert.assertEquals(intersection.adminCode1, "CA");
			Assert.assertEquals(intersection.adminName1, "California");
			Assert.assertEquals(intersection.adminName2, "San Mateo");
			Assert.assertEquals(intersection.countryCode, "US");
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
			Assert.assertEquals(toponym.name, "Earth");
			Assert.assertEquals(toponym.latitude, 0);
			Assert.assertEquals(toponym.longitude, 0);
			Assert.assertEquals(toponym.geoNameId, 6295630);
			Assert.assertEquals(toponym.featureClass, "L");
			Assert.assertEquals(toponym.adminCode1, 20);
			Assert.assertEquals(toponym.adminName1, "Opština Priština");
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
			Assert.assertEquals(toponym.name, "Earth");
			Assert.assertEquals(toponym.latitude, 0);
			Assert.assertEquals(toponym.longitude, 0);
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
			Assert.assertEquals(neighbourhood.countryCode, "US");
			Assert.assertEquals(neighbourhood.countryName, "United States");
			Assert.assertEquals(neighbourhood.adminCode1, "NY");
			Assert.assertEquals(neighbourhood.adminName1, "New York");
			Assert.assertEquals(neighbourhood.adminCode2, "061");
			Assert.assertEquals(neighbourhood.adminName2, "New York County");
			Assert.assertEquals(neighbourhood.city, "New York City-Manhattan");
			Assert.assertEquals(neighbourhood.name, "Central Park");
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
			Assert.assertEquals(result.toponyms.length, 5);
			Assert.assertEquals(toponym.name, "Austria");
			Assert.assertEquals(toponym.latitude, 47.3333333);
			Assert.assertEquals(toponym.longitude, 13.3333333);
			Assert.assertEquals(toponym.countryCode, "AT");
			Assert.assertEquals(toponym.countryName, "Austria");
			Assert.assertEquals(toponym.featureClass, "A");
			Assert.assertEquals(toponym.featureCode, "PCLI");
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
			Assert.assertEquals(ocean.name, "North Atlantic Ocean");
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
			Assert.assertEquals(country.countryCode, "AD");
			Assert.assertEquals(country.countryName, "Andorra");
			Assert.assertEquals(country.numPostalCodes, 7);
			Assert.assertEquals(country.minPostalCode, "AD100");
			Assert.assertEquals(country.maxPostalCode, "AD700");
		}
		
		[Test(async)]
		public function testPostalCodeSearch():void
		{
			
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
			Assert.assertEquals(result.total, 48);
			Assert.assertEquals(toponym.name, "Albania");
			Assert.assertEquals(toponym.latitude, 41.0);
			Assert.assertEquals(toponym.geoNameId, 783754);
			Assert.assertEquals(toponym.countryCode, "AL");
			Assert.assertEquals(toponym.countryName, "Albania");
			Assert.assertEquals(toponym.featureClass, "A");
			Assert.assertEquals(toponym.featureCode, "PCLI");
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
			Assert.assertEquals(timezone.countryCode, "AT");
			Assert.assertEquals(timezone.countryName, "Austria");
			Assert.assertEquals(timezone.latitude, 47.01);
			Assert.assertEquals(timezone.longitude, 10.2);
			Assert.assertEquals(timezone.timezone, "Europe/Vienna");
			Assert.assertEquals(timezone.dstOffset, 2.0);
			Assert.assertEquals(timezone.gmtOffset, 1.0);
			Assert.assertEquals(timezone.rawOffset, 1.0);
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
			Assert.assertEquals(first.title, "Chongqing");
			Assert.assertEquals(last.title, "India");
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
			Assert.assertEquals(first.title, "London");
			Assert.assertEquals(last.title, "London Arch");
			Assert.assertEquals(middle.title, "London Borough of Lewisham");
		}
		
	}
}