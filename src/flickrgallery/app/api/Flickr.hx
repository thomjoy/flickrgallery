package flickrgallery.app.api;

import mloader.Loader;
import mloader.JsonLoader;

import msignal.Signal;
import haxe.Json;

class Flickr
{
	public var API_KEY: String;
	public var SECRET: String;

	public var signal: Signal1<Json>;

	public function new()
	{
		API_KEY = "4111e112a393aefbf0a66241479722cd";
		signal = new Signal1<Json>();
	}

	public function createUrl(method: String, param: String)
	{
		return "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=" +
				this.API_KEY + "&tags=" + param + "&format=json&nojsoncallback=1&per_page=24";
	}

	public function makeRequest(method: String, param: String)
	{
		trace('makeRequest');
		var loader = new JsonLoader(this.createUrl(method, param));
		loader.loaded.add(onLoadedContent).forType(Complete);
		loader.load();
	}

	public function onLoadedContent(event: LoaderEvent<Json>)
	{
		signal.dispatch(event.target.content);
	}

	public function search(searchTerm: String)
	{
		return this.makeRequest("search", searchTerm);
	}
}