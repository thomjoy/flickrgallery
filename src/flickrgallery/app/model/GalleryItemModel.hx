package flickrgallery.app.model;

class GalleryItemModel
{
	public var id:String;
	public var favourite:Bool;

	public function new(id:String)
	{
		this.id = id;
		this.favourite = false;
	}

	/**
	Serializes the data object as a JSON string 
	*/
	public function toString():String
	{
		return haxe.Json.stringify(this);
	}
}