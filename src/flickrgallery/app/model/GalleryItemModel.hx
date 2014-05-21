package flickrgallery.app.model;

import msignal.Signal;

using mdata.Collections;

class GalleryItemModel 
{
	public var id:String;
	public var url:String;
	public var isFavourite:Bool;

	public var signal:Signal2<String, String>;

	inline public static var ADD_FAVOURITE = 'ADD_FAVOURITE';
	inline public static var REMOVE_FAVOURITE = 'REMOVE_FAVOURITE';

	public function new(id: String, url:String)
	{
		this.id = id;
		this.url = url;
		this.isFavourite = false;

		this.signal = new Signal2<String, String>();
	}

	public function toggleFavourite(oldStatus: Bool)
	{
		isFavourite = !oldStatus;

		var action = isFavourite ? GalleryItemModel.ADD_FAVOURITE :  GalleryItemModel.REMOVE_FAVOURITE;
		signal.dispatch( id, action );
	}
}