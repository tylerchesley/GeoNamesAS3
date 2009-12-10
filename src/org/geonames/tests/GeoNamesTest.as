package org.geonames.tests
{
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.geonames.GeoNames;
	import org.geonames.data.Country;
	import org.geonames.data.CountrySubdivision;
	import org.geonames.data.StreetSegment;
	import org.geonames.data.Toponym;
	import org.geonames.data.ToponymSearchResult;
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
		public function testFindNearbyWeather():void
		{
			
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
			Assert.assertNull(entry.thumbnailImg);
		}
		
		[Test(async)]
		public function testFindNearestAddress():void
		{
			
		}
		
		[Test(async)]
		public function testFindNearestIntersection():void
		{
			
		}
		
		[Test(async)]
		public function testGetToponym():void
		{
			
		}
		
		[Test(async)]
		public function testHierarchy():void
		{
			
		}
		
		[Test(async)]
		public function testNeighborhood():void 
		{
			
		}
		
		[Test(async)]
		public function testNeighbors():void
		{
			
		}
		
		[Test(async)]
		public function testOceans():void
		{
			
		}
		
		[Test(async)]
		public function testPostalCodeCountryInfo():void
		{
			
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
		public function testSiblings():void
		{
			
		}
		
		[Test(async)]
		public function testTimezone():void
		{
			
		}
		
		[Test(async)]
		public function testWikipediaBoundingBox():void
		{
			
		}
		
		[Test(async)]
		public function testWikipediaSearch():void
		{
			
		}
	}
}