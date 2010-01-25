package org.geonames.criteria
{
	import flash.net.URLVariables;
	import flash.utils.describeType;

	/**
	 * Abstract class for all criteria classes. This class should not be 
	 * created directly but subclassed.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Tyler Chesley
	 * 
	 */	
	public class Criteria extends URLVariables
	{
		
		protected static function validateEnumeration(value:String, 
													  enumeration:Class):Boolean
		{
			var type:XML = describeType(enumeration);
			
			for each (var constant:XML in type..constant)
			{
				if (enumeration[constant.@name] == value)
					return true;
			}
			
			return false;
		}
		
		/**
		 * Constructor
		 * 
		 * <p>Creates a new <code>Criteria/code> object.</p>
		 */		
		public function Criteria()
		{
		}
		
	//------------------------------------------------------------------------------
	//	Overriden Methods
	//------------------------------------------------------------------------------
		
		/**
		 * Returns a url-encoded string ingnoring any properties with null values. 
		 * 
		 * <p>If any properties are an array then each value in the array will be 
		 * appended to the string preceded by the name of property.</p>
		 * 
		 * @return A url-encoded string ingnoring any properties with null values. 
		 * 
		 */		
		override public function toString():String
		{
			var params:Array = [];
			var type:XML = describeType(this);
			
			getParamStrings(type..variable, params);
			getParamStrings(type..accessor, params);
			
			return params.join("&");
		}
		
		/**
		 * @private
		 */		
		protected function getParamStrings(values:XMLList, params:Array):void
		{
			for each (var param:XML in values)
			{
				var name:String = param.@name;
				var value:* = this[name];
				var result:String;
				
				if (value)
				{
					if (value is Array)
					{
						for each (var arrayValue:* in value)
						{
							params.push(name + "=" + arrayValue);
						}
					}
					else
					{
						params.push(name + "=" + value);
					}
				}
			}
		}
		
	}
}