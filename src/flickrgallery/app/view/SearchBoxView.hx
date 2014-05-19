package flickrgallery.app.view;

import mmvc.api.IViewContainer;
import flickrgallery.core.View;

import flickrgallery.app.view.ButtonView;
import flickrgallery.app.view.InputView;

import js.Browser;
import js.html.Event;

class SearchBoxView extends View implements mmvc.api.IViewContainer
{
	public var viewAdded:Dynamic -> Void;
	public var viewRemoved:Dynamic -> Void;

	public function isAdded(view)
	{
		return true;
	}

	public function new()
	{
		tagName = "div";
		super();
		element.className = "form-inline";
		element.setAttribute("id", "container-searchbox");
		trace('SearchBoxView.new');
	}

	public function createViews()
	{
		trace('SearchBoxView.createViews');
		
		var inputView = new InputView();
		var buttonView = new ButtonView();
		addChild(inputView);
		addChild(buttonView);
	}

	override function initialize()
	{
		super.initialize();
		//trace('Adding to header');
		//js.Browser.document.getElementById('header').appendChild(element);
	}	
}