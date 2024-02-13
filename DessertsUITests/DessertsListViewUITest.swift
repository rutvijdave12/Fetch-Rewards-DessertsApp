//
//  DessertsListViewUITest.swift
//  DessertsUITests
//
//  Created by Rutvij Dave on 2/13/24.
//

import XCTest

final class DessertsListViewUITest: XCTestCase {
    let app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testDessertsListViewListButtonShouldClick(){
        app.launch()
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Apam balik"]/*[[".cells.buttons[\"Apam balik\"]",".buttons[\"Apam balik\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let navBar = app.navigationBars["Apam balik"]
        navBar.staticTexts["Apam balik"].tap()
        XCTAssert(navBar.exists)
    }
    
    func testDessertsListViewListButtonShouldClickAndBackButtonShouldNavigateBack(){
        app.launch()
        let mainNavBar = app.navigationBars["🍰 Desserts"]
        let dessertsStaticText = mainNavBar.staticTexts["🍰 Desserts"]
        dessertsStaticText.tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Apam balik"]/*[[".cells.buttons[\"Apam balik\"]",".buttons[\"Apam balik\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let apamBalikNavigationBar = app.navigationBars["Apam balik"]
        let apamBalikStaticText = apamBalikNavigationBar.staticTexts["Apam balik"]
        apamBalikStaticText.tap()
        apamBalikStaticText.tap()
        apamBalikNavigationBar.buttons["🍰 Desserts"].tap()
        dessertsStaticText.tap()
        dessertsStaticText.tap()
        XCTAssert(mainNavBar.exists)
    }

}
