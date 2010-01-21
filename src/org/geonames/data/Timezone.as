package org.geonames.data
{
	
	/**
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class Timezone
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>Timezone</code> object.
		 */		
		public function Timezone()
		{
			
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var countryCode:String;
		
		public var countryName:String;
		
		public var dstOffset:Number;
		
		public var gmtOffset:Number;
		
		public var latitude:Number;
		
		public var longitude:Number;
		
		public var rawOffset:Number;
		
		public var timezone:String;
		
		public var time:Date;
		
	}
}