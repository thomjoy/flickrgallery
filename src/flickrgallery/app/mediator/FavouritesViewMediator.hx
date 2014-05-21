package flickrgallery.app.mediator;

import flickrgallery.app.view.FavouritesView;
import flickrgallery.app.view.FavouritesItemView;

import flickrgallery.app.model.FavouritesModel;

class FavouritesViewMediator extends mmvc.impl.Mediator<FavouritesView>
{
	@inject 
	public var collection: FavouritesModel;

	public function new()
	{
		super();
	}

	override function onRegister()
	{
		super.onRegister();
		
		// when the collection changes, update the view
		mediate(collection.signal.add(onUpdate));
	}

	override public function onRemove():Void
	{
		super.onRemove();
	}

	// Use our custom list event due to the need to do a bunch of view related stuff
	public function onUpdate(id:String, action:String)
	{
		switch(action)
		{
			case "Add":
			{
				var fave = collection.findByImgId( id );
				var itemView = new FavouritesItemView(fave.id, fave.url, fave.isFavourite);
				//itemView.parent = this.view;
				this.view.addChild(itemView);
			}

			case "Remove":
			{
				var children = view.getChildren();
				for( child in children )
				{
					if( js.Browser.document.getElementById(child.id).getAttribute('data-img-id') == id )
					{
						this.view.removeChild( child );
					}
				}
			}
		}

		view.updateStatus(collection.length);
	}
}