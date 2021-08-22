import Foundation
import XCTest

@testable import GildedRose

class SulfurasTests: XCTestCase {

    
    func test_sulfuras_ItemCreation_Returns_CorrectItemType() {
        let item = SellableItem(name: "Sulfuras, Hand of Ragnaros", sellIn: 2, quality: 0)
        XCTAssertEqual(item.itemType , .sulfuras)
    }
    
    func test_sulfuras_ItemAging_AgesApppriately() {
        let item = SellableItem(name: "Sulfuras, Hand of Ragnaros", sellIn: 2, quality: 10)
        
        for _ in (0...100){
            item.applyAgeToQuality()
        }
        XCTAssertEqual(item.sellIn , 2)
        XCTAssertEqual(item.quality , 10)
    }
}
