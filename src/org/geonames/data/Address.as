package org.geonames.data
{

	[Bindable]
	public class Address extends PostalCode
	{
		public function Address()
		{
			super();
		}
		
	//------------------------------------------------------------------------------
	//	Properties
	//------------------------------------------------------------------------------
		
		public var countryCode:String;
		
		public var street:String;
		
		public var streetNumber:Number;
		
	}
}