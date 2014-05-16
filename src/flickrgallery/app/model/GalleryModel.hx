package flickrgallery.app.model;

import flickrgallery.app.model.GalleryItemModel;
import msignal.Signal;

class GalleryModel extends mdata.ArrayList<GalleryItemModel>
{
	public function new(?values:Array<GalleryItemModel>=null)
	{
		super(values);
	}

	public function createGalleryItems(imgUrls: Array<String>)
	{
		for( i in 0...imgUrls.length )
		{
			this.add( new GalleryItemModel(imgUrls[i]) );
			trace('adding: ' + imgUrls[i] );
		}
	}

	public function getAll()
	{
		return this.source;
	}
}