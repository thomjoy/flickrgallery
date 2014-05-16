package flickrgallery.app.mediator;

import flickrgallery.app.view.FavouritesView;
import flickrgallery.app.view.GalleryItemView;

import flickrgallery.app.model.FavouritesModel;
import flickrgallery.app.model.GalleryModel;

import mdata.*;

class FavouritesViewMediator extends mmvc.impl.Mediator<FavouritesView>
{
	@inject 
	public var collection: FavouritesModel;

	@inject
	public var gallery: GalleryModel;

	public function new()
	{
		super();
	}

	override function onRegister()
	{
		super.onRegister();
		
		//mediate(collection.changed.add(onGalleryUpdate));
		trace('GalleryViewMediator.onRegister');
	}

	override public function onRemove():Void
	{
		super.onRemove();
		trace('GalleryViewMediator.onRemove');
	}

	// Fix the typing here by firing the event with the proper parameters
	public function onGalleryUpdate(event:Dynamic)
	{
		switch(event.type[0])
		{
			case "Add":
			{
				for( galleryItem in gallery.getFavourites() )
				{
					var itemView = new GalleryItemView(galleryItem.id, galleryItem.url);
					view.addChild(itemView);
				}
			}

			case "Remove":
			{
				trace('Remove the old subviews');
			}
		}
	}
}