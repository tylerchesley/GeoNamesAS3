package org.geonames.criteria
{
	import org.geonames.codes.WikipediaLanguage;

	/**
	 * Encapsulates the parameters of the <code>wikipediaSearch</code> service.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 * @see org.geonames.GeoNamesService#wikipediaSearch
	 */	
	public class WikipediaSearchCriteria extends Criteria
	{
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>WikipediaSearchCriteria</code> object.</p>
		 * 
		 * @param placename
		 * 
		 */		
		public function WikipediaSearchCriteria(q:String)
		{
			this.q= q;
		}
		
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		/**
		 * The search query string.
		 */		
		public var q:String;
		
		/**
		 * Search in the Wikipedia title.
		 */		
		public var title:String;
		
		/**
		 * The maximal number of rows in the document returned by 
		 * the service. 
		 * 
		 * @default 10
		 */
		public var maxRows:uint = 10;
		
		/**
		 * @private
		 */		
		private var _lang:String = WikipediaLanguage.ENGLISH;
		
		[Inspectable(category="General", enumeration="en,de", defaultValue="en")]
		
		/**
		 * Optional language parameter. Valid options are "en" or "de".
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
			if (value != WikipediaLanguage.ENGLISH && 
				value != WikipediaLanguage.GERMAN)
			{
				throw new Error("Only the values 'es' or 'de'are allowed " +
					"for the lang parameter.");
			}
			
			_lang = value;
		}
		
	}
}