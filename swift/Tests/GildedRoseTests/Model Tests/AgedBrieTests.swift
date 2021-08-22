import Foundation
import XCTest

@testable import GildedRose

class AgedBrieTests: XCTestCase {
    
    func test_brie_ItemCreation_Returns_CorrectItemType() {
        let item = Item(name: "Aged Brie", sellIn: 2, quality: 0)
        XCTAssertEqual(item.itemType , .agedBrie)
    }
    
    func test_brie_ItemAging_AgesApppriately() {
        let item = Item(name: "Aged Brie", sellIn: 2, quality: 0)
        
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , 1)
        XCTAssertEqual(item.quality , 1)
    }

    func test_brie_ItemAging_AgesDoublyWell_AfterExpiry() {
        let item = Item(name: "Aged Brie", sellIn: 0, quality: 0)
        
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , -1)
        XCTAssertEqual(item.quality , 2)
    }
    
}
