package flickrgallery.app.view;

import flickrgallery.core.View;

class GalleryItemView extends View
{
	public function new()
	{
		tagName = "li";
		super();
		element.className = "gallery-item";
		trace('GalleryItemView.new');
	}
}