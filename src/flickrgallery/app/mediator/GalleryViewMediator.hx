package flickrgallery.app.mediator;

import flickrgallery.app.view.GalleryView;
import flickrgallery.app.view.GalleryItemView;

import flickrgallery.app.model.GalleryModel;
import flickrgallery.app.model.FavouritesModel;

import mdata.*;

class GalleryViewMediator extends mmvc.impl.Mediator<GalleryView>
{
	@inject 
	public var collection: GalleryModel;

	public function new()
	{
		super();
	}

	override function onRegister()
	{
		super.onRegister();
		view.createViews();

		mediate(collection.changed.add(onGalleryUpdate));
	}

	override public function onRemove():Void
	{
		super.onRemove();
	}

	public function onFavouritesChange(imgId:Dynamic)
	{
		trace(imgId);
		for( view in view.getChildren() )
		{
			if( view.id == imgId )
			{
				view.element.setAttribute('data-favourite', 'false');
			}
		}
	}

	// Fix the typing here by firing the event with the proper parameters
	public function onGalleryUpdate(event:Dynamic)
	{
		switch(event.type[0])
		{
			case "Add":
			{
				for( galleryItem in collection.getAll() )
				{
					var itemView = new GalleryItemView(galleryItem.id, galleryItem.url, galleryItem.isFavourite);
					view.addChild(itemView);
				}
			}

			case "Remove":
			{
				for( galleryItem in view.getChildren() )
				{
					view.removeChild(galleryItem);
				}

				trace(this.view.getChildren().length);
			}
		}
	}
}