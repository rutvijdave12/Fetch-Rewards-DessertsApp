//
//  DessertDetailView.swift
//  DessertsUITests
//
//  Created by Rutvij Dave on 2/13/24.
//

import XCTest

final class DessertDetailView: XCTestCase {
    let app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testDessertDetailViewSwipeWorks() {
        app.launch()
        XCUIApplication().collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Apple & Blackberry Crumble"]/*[[".cells",".buttons[\"Apple & Blackberry Crumble\"].staticTexts[\"Apple & Blackberry Crumble\"]",".staticTexts[\"Apple & Blackberry Crumble\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let instructionsElement = XCUIApplication().scrollViews.otherElements.containing(.staticText, identifier:"Instructions").element
        instructionsElement/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        instructionsElement/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        instructionsElement/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        instructionsElement.swipeUp()
        instructionsElement/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    }
    
    
    func testDessertDetailViewWatchOnYouTubeButtonWorks() {
        app.launch()
        app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Apple & Blackberry Crumble"]/*[[".cells",".buttons[\"Apple & Blackberry Crumble\"].staticTexts[\"Apple & Blackberry Crumble\"]",".staticTexts[\"Apple & Blackberry Crumble\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Instructions").element/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        scrollViewsQuery.otherElements.buttons["Watch on YouTube"].tap()
                
        
                
    }

//
//    func DessertDetailViewSwipeWorks() {
//        let app = XCUIApplication()
//        app.launch()
//
//        
//    }
    
}
