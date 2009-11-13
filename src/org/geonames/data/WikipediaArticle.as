package org.geonames.data
{
	[Bindable]
	/**
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class WikipediaArticle
	{
		
		/**
		 * Constructor 
		 * 
		 */		
		public function WikipediaArticle()
		{
		}
	
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		/**
		 * 
		 */		
		public var language:String;

		/**
		 * 
		 */		
		public var title:String;

		/**
		 * 
		 */		
		public var summary:String;

		/**
		 * 
		 */		
		public var wikipediaUrl:String;

		/**
		 * 
		 */		
		public var feature:String;

		/**
		 * 
		 */		
		public var population:int;

		/**
		 * 
		 */		
		public var elevation:int;

		/**
		 * 
		 */		
		public var latitude:Number;

		/**
		 * 
		 */		
		public var longitude:Number;

		/**
		 * 
		 */		
		public var thumbnailImg:String;
	
	}
}