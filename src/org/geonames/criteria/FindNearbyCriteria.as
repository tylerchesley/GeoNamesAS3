package org.geonames.criteria
{
	import org.geonames.codes.Style;
	
	/**
	 * Encapsulates the parameters for the <code>findNearby</code> service.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#findNearby
	 * @see http://www.geonames.org/export/web-services.html#findNearby
	 */
	public class FindNearbyCriteria
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>FindNearbyCriteria</code> object.</p>
		 *  
		 * @param lat The latitude to search at.
		 * @param lng The longitude to search at. 
		 */		
		public function FindNearbyCriteria(lat:Number, lng:Number)
		{
			this.lat = lat;
			this.lng = lng;
		}
		
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		/**
		 * The latitude to search at.
		 */		
		public var lat:Number;
		
		/**
		 * The longitude to search at. 
		 */		
		public var lng:Number;
		
		[Inspectable(category="General", enumeration="A,H,L,P,R,S,T,U,V")]
		
		/**
		 * Restricts the search to the specified feature class.
		 * 
		 * @default All feature classes.
		 * 
		 * @see org.geonames.codes.FeatureClass
		 * @see http://www.geonames.org/export/codes.html
		 */			
		public var featureClass:String;
		
		/**
		 * This parameter may occur more then once, example: featureCode=PPLC&featureCode=PPL
		 * 
		 * @default All feature codes.
		 * 
		 * @see http://www.geonames.org/export/codes.html
		 */	
		public var featureCode:String;
		
		/**
		 * Confines the search to the specified radius in kilometers.
		 */		
		public var radius:Number;
		
		/**
		 * The maximal number of rows in the document returned by 
		 * the service.
		 * 
		 * @default 10 
		 */		
		public var maxRows:Number = 10;
		
		[Inspectable(category="General", enumeration="short,medium,long,full", defaultValue="medium")]
		
		/**
		 * Controls the verbosity of the returned results.
		 * 
		 * @default "MEDIUM" 
		 */	
		public var style:String = Style.MEDIUM;
		
	}
}