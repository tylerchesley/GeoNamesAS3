package tests
{
	import flexunit.framework.TestSuite;
	
	import tests.GeoNamesTest;
	
	public class GeoNamesTestSuite extends TestSuite
	{
		public function GeoNamesTestSuite(param:Object=null)
		{
			super(param);
		}
		
		public static function suite():TestSuite
		{
			var newTestSuite:TestSuite = new TestSuite();
			newTestSuite.addTestSuite(tests.GeoNamesTest);
			return newTestSuite;
		}
	}
}