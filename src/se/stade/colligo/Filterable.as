package se.stade.colligo
{
    import se.stade.colligo.filters.Filter;
    import se.stade.colligo.iterators.Iterator;

    public interface Filterable extends Collection
    {
        function applyFilter(filter:Filter):Iterator;
    }
}
