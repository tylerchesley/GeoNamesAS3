package org.geonames.data
{
	/**
	 * Encapsulates a GeoNames exception.
	 * 
	 * @langversion ActionScript 3.0
     * @playerversion Flash 9
     * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see http://www.geonames.org/export/webservice-exception.html
	 */	
	public class GeoNamesException
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>GeoNamesException</code> object.
		 */		
		public function GeoNamesException()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var code:Number;
		
		public var description:String;
		
		public var message:String;
		
	}
}