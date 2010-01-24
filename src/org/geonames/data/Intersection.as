package org.geonames.data
{
	/**
	 * Encapsulates an intersection.
	 * 
	 * @langversion ActionScript 3.0
     * @playerversion Flash 9
     * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#findNearestIntersection
	 * @see org.geonames.GeoNamesService#findNearestIntersectionOSM
	 */	
	public class Intersection extends Address
	{
		
		/**
		 * Constructor 
		 * 
		 * <p>Creates a new <code>Intersection</code> object.
		 */		
		public function Intersection()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var street2:String;
	
	}
}