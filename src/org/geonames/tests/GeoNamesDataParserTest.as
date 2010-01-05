package org.geonames.tests
{
	
	import flexunit.framework.Assert;
	
	import org.geonames.GeoNamesDataParser;
	import org.geonames.data.Address;
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
		
		private 
		
		[Test]
		public function testParseCountry():void
		{
			
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