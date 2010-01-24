package org.geonames.data
{
	
	/**
	 * Encapsulates a Wikipedia entry.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#wikipediaBoundingBox
	 * @see org.geonames.GeoNamesService#wikipediaSearch
	 */	
	public class WikipediaEntry
	{
		
		/**
		 * Constructor 
		 * 
		 * <p>Creates a new <code>WikipediaEntry</code> object.</p>
		 */		
		public function WikipediaEntry()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var countryCode:String;
		
		public var language:String;

		public var title:String;

		public var summary:String;

		public var wikipediaUrl:String;

		public var feature:String;

		public var population:int;

		public var elevation:int;

		public var latitude:Number;

		public var longitude:Number;

		public var thumbnailImg:String;
	
	}
}