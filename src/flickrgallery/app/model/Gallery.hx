package flickrgallery.app.model;

class Gallery extends mdata.ArrayList<GalleryItem>
{
	public function new(?values:Array<GalleryItem>=null)
	{
		super(values);
	}
}