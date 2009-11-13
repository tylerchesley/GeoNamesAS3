package org.geonames.data
{
	[Bindable]
	/**
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class StreetSegment
	{
		
		/**
		 * Constructor 
		 */		
		public function StreetSegment()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		/**
		 * 
		 */		
		public var latitudes:Vector.<Number>;
		
		/**
		 * 
		 */		
		public var longitudes:Vector.<Number>;

		/**
		 * 
		 */		
		public var cfcc:String;

		/**
		 * 
		 */		
		public var name:String;

		/**
		 * 
		 */		
		public var fraddl:String;

		/**
		 * 
		 */		
		public var fraddr:String;

		/**
		 * 
		 */		
		public var toaddl:String;

		/**
		 * 
		 */		
		public var toaddr:String;
	
	}
}