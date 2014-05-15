package flickrgallery.app.command;

import mmvc.impl.Command;
import flickrgallery.app.signal.Search;
import flickrgallery.app.api.Flickr;

class SearchCommand extends mmvc.impl.Command
{
	@inject
	public var search: Search;

	// how to get the flickr API service in here???
	@inject 
	public var flickr: Flickr;

	override public function execute():Void
	{
		// Where does the search term come from?
		// From the Search Signal?
		// Flickr.search()

		//Search.completed.dispatch(Flickr.search(SEARCH_TERM))
		trace('Command.execute');
	}
}