package org.geonames.criteria
{
	import org.geonames.codes.Operator;
	import org.geonames.codes.Style;
	
	/**
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 *
	 */
	public class PostalCodeSearchCriteria
	{
		
		/**
		 * Constructor
		 *  
		 * @param postalcode
		 * @param placename
		 * 
		 * <p>Creates a new <code>PostalCodeSearchCriteria/code> object.
		 */		
		public function PostalCodeSearchCriteria(postalcode:String = "", placename:String = "")
		{
			this.postalcode = postalcode;
			this.placename = placename;
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		/**
		 * The postal code to search for.
		 */		
		public var postalcode:String;
		
		/**
		 * The first characters or letters of a postal code.
		 */		
		public var postalcode_startswtih:String;
		
		/**
		 * All fields : placename,postal code, country, admin name.
		 * Must be UTF8 encoded.
		 */		
		public var placename:String;
		
		/**
		 * The first characters of a place name. 
		 */		
		public var placename_startswith:String;
		
		/**
		 * An ISO-3166 country code. Default is all countries.
		 */		
		public var country:String;
		
		/**
		 * Records from the countryBias are listed first.
		 */		
		public var countryBias:String;
		
		/**
		 * The maximal number of rows in the document returned by the service. 
		 * 
		 * @default 10
		 */		
		public var maxRows:uint = 10;
		
		[Inspectable(category="General", enumeration="short,medium,long,full", defaultValue="medium")]
		/**
		 * Verbosity of returned xml document.
		 * 
		 * @default "MEDIUM"
		 */		
		public var style:String = Style.MEDIUM;
		
		[Inspectable(category="General", enumeration="AND,OR", defaultValue="AND")]
		/**
		 * The operator 'AND' searches for all terms in the placename parameter, 
		 * the operator 'OR' searches for any term.
		 * 
		 * @default "AND"
		 */		
		public var operator:String = Operator.AND;
		
		/**
		 * The default is 'UTF8', defines the encoding used for the document returned by the web service.
		 */		
		public var charset:String;
	
	}
}