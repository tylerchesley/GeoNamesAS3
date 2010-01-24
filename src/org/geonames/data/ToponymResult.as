package org.geonames.data
{

	/**
	 * Encapsulates the search results for the <code>search</code> service.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#search
	 */	
	public class ToponymResult
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>ToponymResult</code> object.</p>
		 */		
		public function ToponymResult()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var style:String;
		
		public var toponyms:Array;
		
		public var total:Number;
	
	}
}