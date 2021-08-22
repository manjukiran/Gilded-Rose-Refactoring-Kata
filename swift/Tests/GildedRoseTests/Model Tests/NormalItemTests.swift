import Foundation
import XCTest

@testable import GildedRose

class NormalItemTests: XCTestCase {
    
    func test_normal_ItemCreation_Returns_CorrectItemType() {
        let item = Item(name: "Brie", sellIn: 2, quality: 0)
        XCTAssertEqual(item.itemType , .normalItem)
    }
    
    func test_normal_ItemAging_AgesApppriately() {
        let item = Item(name: "Brie", sellIn: 2, quality: 10)

        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , 1)
        XCTAssertEqual(item.quality , 9)
    }

    func test_normal_ItemAging_AgesDoubly_AfterExpiry() {
        let item = Item(name: "Brie", sellIn: 0, quality: 10)
        
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , -1)
        XCTAssertEqual(item.quality , 8)
    }
    
}
