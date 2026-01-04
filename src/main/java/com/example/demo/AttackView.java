package com.example.demo;

import com.vaadin.flow.component.html.IFrame;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;

@Route("attack")
public class AttackView extends VerticalLayout {

	public AttackView() {
		IFrame gameFrame = new IFrame("attack/index.html");

		gameFrame.setSizeFull();
		gameFrame.getElement().getStyle().set("border", "none");
		gameFrame.getElement().getStyle().set("display", "block");

		add(gameFrame);

		setPadding(false);
		setSpacing(false);

		// Setup layout
		setSizeFull();
		setJustifyContentMode(JustifyContentMode.CENTER);
		setAlignItems(Alignment.CENTER);
	}
}
