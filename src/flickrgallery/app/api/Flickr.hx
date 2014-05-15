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
		this.API_KEY = "4111e112a393aefbf0a66241479722cd";
		this.signal = new Signal1<Json>();
	}

	public function createUrl(method: String, params: String)
	{
		return "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=" +
				this.API_KEY + "&tags=cats" + "&format=json&nojsoncallback=1";
	}

	public function makeRequest(method: String, params: String)
	{
		var loader = new JsonLoader(this.createUrl(method, params));
		loader.loaded.add(onLoadedContent);
		loader.load();
	}

	public function onLoadedContent(event: LoaderEvent<Json>)
	{
		switch (event.type)
		{
			case Complete:
				// do stuff with the JSON
				this.signal.dispatch(event.target.content);

			case Fail(e):
				this.signal.dispatch(event.target.content);

			default:
				this.signal.dispatch(event.target.content);
		}
	}

	// Methods
	public function search(searchTerm: String)
	{
		return this.makeRequest("search", searchTerm);
	}
}