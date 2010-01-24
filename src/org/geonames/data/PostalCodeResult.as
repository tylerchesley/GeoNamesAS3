package org.geonames.data
{
	
	/**
	 * Encapsulates the search results for the <code>postalCodeSearch</code> service.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#postalCodeSearch
	 */
	public class PostalCodeResult
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>PostalCodeResult</code> object.</p>
		 */		
		public function PostalCodeResult()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var postalCodes:Array;
		
		public var total:Number;
		
	}
}