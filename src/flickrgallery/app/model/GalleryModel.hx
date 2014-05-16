package flickrgallery.app.model;

import flickrgallery.app.model.GalleryItemModel;
import msignal.Signal;

using mdata.Collections;

class GalleryModel extends mdata.ArrayList<GalleryItemModel>
{
	public function new(?values:Array<GalleryItemModel>=null)
	{
		super(values);
	}

	public function getAll()
	{
		return this.source;
	}

	public function findByImgId(id: String):GalleryItemModel
	{
		for( model in this.source )
		{
			if( model.id == id ) 
			{
				return model;
			}
		}

		return null;
	}
}