package org.geonames.data
{
	
	/**
	 * Encapsulates an address.
	 * 
	 * <p>Extends PostalCode class, inheriting it's properties.</p>
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#findNearestAddress
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