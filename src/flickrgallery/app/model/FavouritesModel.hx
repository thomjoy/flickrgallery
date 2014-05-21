package flickrgallery.app.model;

import flickrgallery.app.model.GalleryModel;
import flickrgallery.app.model.GalleryItemModel;
import msignal.Signal;

class FavouritesModel extends GalleryModel 
{
  @inject
  public var galleryModel:GalleryModel;

  public var signal: Signal2<String, String>;

	public function new(?values:Array<GalleryItemModel>=null)
	{
		super(values);
    this.signal = new Signal2<String,String>();
	}

  public function refresh()
  {
    var results = [];

    for( model in this.source )
    {
      if( model.isFavourite == true ) 
      {
        results.push(model);
      }
    }

    return results;
  }

  public function update(imgId, status)
  {
    var imgModel = galleryModel.findByImgId(imgId);

    if( status == true )
    {
      this.add( imgModel );
      trace('Add to favourites');
    }
    else
    {
      this.remove( galleryModel.findByImgId(imgId) );
      trace('Remove from favourites');
    }

    var strStatus = status ? "Add" : "Remove";

    signal.dispatch(imgModel.id, strStatus);
  }
}