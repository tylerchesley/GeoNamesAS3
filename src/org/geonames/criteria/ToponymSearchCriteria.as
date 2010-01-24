package org.geonames.criteria
{
	import org.geonames.codes.Language;
	
	/**
	 * Encapsulates the parameters for the <code>search</code> service.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#search
	 * @see http://www.geonames.org/export/geonames-search.html
	 */
	public class ToponymSearchCriteria
	{
		
		/**
		 * Creates a new <code>ToponymSearchCriteria</code> object.
		 * 
		 * <p>Either <code>q</code> or <code>name</code> or <code>name_equals</code> is 
		 * required. All other parameters are optional.</p>
		 * 
		 * @param q Search string for all attributes of a place.
		 * @param name The place name only.
		 * @param name_equals The exact place name.
		 */		
		public function ToponymSearchCriteria(q:String = "", name:String = "", 
											  name_equals:String = "")
		{
			this.q = q;
			this.name = name;
			this.name_equals = name_equals;
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		/**
		 * The code of administrative subdivision.
		 */		
		public var adminCode1:String;
		
		/**
		 * The code of administrative subdivision.
		 */	
		public var adminCode2:String;
		
		/**
		 * The code of administrative subdivision.
		 */	
		public var adminCode3:String;
		
		/**
		 * The default is 'UTF8', defines the encoding used for the document 
		 * returned by the web service.
		 */		
		public var charset:String;
		
		/**
		 * An ISO-3166 country code. 
		 * 
		 * @default All countries.
		 */	
		public var country:String;
		
		[Inspectable(category="General", enumeration="AF,AS,EU,NA,OC,SA,AN")]
		
		/**
		 * Restricts the search for toponym of the given continent.
		 * 
		 * @see org.geonames.codes.ContinentCode
		 */		
		public var continentCode:String;
		
		/**
		 * This parameter may occur more then once, example: featureClass=P&featureClass=A 
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
		public var featureCodes:String;
		
		/**
		 * At least one of the search term needs to be part of the place name. 
		 * Example : A normal seach for Berlin will return all places within the state 
		 * of Berlin. If we only want to find places with 'Berlin' in the name we se the 
		 * parameter isNameRequired to 'true'. The difference to the name_equals 
		 * parameter is that this will allow searches for 'Berlin, Germany' as only 
		 * one search term needs to be part of the name. 
		 */		
		public var isNameRequired:Boolean;
		
		/**
		 * Place name and country name will be returned in the specified language. 
		 * Default is English. Feature classes and codes are only available in 
		 * English and Bulgarian. 
		 * 
		 * @default "en"
		 * 
		 * @see org.geonames.codes.Language
		 */		
		public var lang:String = Language.ENGLISH;
		
		/**
		 * The maximal number of rows in the document returned by 
		 * the service. Default is 100, the maximal allowed value is 1000. 
		 * 
		 * @default 100
		 */		
		public var maxRows:Number;
		
		/**
		 * The place name only. 
		 */		
		public var name:String;
		
		/**
		 * The exact place name. 
		 */		
		public var name_equals:String;
		
		[Inspectable(category="General", enumeration="AND,OR", defaultValue="AND")]
		
		/**
		 * The default is 'AND', with the operator 'OR' not all search terms 
		 * need to be matched by the response.
		 * 
		 * @default "AND"
		 * 
		 * @see org.geonames.codes.Operator
		 */		
		public var operator:String;
		
		/**
		 * Search over all attributes of a place : place name, country name, 
		 * continent, admin codes,... 
		 */		
		public var q:String;
		
		/**
		 * Used for paging results. If you want to get results 30 to 40, 
		 * use startRow=30 and maxRows=10. Default is 0. 
		 * 
		 * @default 0
		 */		
		public var startRow:Number = 0;
		
		[Inspectable(category="General", enumeration="short,medium,long,full", defaultValue="medium")]
		
		/**
		 * Controls the verbosity of the returned results.
		 * 
		 * @default "MEDIUM" 
		 */	
		public var style:String;
		
		/**
		 * Search for toponyms tagged with the specified tag.
		 */		
		public var tag:String;
	
	}
}