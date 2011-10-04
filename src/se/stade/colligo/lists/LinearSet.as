package se.stade.colligo.lists
{
	import flash.utils.Dictionary;
	
	import se.stade.colligo.Arrayable;
	import se.stade.colligo.Enumerator;
	import se.stade.colligo.IndexableList;
	import se.stade.colligo.Set;
	import se.stade.colligo.associative.KeyValuePair;
	import se.stade.colligo.iterators.Iterator;
	import se.stade.colligo.iterators.LinearIterator;
	import se.stade.colligo.operators.toEnumerable;
	
	/**
	 * A linear set stores items sequentially. Items in the set
	 * are guaranteed to not exist more than once in the set.
	 * 
	 * @author Marcus Stade
	 */
	public class LinearSet extends Enumerator implements Set, IndexableList, Arrayable
	{
		/**
		 * Constructs a set from the given items. If no items
		 * are given, the set will be empty.
		 * 
		 * @param items An optional list of items to populate the set. 
		 */
		public function LinearSet(... items)
		{
			items = se.stade.colligo.operators.toEnumerable(items);
			
			var values:Dictionary = new Dictionary();
			for each (var item:* in items)
			{
				values[item] = item;
			}
			
			var valueList:Array = [];
			for each (item in values)
			{
				valueList.push(item);
			}
			
			super(KeyValuePair.fromList(valueList));
		}
		
		/**
		 * @inheritDoc
		 */
		public function add(item:*):void
		{
			addItemAt(length, item);
		}
		
		public function addItemAt(index:uint, item:*):void
		{
			if (contains(item))
				return;
			
			if (index == length - 1)
				this[index] = item;
			else
			{
				var values:Array = toArray();
				values.splice(index, 0, item);
				initialize(KeyValuePair.fromList(values));
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function remove(item:*):void
		{
			if (contains(item))
			{
				var index:int = pairs.indexOf(values[item]);
				removeItemAt(index);
			}
		}

		public function removeItemAt(index:uint):void
		{
			if (index >= 0 && index < length)
			{
				delete this[index];
				
				if (index < length - 1)
				{
					var values:Array = toArray();
					initialize(KeyValuePair.fromList(values));
				}
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function contains(item:*):Boolean
		{
			return item in values;
		}
		
		/**
		 * @inheritDoc
		 */
		public function clear():void
		{
			initialize(new <KeyValuePair>[]);
		}
		
		/**
		 * @inheritDoc
		 */
		public function iterate():Iterator
		{
			return new LinearIterator(toArray());
		}
		
		/**
		 * @inheritDoc
		 */
		public function get isEmpty():Boolean
		{
			return length == 0;
		}
		
		/**
		 * @inheritDoc
		 */
		public function toArray():Array
		{
			var valueList:Array = [];
			
			for each (var pair:KeyValuePair in pairs)
			{
				valueList.push(pair.value);
			}
			
			return valueList.slice();
		}
		
		/**
		 * @inheritDoc
		 */
		public function getItemAt(index:int):*
		{
			if (index > 0 && index < length)
				return pairs[index].value;
			
			return undefined;
		}

		/**
		 * @inheritDoc
		 */
		public function indexOf(item:*, fromIndex:int = 0):int
		{
			if (item in values)
				return pairs.indexOf(values[item], fromIndex);
			
			return -1;
		}
		
		/**
		 * @inheritDoc
		 */
		public function lastIndexOf(item:*, fromIndex:int = int.MAX_VALUE):int
		{
			if (item in values)
				return pairs.lastIndexOf(values[item], fromIndex);
			
			return -1;
		}
		
		/**
		 * @inheritDoc
		 */
		public function includes(other:Set):Boolean
		{
			var otherItems:Iterator = other.iterate();
			
			while (otherItems.hasNext)
			{
				var otherItem:* = otherItems.getNext();
				
				if (this.contains(otherItem))
					continue;
				
				return false;
			}
			
			return true;
		}
		
		/**
		 * @inheritDoc
		 */
		public function difference(other:Set):Set
		{
			var result:LinearSet = new LinearSet(toArray());
			
			var otherItems:Iterator = other.iterate();
			while (otherItems.hasNext)
			{
				var otherItem:* = otherItems.getNext();
				
				if (this.contains(otherItem))
					result.remove(otherItem);
				else
					result.add(otherItem);
			}
			
			return result;
		}
		
		/**
		 * @inheritDoc
		 */
		public function intersect(other:Set):Set
		{
			var diff:Set = difference(other);
			var union:Set = merge(other);
			return union.difference(diff);
		}
		
		/**
		 * @inheritDoc
		 */
		public function merge(other:Set):Set
		{
			var result:LinearSet = new LinearSet(toArray());
			
			var otherItems:Iterator = other.iterate();
			while (otherItems.hasNext)
			{
				var otherItem:* = otherItems.getNext();
				result.add(otherItem);
			}
			
			return result;
		}
	}
}