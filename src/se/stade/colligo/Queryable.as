package se.stade.colligo
{
    import se.stade.colligo.iterators.Iterator;

    public interface Queryable extends Collection
    {
        function find(query:*):Iterator;
    }
}
