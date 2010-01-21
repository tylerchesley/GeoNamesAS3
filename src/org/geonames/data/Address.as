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
	public class Address extends PostalCode
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>Address</code> object.
		 */		
		public function Address()
		{
			super();
		}
		
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var placeName:String;
		
		public var street:String;
		
		public var streetNumber:Number;
		
	}
}