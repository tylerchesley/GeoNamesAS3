package org.geonames.data
{
	
	/**
	 * Encapsulates a weather observation.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#findNearbyWeather
	 */	
	public class WeatherObservation
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>WeatherObservation</code> object.</p>
		 */		
		public function WeatherObservation()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var observation:String;
		
		public var observationTime:Date;
		
		public var stationName:String;
		
		public var ICAO:String;
		
		public var countryCode:String;
		
		public var elevation:Number;
		
		public var latitude:Number;
		
		public var longitude:Number;
		
		public var temperature:Number;
		
		public var dewPoint:Number;
		
		public var humidity:Number;
		
		public var clouds:String;
		
		public var weatherCondition:String;
		
		public var hectoPascAltimeter:Number
		
		public var windDirection:Number;
		
		public var windSpeed:Number;
		
	}
}