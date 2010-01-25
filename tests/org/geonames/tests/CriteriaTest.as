package org.geonames.tests
{
	import org.flexunit.Assert;
	import org.geonames.codes.ContinentCode;
	import org.geonames.codes.FeatureClass;
	import org.geonames.codes.Operator;
	import org.geonames.codes.Style;
	import org.geonames.codes.WikipediaLanguage;
	import org.geonames.criteria.FindNearbyCriteria;
	import org.geonames.criteria.FindNearbyPostalCodesCriteria;
	import org.geonames.criteria.PostalCodeSearchCriteria;
	import org.geonames.criteria.ToponymSearchCriteria;
	import org.geonames.criteria.WikipediaSearchCriteria;

	public class CriteriaTest
	{
		public function CriteriaTest()
		{
		}
		
		[Test]
		public function testFindNearbyCriteria():void
		{
			var criteria:FindNearbyCriteria = new FindNearbyCriteria(10.0, 122);
			
			// Test featureClass
			try
			{
				criteria.featureClass = "foo";
			}
			catch (error:Error)
			{
				criteria.featureClass = FeatureClass.AREA;
			}
			
			Assert.assertEquals(FeatureClass.AREA, criteria.featureClass);
			
			// Test style
			try
			{
				criteria.style = "foo";
			}
			catch (error:Error)
			{
				criteria.style = Style.FULL;
			}
			
			Assert.assertEquals(Style.FULL, criteria.style);
			
			Assert.assertEquals(51, criteria.toString().length);
		}
		
		[Test]
		public function testFindNearbyPostalCodes():void
		{
			var criteria:FindNearbyPostalCodesCriteria = new FindNearbyPostalCodesCriteria();
			
			// Test style
			try
			{
				criteria.style = "foo";
			}
			catch (error:Error)
			{
				criteria.style = Style.SHORT;
			}
			
			Assert.assertEquals(Style.SHORT, criteria.style);
			
			// Test country
			try
			{
				criteria.country = "foo";
			}
			catch (error:Error)
			{
				criteria.country = "us";
			}
			
			Assert.assertEquals("us", criteria.country);
			
			try
			{
				criteria.toString();
			}
			catch (error:Error)
			{
				criteria.lat = 10;
				criteria.lng = 122;
			}
			
			Assert.assertEquals(65, criteria.toString().length);
		}
		
		[Test]
		public function testPostalCodeSearchCriteria():void
		{
			var criteria:PostalCodeSearchCriteria = new PostalCodeSearchCriteria();
			
			// Test country
			try
			{
				criteria.country = "foo";
			}
			catch (error:Error)
			{
				criteria.country = "us";
			}
			
			Assert.assertEquals("us", criteria.country);
			
			// Test style
			try
			{
				criteria.style = "foo";
			}
			catch (error:Error)
			{
				criteria.style = Style.SHORT;
			}
			
			Assert.assertEquals(Style.SHORT, criteria.style);
			
			// Test operator
			try
			{
				criteria.operator = "foo";
			}
			catch (error:Error)
			{
				criteria.operator = Operator.OR;
			}
			
			Assert.assertEquals(Operator.OR, criteria.operator);
			
			try
			{
				criteria.toString();
			}
			catch (error:Error)
			{
				criteria.postalcode = "00000";
			}
			
			Assert.assertEquals(62, criteria.toString().length);
		}
		
		[Test]
		public function testToponymSearchCriteria():void
		{
			var criteria:ToponymSearchCriteria = new ToponymSearchCriteria();
			
			// Test country
			try
			{
				criteria.country = 45;
			}
			catch (error:Error)
			{
				criteria.country = "us";
			}
			
			// Test continentCode
			try
			{
				criteria.continentCode = "45"; // Invalid value
			}
			catch (error:Error)
			{
				criteria.continentCode = ContinentCode.AFRICA;
			}
			
			// Test featureClass
			try
			{
				criteria.featureClass = "foo";
			}
			catch (error:Error)
			{
				var featureClasses:Array = [FeatureClass.AREA, FeatureClass.SPOT];
				criteria.featureClass = featureClasses;
			}
			
			// Test featureCode
			try
			{
				criteria.featureCode = 45;
			}
			catch (error:Error)
			{
				criteria.featureCode = "ADM4";
			}
			
			// Test lang
			try
			{
				criteria.lang = "est";
			}
			catch (error:Error)
			{
				criteria.lang = "es";
			}
			
			// Test maxRows
			try
			{
				criteria.maxRows = 1001;
			}
			catch (error:Error)
			{
				criteria.maxRows = 1000;
			}
			
			// Test operator
			try
			{
				criteria.operator = "foo";
			}
			catch (error:Error)
			{
				criteria.operator = Operator.AND;
			}
			
			// Test style
			try
			{
				criteria.style = "foo";
			}
			catch (error:Error)
			{
				criteria.style = Style.LONG;
			}
			
			try
			{
				criteria.toString();
			}
			catch (error:Error)
			{
				criteria.q = "London";
			}
			
			Assert.assertEquals("us", criteria.country);
			Assert.assertEquals(ContinentCode.AFRICA, criteria.continentCode);
			Assert.assertEquals(featureClasses, criteria.featureClass);
			Assert.assertEquals("ADM4", criteria.featureCode);
			Assert.assertEquals("es", criteria.lang);
			Assert.assertEquals(1000, criteria.maxRows);
			Assert.assertEquals(Operator.AND, criteria.operator);
			Assert.assertEquals(Style.LONG, criteria.style);
			Assert.assertEquals(128, criteria.toString().length);
		}
		
		[Test]
		public function testWikipediaSearchCriteria():void
		{
			var criteria:WikipediaSearchCriteria = new WikipediaSearchCriteria("london");
			
			// Test lang
			try
			{
				criteria.lang = "foo";
			}
			catch (error:Error)
			{
				criteria.lang = WikipediaLanguage.GERMAN;
			}
			
			Assert.assertEquals(WikipediaLanguage.GERMAN, criteria.lang);
		}
		
	}
}