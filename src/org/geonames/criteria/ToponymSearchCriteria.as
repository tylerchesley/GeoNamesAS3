package org.geonames.criteria
{
	
	/**
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 *
	 */
	public class ToponymSearchCriteria
	{
		
		/**
		 * Constructor
		 * 
		 * @param q
		 * @param name
		 * @param name_equals
		 * 
		 * <p>Creates a new <code>ToponymSearchCriteria</code> object.
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
		
		public var adminCode1:String;
		
		public var adminCode2:String;
		
		public var adminCode3:String;
		
		public var charset:String;
		
		public var country:String;
		
		public var countryCode:String;
		
		public var continentCode:String;
		
		public var featureClass:String;
		
		public var featureCodes:String;
		
		public var isNameRequired:Boolean;
		
		public var lang:String;
		
		public var maxRows:Number;
		
		public var name:String;
		
		public var name_equals:String;
		
		public var operator:String;
		
		public var q:String;
		
		public var startRow:Number;
		
		public var style:String;
		
		public var tag:String;
	
	}
}