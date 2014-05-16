package flickrgallery.app.model;

import msignal.Signal;

class GalleryItemModel 
{
	public var url:String;
	public var favourite:Bool;

	public var signal:Signal1<String>;

	inline public static var ADD_FAVOURITE = 'ADD_FAVOURITE';
	inline public static var REMOVE_FAVOURITE = 'REMOVE_FAVOURITE';

	public function new(url:String)
	{
		this.url = url;
		this.favourite = false;

		this.signal = new Signal1<String>();
	}

	public function toggleFavourite(oldStatus: Bool)
	{
		favourite = !oldStatus;

		var action = favourite ? GalleryItemModel.ADD_FAVOURITE :  GalleryItemModel.REMOVE_FAVOURITE;
		signal.dispatch( action );
	}
}