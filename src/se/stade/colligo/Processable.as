package se.stade.colligo
{
    /**
     * A processable collection wraps functionality to perform operations such
     * as setting a property or calling a method on all items in the collection.
     * 
     * @author Marcus Stade
     */
    public interface Processable extends Collection
    {
        /**
         * Returns the common value of the property of the given name, if there
         * is one. If the value of the property defined by the given name varies
         * among items, or one or more items does not own the property, the value
         * is undefined.
         * 
         * @param property The name of the property to get the common value of.
         * @return The common value of the given property; undefined if the value varies, one or more items does not define the given property or the collection is empty.
         */
        function get(property:String):*;
        
        /**
         * For each item in the collection, set all properties defined by the template
         * object. If any of the properties does not exist on the item, it is silently
         * skipped with no errors being thrown.
         * 
         * @param properties An object that defines the properties to set.
         */
        function set(properties:Object):void;
        
        /**
         * For each item in the collection, call the given method with the given
         * parameters If the method does not exist on the item, the item is silently
         * skipped with no errors being thrown. If there is a common return value,
         * i.e. each item in the list returns the same value when the method is
         * called, then that value is returned. Otherwise the return value is
         * undefined.
         * 
         * @param method The name of the method to call.
         * @param parameters An optional comma separated list of parameters.
         * @return The common value of the method call; undefined if the value varies, one or more items does not define the method or the collection is empty.
         * 
         * @throws ArgumentError If an item does define the specified method, 
         */
        function call(method:String, ... parameters):*;
    }
}
