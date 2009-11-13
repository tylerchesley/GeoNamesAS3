package org.geonames
{
	/**
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class PostalCodeSearchCriteria
	{
		
		/**
		 * Constructor 
		 */		
		public function PostalCodeSearchCriteria()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		/**
		 * 
		 */		
		public var postalCode:String;

		/**
		 * 
		 */		
		public var placeName:String;

		/**
		 * 
		 */		
		public var adminCode1:String;

		/**
		 * 
		 */		
		public var countryCode:String;

		/**
		 * 
		 */		
		public var countryBias:String;

		/**
		 * 
		 */		
		public var latitude:Number;

		/**
		 * 
		 */		
		public var longitude:Number;

		/**
		 * 
		 */		
		public var radius:Number;

		/**
		 * 
		 */		
		public var style:String;

		/**
		 * 
		 */		
		public var maxRows:int;

		/**
		 * 
		 */		
		public var startRow:int;

		/**
		 * 
		 */		
		public var isOrOperator:Boolean = false;
	
	}
}