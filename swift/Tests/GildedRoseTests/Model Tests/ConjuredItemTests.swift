import Foundation
import XCTest

@testable import GildedRose

class ConjuredItemTests: XCTestCase {
    
    func test_conjuredItem_ItemCreation_Returns_CorrectItemType() {
        let item = SellableItem(name: "Conjured Item", sellIn: 2, quality: 0)
        XCTAssertEqual(item.itemType , .conjuredItem)
        
        let item2 = SellableItem(name: "conJured Item", sellIn: 2, quality: 0)
        XCTAssertEqual(item2.itemType , .conjuredItem)
        
        let item3 = SellableItem(name: "Conjurd item", sellIn: 2, quality: 0)
        XCTAssertNotEqual(item3.itemType , .backstagePasses)
        
        let item4 = SellableItem(name: "conjureditem", sellIn: 2, quality: 0)
        XCTAssertNotEqual(item4.itemType , .backstagePasses)
    }
    
    func test_conjuredItem_ItemAging_AgesApppriately() {
        let item = SellableItem(name: "Conjured Item", sellIn: 10, quality: 20)
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , 9)
        XCTAssertEqual(item.quality , 18)
    }
    
    func test_conjuredItem_ItemAging_AgesDouble_AfterExpiry() {
        let item = SellableItem(name: "Conjured Item", sellIn: 1, quality: 10)
        // When 1 Day remaining
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , 0)
        XCTAssertEqual(item.quality , 8)
        
        // After Expiry
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , -1)
        XCTAssertEqual(item.quality , 4)
    }
}
