package se.stade.colligo.associative
{
	import flash.utils.Dictionary;
	
	import se.stade.colligo.Arrayable;
	import se.stade.colligo.Collection;
	import se.stade.colligo.Countable;
	import se.stade.colligo.Enumerator;
	import se.stade.colligo.Inspectable;
	import se.stade.colligo.Keyed;
	import se.stade.colligo.iterators.Iterator;
	import se.stade.colligo.iterators.LinearIterator;

	public class ImmutableTable extends Enumerator implements Keyed, Countable, Inspectable, Arrayable, Collection
	{
		public function ImmutableTable(pairs:Vector.<KeyValuePair>)
		{
			super(new <KeyValuePair>[]);
			
			keys = new Dictionary();
			values = new Dictionary();
			
			for each (var pair:KeyValuePair in pairs)
			{
				var hashedKey:* = getHashedKey(pair.key);
				
				if (hashedKey in keys)
					keys[hashedKey].push(pair.value);
				else
					keys[hashedKey] = [pair.value];
				
				if (pair.value in values)
					values[pair.value].push(hashedKey);
				else
					values[pair.value] = [hashedKey];
			}
			
			this.pairs = pairs;
		}
		
		public function containsKey(key:*):Boolean
		{
			return hasProperty(key);
		}

		public function get(key:*):*
		{
			return getProperty(key);
		}

		protected var keyList:Array;
		public function getKeys(item:*):Array
		{
			if (!keyList)
			{
				keyList = [];
				
				for each (var pair:KeyValuePair in pairs)
				{
					keyList.push(pair.key);
				}
			}
			
			return keyList; 
		}
		
		public function iterate():Iterator
		{
			return new LinearIterator(pairs);
		}

		public function contains(item:*):Boolean
		{
			return item in values;
		}

		public function get isEmpty():Boolean
		{
			return length == 0;
		}

		protected var pairList:Array;
		public function toArray():Array
		{
			if (!pairList)
			{
				pairList = [];
				
				for each (var pair:KeyValuePair in pairs)
				{
					pairList.push(pair);
				}
			}
			
			return pairList.slice();
		}
		
		protected function getHashedKey(key:*):*
		{
			if (key is String || key is QName)
				return "<" + key + ">";
			
			return key;
		}
		
		override protected function getProperty(name:*):*
		{
			name = getHashedKey(name);
			
			if (name in keys)
				return keys[name];
			
			return undefined;
		}
		
		override protected function setProperty(name:*, value:*):void { }
		override protected function deleteProperty(name:*):Boolean { return false || name != name; }
	}
}