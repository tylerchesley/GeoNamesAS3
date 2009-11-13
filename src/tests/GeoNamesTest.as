package tests
{
	import flexunit.framework.TestCase;
	
	import org.geonames.GeoNames;
	import org.geonames.data.Country;
	import org.geonames.data.CountrySubdivision;
	import org.geonames.data.Toponym;
	import org.geonames.data.ToponymSearchResult;
	import org.geonames.events.GeoNamesEvent;
	
	public class GeoNamesTest extends TestCase
	{
		// please note that all test methods should start with 'test' and should be public
		
		public function GeoNamesTest(methodName:String=null)
		{
			//TODO: implement function
			super(methodName);
		}
	
	/* Properties */
		
		// Reference declaration for class to test
		private var geonames:GeoNames;
		
		private var timeout:Number = 100000000;
		
	/* Overriden Methods */
		
		//This method will be called before every test function
		override public function setUp():void
		{
			geonames = new GeoNames();
			super.setUp();
		}
		
		//This method will be called after every test function
		override public function tearDown():void
		{
			geonames = null;
			super.tearDown();
		}
	
	/* Methods */
		
		public function testChildren():void
		{
			// Regions of Italy
			geonames.children(3175395);
			geonames.addEventListener(GeoNamesEvent.CHILDREN, 
				addAsync(verifyChildren, timeout));
		}
		
		// http://ws.geonames.org/cities?north=44.1&south=-9.9&east=-22.4&west=55.2
		public function testCities():void
		{
			geonames.cities(44.1, -9.9, -22.4, 55.2);
			geonames.addEventListener(GeoNamesEvent.CITIES, 
				addAsync(verifyCities, timeout));
		}
		
		public function testCountryCode():void
		{
			geonames.countryCode(47.03, 10.2);
			geonames.addEventListener(GeoNamesEvent.COUNTRY_CODE, 
				addAsync(verifyCountryCode, timeout));
		}
		
		// http://ws.geonames.org/countryInfo?country=DE
		public function testCountryInfo():void
		{
			geonames.countryInfo("DE");
			geonames.addEventListener(GeoNamesEvent.COUNTRY_INFO, 
				addAsync(verifyCountryInfo, timeout));
		}
		
		// http://ws.geonames.org/countrySubdivision?lat=47.03&lng=10.2&maxRows=10&radius=40
		public function testCountrySubdivision():void
		{
			geonames.countrySubdivision(47.0, 10.2, 40, 10);
			geonames.addEventListener(GeoNamesEvent.COUNTRY_SUBDIVISION, 
				addAsync(verifyCountrySubdivision, timeout));
		}
		
		// http://ws.geonames.org/findNearbyPlaceName?lat=47.3&lng=9
		public function testFindNearbyPlaceName():void
		{
			geonames.findNearbyPlaceName(47.3, 9);
			geonames.addEventListener(GeoNamesEvent.FIND_NEARBY_PLACE_NAME, 
				addAsync(verifyFindNearbyPlaceName, timeout));
		}
		
		public function testFindNearbyPostalCodes():void
		{
			geonames.findNearbyPostalCodes();
			geonames.addEventListener(GeoNamesEvent.FIND_NEARBY_POSTAL_CODES, 
				addAsync(verifyFindNearbyPostalCodes, timeout));
		}
	
	/* Event Listeners */
		
		protected function verifyChildren(event:GeoNamesEvent):void
		{
			var result:ToponymSearchResult = event.data as ToponymSearchResult;
			var toponym:Toponym = result.toponyms[0];
			assertEquals(result.total, 20);
			assertEquals(toponym.name, "Abruzzo");
		}
		
		protected function verifyCities(event:GeoNamesEvent):void
		{
			var city:Toponym = event.data[0];
			assertEquals(city.adminCode1, 09);
			assertEquals(city.adminName1, "The Federal District");
											 assertEquals(city.alternateNames, "Cidade de Mexico,Cidade de México,Cidade do Mexico,Cidade do México,Cita du Messicu,Citta del Messico,Città del Messico,Cità dû Messicu,Cità dû Mèssicu,Ciudad Mexico,Ciudad de Mejico,Ciudad de Mexico,Ciudad de Méjico,Ciudad de México,Ciutat de Mexic,Ciutat de Mèxic,Lungsod ng Mexico,Lungsod ng México,Mehiko,Mekhiko,Meksikas,Meksiko,Meksiko Siti,Meksikurbo,Meksyk,Mexico,Mexico City,Mexico D.F.,Mexico DF,Mexico Distrito Federal,Mexico by,Mexico-stad,Mexicopolis,Mexiko,Mexiko Hiria,Mexiko-Stadt,Mexikoborg,Mexíkóborg,México,México Distrito Federal,Πόλη του Μεξικού,Мексико,Мексико Сити,Мехико,Мехіко,מקסיקו סיטי,مدينة مكسيكو,مکزیکو,مکزیکوسیتی,مېكسىكا شەھىرى,मेक्सिको सिटी,เม็กซิโกซิตี,მეხიკო,メキシコシティ,墨西哥城,멕시코 시");
			assertEquals(city.countryCode, "MX");
			assertEquals(city.countryName, "Mexico");
			assertEquals(city.elevation, null);
			assertEquals(city.featureClass, "P");
			assertEquals(city.featureCode, "PPLC");
			assertEquals(city.geoNameId, 3530597);
			assertEquals(city.latitude, 19.4341667);
			assertEquals(city.longitude, -99.1386111);
			assertEquals(city.name, "Mexico City");
			assertEquals(city.population, 11285654);
			assertEquals(city.timezone.dstOffset, -5.0);
			assertEquals(city.timezone.gmtOffset, -6.0);
			assertEquals(city.timezone.timezone, "America/Mexico_City");
		}
		
		protected function verifyCountryCode(event:GeoNamesEvent):void
		{
			
		}
		
		protected function verifyCountryInfo(event:GeoNamesEvent):void
		{
			var country:Country = event.data[0];
			assertEquals(country.areaInSqKm, 357021.0);
			assertEquals(country.bBoxEast, 15.0398902893066);
			assertEquals(country.bBoxNorth, 55.0556411743164);
			assertEquals(country.bBoxSouth, 47.2757720947266);
			assertEquals(country.bBoxWest, 5.865638256073);
			assertEquals(country.capital, "Berlin");
			assertEquals(country.continent, "EU");
			assertEquals(country.countryCode, "DE");
			assertEquals(country.countryName, "Germany");
			assertEquals(country.currencyCode, "EUR");
			assertEquals(country.fipsCode, "GM");
			assertEquals(country.geonameId, 2921044);
			assertEquals(country.isoAlpha3, "DEU");
			assertEquals(country.isoNumeric, 276);
			assertEquals(country.languages, "de");
			assertEquals(country.population, 82369000);
		}
		
		protected function verifyCountrySubdivision(event:GeoNamesEvent):void
		{
			var subdivision:CountrySubdivision = event.data[0];
			assertEquals(subdivision.adminCode1, 07);
			assertEquals(subdivision.adminName1, "Tyrol");
			assertEquals(subdivision.countryCode, "AT");
			assertEquals(subdivision.countryName, "Austria");
			assertEquals(subdivision.distance, 0.0);
		}
		
		protected function verifyFindNearbyPlaceName(event:GeoNamesEvent):void
		{
			var toponym:Toponym = event.data[0];
			assertEquals(toponym.name, "Atzmännig");
			assertEquals(toponym.latitude, 47.287633);
			assertEquals(toponym.longitude, 8.988454);
			assertEquals(toponym.geoNameId, 6559633);
			assertEquals(toponym.countryCode, "CH");
			assertEquals(toponym.countryName, "Switzerland");
			assertEquals(toponym.featureClass, "P");
			assertEquals(toponym.featureCode, "PPL");
			assertEquals(toponym.distance, 1.6276);
		}
		
		protected function verifyFindNearbyPostalCodes(event:GeoNamesEvent):void
		{
			
		}
		
	}
}