package se.stade.colligo.associative
{
    public class KeyValuePair
    {
        public static function fromList(list:*):Vector.<KeyValuePair>
        {
            var pairs:Vector.<KeyValuePair> = new <KeyValuePair>[];
            
            for (var key:* in list)
            {
                pairs[pairs.length] = new KeyValuePair(key, list[key]);
            }
            
            return pairs;
        }
        
        public static function fromTable(table:*, keyProperty:String = "", valueProperty:String = ""):Vector.<KeyValuePair>
        {
            var pairs:Vector.<KeyValuePair> = new <KeyValuePair>[];
            
            if (keyProperty && valueProperty)
            {
                for (var key:* in table)
                {
                    pairs[pairs.length] = new KeyValuePair(table[key][keyProperty], table[key][valueProperty]);
                }
            }
            else if (keyProperty)
            {
                for (key in table)
                {
                    pairs[pairs.length] = new KeyValuePair(table[key][keyProperty], table[key]);
                }
            }
            else if (valueProperty)
            {
                for (key in table)
                {
                    pairs[pairs.length] = new KeyValuePair(key, table[key][valueProperty]);
                }
            }
            else
            {
                for (key in table)
                {
                    pairs[pairs.length] = new KeyValuePair(key, table[key]);
                }
            }
            
            return pairs;
        }
        
        public function KeyValuePair(key:*, value:*)
        {
            _key = key;
            _value = value;
        }
        
        private var _key:*;
        public function get key():*
        {
            return _key;
        }
        
        private var _value:*;
        public function get value():*
        {
            return _value;
        }
    }
}
