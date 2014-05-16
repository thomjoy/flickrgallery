package flickrgallery.app.model;

import flickrgallery.app.model.GalleryModel;
import flickrgallery.app.model.GalleryItemModel;
import msignal.Signal;

class FavouritesModel extends GalleryModel 
{
	public function new(?values:Array<GalleryItemModel>=null)
	{
		super(values);
	}
}