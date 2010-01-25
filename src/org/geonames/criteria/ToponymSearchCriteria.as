package org.geonames.criteria
{
	import org.geonames.codes.ContinentCode;
	import org.geonames.codes.FeatureClass;
	import org.geonames.codes.Operator;
	import org.geonames.codes.Style;

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
	public class ToponymSearchCriteria extends Criteria
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>ToponymSearchCriteria</code> object.</p>
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
		 * @private
		 */		
		private var _country:Object;
		
		/**
		 * An ISO-3166 country code. 
		 * 
		 * @default All countries.
		 */	
		public function get country():Object
		{
			return _country;
		}
		
		/**
		 * @private
		 */		
		public function set country(value:Object):void
		{
			if (!(value is String) && !(value is Array))
			{
				throw new Error("Invalid counry specified.");
			}
			
			var temp:Array = value is String ? [value] : value as Array;
			
			for each (var c:String in temp)
			{
				if (c.length != 2)
				{
					throw new Error("Invalid counry specified.");
				}
			}
			
			_country = value;
		}
		
		/**
		 * @private
		 */		
		private var _continentCode:String;
		
		[Inspectable(category="General", enumeration="AF,AS,EU,NA,OC,SA,AN")]
		
		/**
		 * Restricts the search for toponym of the given continent.
		 * 
		 * @see org.geonames.codes.ContinentCode
		 */
		public function get continentCode():String
		{
			return _continentCode;
		}
		
		/**
		 * @private
		 */		
		public function set continentCode(value:String):void
		{
			if (!validateEnumeration(value, ContinentCode))
			{
				throw new Error("Invalid continentCode specified.");
			}
			
			_continentCode = value;
		}
		
		/**
		 * @private
		 */		
		private var _featureClass:Object;
		
		/**
		 * This parameter may occur more then once, example: featureClass=P&featureClass=A.
		 * 
		 * <p>Valid settings for the <code>featureClass</code> property are either 
		 * a string representing one feature class or an array of strings representing 
		 * more than one feature class.</p>
		 * 
		 * @default All feature classes.
		 * 
		 * @see org.geonames.codes.FeatureClass
		 * @see http://www.geonames.org/export/codes.html
		 */		
		public function get featureClass():Object
		{
			return _featureClass;
		}
		
		/**
		 * @private
		 */		
		public function set featureClass(value:Object):void
		{
			if (!(value is String) && !(value is Array))
			{
				throw new Error("Invalid featureClass specified.");
			}
			
			var temp:Array = value is String ? [value] : value as Array;
			
			for each (var fc:String in temp)
			{
				if (!validateEnumeration(fc, FeatureClass))
				{
					throw new Error("Invalid featureClass specified.");
				}
			}
			
			_featureClass = value;
		}
		
		/**
		 * @private
		 */		
		private var _featureCode:Object;
		
		/**
		 * This parameter may occur more then once, example: featureCode=PPLC&featureCode=PPL
		 * 
		 * <p>Valid settings for the <code>featureCode</code> property are either 
		 * a string representing one feature code or an array of strings representing 
		 * more than one feature code.</p>
		 * 
		 * @default All feature codes.
		 * 
		 * @see http://www.geonames.org/export/codes.html
		 */
		public function get featureCode():Object
		{
			return _featureCode;
		}
		
		/**
		 * @private
		 */		
		public function set featureCode(value:Object):void
		{
			if (!(value is String) && !(value is Array))
			{
				throw new Error("Invalid featureCode specified.");
			}
			
			_featureCode = value;
		}
		
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
		 * @private
		 */
		private var _lang:String;
		
		/**
		 * Place name and country name will be returned in the specified language. 
		 * Default is English. Feature classes and codes are only available in 
		 * English and Bulgarian. 
		 * 
		 * @default "en"
		 */		
		public function get lang():String
		{
			return _lang;
		}
		
		/**
		 * @private 
		 */	
		public function set lang(value:String):void
		{
			if (value.length != 2)
			{
				throw new Error("Invalid lang specified.");
			}
			
			_lang = value;
		}
		
		/**
		 * @private
		 */		
		private var _maxRows:uint;
		
		/**
		 * The maximal number of rows in the document returned by 
		 * the service. Default is 100, the maximal allowed value is 1000. 
		 * 
		 * @default 100
		 */	
		public function get maxRows():uint
		{
			return _maxRows;
		}
		
		/**
		 * @private
		 */		
		public function set maxRows(value:uint):void
		{
			if (value > 1000)
			{
				throw new Error("Invalid maxRows specified.");
			}
			
			_maxRows = value;
		}
		
		/**
		 * The place name only. 
		 */		
		public var name:String;
		
		/**
		 * The exact place name. 
		 */		
		public var name_equals:String;
		
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
		public var startRow:uint;
		
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
		 * Search for toponyms tagged with the specified tag.
		 */		
		public var tag:String;
		
	//------------------------------------------------------------------------------
	//	Overriden Methods
	//------------------------------------------------------------------------------
		
		override public function toString():String
		{
			if (!q && !name && !name_equals)
			{
				throw new Error("Either q or name or name_equals must be " +
					"specified.");
			}
			
			return super.toString();
		}
		
	}
}