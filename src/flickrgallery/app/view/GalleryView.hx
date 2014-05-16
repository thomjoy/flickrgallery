package flickrgallery.app.view;

import mmvc.api.IViewContainer;

import flickrgallery.app.view.GalleryItemView;
import flickrgallery.core.DataView;

import js.Browser;
import js.html.Event;
import js.Browser.document;

class GalleryView extends DataView<GalleryItemView> implements mmvc.api.IViewContainer
{
	public var viewAdded:Dynamic -> Void;
	public var viewRemoved:Dynamic -> Void;

	public function isAdded(view:Dynamic):Bool
	{
		return true;
	}

	public function new()
	{
		tagName = "ul";
		super();
		element.setAttribute("id", "gallery");
		trace('GalleryView.new');
	}

	public function createViews()
	{
		trace('GalleryView.createViews');
	}

	override function initialize()
	{
		super.initialize();
		js.Browser.document.getElementById('app-container').appendChild(element);
	}
}