package org.geonames.criteria
{
	import org.geonames.codes.Operator;
	import org.geonames.codes.Style;
	
	/**
	 * Encapsulates the parameters for <code>postalCodeSearch</code> service.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#postalCodeSearch
	 * @see http://www.geonames.org/export/web-services.html#postalCodeSearch
	 */
	public class PostalCodeSearchCriteria extends Criteria
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>PostalCodeSearchCriteria/code> object.</p>
		 * 
		 * <p>Either <code>postalcode</code> or <code>placename</code> is required. 
		 * All other paramaters are optional.</p>
		 *  
		 * @param postalcode The postal code to search for.
		 * @param placename Search string for all fields.
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
		 * @private
		 */		
		private var _country:String;
		
		/**
		 * An ISO-3166 country code. 
		 * 
		 * @default All countries.
		 */		
		public function get country():String
		{
			return _country;
		}
		
		/**
		 * @private
		 */		
		public function set country(value:String):void
		{
			if (value.length != 2)
			{
				throw new Error("Invalid country specified.");
			}
			
			_country = value;
		}
		
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
		
		/**
		 * @private
		 */		
		private var _style:String;
		
		[Inspectable(category="General", enumeration="short,medium,long,full", defaultValue="medium")]
		
		/**
		 * Controls the verbosity of the returned results.
		 * 
		 * @default "MEDIUM" 
		 */	
		public function get style():String
		{
			return _style;
		}
		
		/**
		 * @private
		 */		
		public function set style(value:String):void
		{
			if (!validateEnumeration(value, Style))
			{
				throw new Error("Invalid style specified.");
			}
			
			_style = value;
		}
		
		/**
		 * @private
		 */		
		private var _operator:String;
		
		[Inspectable(category="General", enumeration="AND,OR", defaultValue="AND")]
		
		/**
		 * The default is 'AND', with the operator 'OR' not all search terms 
		 * need to be matched by the response.
		 * 
		 * @default "AND"
		 * 
		 * @see org.geonames.codes.Operator
		 */	
		public function get operator():String
		{
			return _operator;
		}
		
		/**
		 * @private
		 */		
		public function set operator(value:String):void
		{
			if (!validateEnumeration(value, Operator))
			{
				throw new Error("Invalid operator specified.");
			}
			
			_operator = value;
		}
		
		/**
		 * The default is 'UTF8', defines the encoding used for the document 
		 * returned by the web service.
		 */		
		public var charset:String;
		
	//------------------------------------------------------------------------------
	//	Overriden Methods
	//------------------------------------------------------------------------------
		
		override public function toString():String
		{
			if (!postalcode && !placename)
			{
				throw new Error("Either postalcode or placename must be " +
					"specified.");
			}
			
			return super.toString();
		}
		
	}
}