package org.geonames.tests
{
	
	import flexunit.framework.Assert;
	
	import org.geonames.GeoNamesDataParser;
	import org.geonames.data.Address;
	import org.geonames.data.Country;
	import org.geonames.data.CountrySubdivision;
	import org.geonames.data.Intersection;
	import org.geonames.data.Neighbourhood;
	import org.geonames.data.PostalCode;
	import org.geonames.data.Toponym;
	
	public class GeoNamesDataParserTest
	{
		
		private static const ADDRESS:XML = 
			<address>
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
			</address>;
		
		private static const COUNTRY:XML = 
			<country>
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
			</country>;
		
		private static const COUNTRY_SUBDIVISION:XML = 
			<countrySubdivision>
				<countryCode>AT</countryCode>
				<countryName>Austria</countryName>
				<adminCode1>07</adminCode1>
				<adminName1>Tyrol</adminName1>
				<code type="FIPS10-4">07</code>
				<code type="ISO3166-2">7</code>
				<distance>0.0</distance>
			</countrySubdivision>;
		
		private static const INTERSECTION:XML = 
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
			</intersection>;
		
		private static const NEIGHBOURHOOD:XML = 
			<neighbourhood>
				<countryCode>US</countryCode>
				<countryName>United States</countryName>
				<adminCode1>NY</adminCode1>
				<adminName1>New York</adminName1>
				<adminCode2>061</adminCode2>
				<adminName2>New York County</adminName2>
				<city>New York City-Manhattan</city>
				<name>Central Park</name>
			</neighbourhood>;
		
		private static const TOPONYM:XML = 
			<geoname>
				<name>Latium</name>
				<lat>42.0</lat>
				<lng>12.5</lng>
				<geonameId>3174976</geonameId>
				<countryCode>IT</countryCode>
				<countryName>Italy</countryName>
				<fcl>A</fcl>
				<fcode>ADM1</fcode>
				<fclName>country, state, region,...</fclName>
				<fcodeName>first-order administrative division</fcodeName>
				<population>5501631</population>
				<alternateNames>Lacio,Latium,Lazio</alternateNames>
				<elevation/>
				<continentCode>EU</continentCode>
				<adminCode1>07</adminCode1>
				<adminName1>Latium</adminName1>
				<adminCode2/>
				<adminName2/>
				<alternateName lang="fr">Latium</alternateName>
				<alternateName lang="nl">Latium</alternateName>
				<alternateName lang="en">Latium</alternateName>
				<alternateName lang="it">Lazio</alternateName>
				<alternateName lang="la">Latium</alternateName>
				<alternateName lang="es">Lazio</alternateName>
				<alternateName lang="de">Latium</alternateName>
				<timezone dstOffset="2.0" gmtOffset="1.0">Europe/Rome</timezone>
				<numberOfChildren>5</numberOfChildren>
			</geoname>;
		
		// Reference declaration for class to test
		private var classToTestRef : org.geonames.GeoNamesDataParser;
		
		public function GeoNamesDataParserTest()
		{
		}
		
	/* Tests */
		
		[Test]
		public function testParseAddress():void
		{
			var address:Address = GeoNamesDataParser.parseAddress(ADDRESS);
			Assert.assertEquals("Roble Ave", address.street);
			Assert.assertEquals(671, address.streetNumber);
			Assert.assertEquals(37.45126961535734, address.latitude);
			Assert.assertEquals(-122.1803227963682, address.longitude);
			Assert.assertEquals(0.04, address.distance);
			Assert.assertEquals("94025", address.postalCode);
			Assert.assertEquals("Menlo Park", address.placeName);
			Assert.assertEquals("CA", address.adminCode1);
			Assert.assertEquals("California", address.adminName1);
			Assert.assertEquals("081", address.adminCode2);
			Assert.assertEquals("San Mateo", address.adminName2);
			Assert.assertEquals("US", address.countryCode);
		}
		
		[Test]
		public function testParseCountry():void
		{
			var country:Country = GeoNamesDataParser.parseCountry(COUNTRY);
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
		
		[Test]
		public function testParseCountrySubdivision():void
		{
			var subdivision:CountrySubdivision = GeoNamesDataParser.parseCountrySubdivision(COUNTRY_SUBDIVISION);
			Assert.assertEquals("AT", subdivision.countryCode);
			Assert.assertEquals("Austria", subdivision.countryName);
			Assert.assertEquals(07, subdivision.adminCode1);
			Assert.assertEquals("Tyrol", subdivision.adminName1);
			Assert.assertEquals(0.0, subdivision.distance);
			Assert.assertEquals("FIPS10-4", subdivision.codes[0].type);
			Assert.assertEquals("07", subdivision.codes[0].value);
			Assert.assertEquals("ISO3166-2", subdivision.codes[1].type);
			Assert.assertEquals("7", subdivision.codes[1].value);
		}
		
		[Test]
		public function testParseIntersection():void
		{
			var intersection:Intersection = GeoNamesDataParser.parseIntersection(INTERSECTION);
			Assert.assertEquals("Roble Ave", intersection.street);
			Assert.assertEquals("Curtis St", intersection.street2);
			Assert.assertEquals(37.450649, intersection.latitude);
			Assert.assertEquals(-122.180842, intersection.longitude);
			Assert.assertEquals(0.08, intersection.distance);
			Assert.assertEquals("94025", intersection.postalCode);
			Assert.assertEquals("Menlo Park", intersection.placeName);
			Assert.assertEquals("San Mateo", intersection.adminName2);
			Assert.assertEquals("CA", intersection.adminCode1);
			Assert.assertEquals("California", intersection.adminName1);
			Assert.assertEquals("US", intersection.countryCode);
		}
		
		[Test]
		public function testParseNeighbourhood():void
		{
			var neighbourhood:Neighbourhood = GeoNamesDataParser.parseNeighbourhood(NEIGHBOURHOOD);
			Assert.assertEquals("US", neighbourhood.countryCode);
			Assert.assertEquals("United States", neighbourhood.countryName);
			Assert.assertEquals("NY", neighbourhood.adminCode1);
			Assert.assertEquals("New York", neighbourhood.adminName1);
			Assert.assertEquals("061", neighbourhood.adminCode2);
			Assert.assertEquals("New York County", neighbourhood.adminName2);
			Assert.assertEquals("New York City-Manhattan", neighbourhood.city);
			Assert.assertEquals("Central Park", neighbourhood.name);
		}
		
		private static const POSTAL_CODE:XML = 
			<code>
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
			</code>;
		
		[Test]
		public function testParsePostalCode():void
		{
			var code:PostalCode = GeoNamesDataParser.parsePostalCode(POSTAL_CODE);
			Assert.assertEquals("8750", code.postalCode);
			Assert.assertEquals("Klöntal", code.placeName);
			Assert.assertEquals("CH", code);
		}
		
		[Test]
		public function testParseToponym():void
		{
			var toponym:Toponym = GeoNamesDataParser.parseToponym(TOPONYM);
			Assert.assertEquals("Latium", toponym.name);
			Assert.assertEquals(42.0, toponym.latitude);
			Assert.assertEquals(12.5, toponym.longitude);
			Assert.assertEquals(3174976, toponym.geoNameId);
			Assert.assertEquals("EU", toponym.continentCode);
			Assert.assertEquals("IT", toponym.countryCode);
			Assert.assertEquals("Italy", toponym.countryName);
			Assert.assertEquals("A", toponym.featureClass);
			Assert.assertEquals("country, state, region,...", toponym.featureClassName);
			Assert.assertEquals("ADM1", toponym.featureCode);
			Assert.assertEquals("first-order administrative division", toponym.featureCodeName);
			Assert.assertEquals(0, toponym.elevation);
			Assert.assertEquals(5501631, toponym.population);
			Assert.assertEquals("Lacio,Latium,Lazio", toponym.alternateNames);
			Assert.assertEquals("07", toponym.adminCode1);
			Assert.assertEquals("Latium", toponym.adminName1);
			Assert.assertEquals("", toponym.adminCode2);
			Assert.assertEquals("", toponym.adminName2);
			Assert.assertEquals(5, toponym.numberOfChildren);
			Assert.assertEquals(2.0, toponym.timezone.dstOffset);
			Assert.assertEquals(1.0, toponym.timezone.gmtOffset);
			Assert.assertEquals("Europe/Rome", toponym.timezone.timezone);
			Assert.assertEquals("Lazio", toponym.alternateNamesByLanguage["es"]);
		}
		
	}
}