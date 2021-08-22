import Foundation
import XCTest

@testable import GildedRose

class BackStagePassesTests: XCTestCase {

    
    func test_backstagePass_ItemCreation_Returns_CorrectItemType() {
        let item = SellableItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 2, quality: 0)
        XCTAssertEqual(item.itemType , .backstagePasses)
        
        let item2 = SellableItem(name: "Backstage pass to a random concert", sellIn: 2, quality: 0)
        XCTAssertNotEqual(item2.itemType , .backstagePasses)
    }
    
    func test_backstagePass_ItemAging_AgesApppriately() {
        let item = SellableItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 0)
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , 10)
        XCTAssertEqual(item.quality , 1)
    }

    func test_backstagePass_ItemAging_AgesDouble_When10Days_Remain() {
        let item = SellableItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 0)
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , 9)
        XCTAssertEqual(item.quality , 2)
    }
    
    func test_backstagePass_ItemAging_AgesDouble_When6Days_Remain() {
        let item = SellableItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 6, quality: 0)
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , 5)
        XCTAssertEqual(item.quality , 2)
    }

    func test_backstagePass_ItemAging_AgesTriple_When6Days_Remain() {
        let item = SellableItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 0)
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , 4)
        XCTAssertEqual(item.quality , 3)
    }
    
    func test_backstagePass_ItemAging_AgesToZerp_AfterConcert() {
        let item = SellableItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 0)
        item.applyAgeToQuality()
        XCTAssertEqual(item.sellIn , -1)
        XCTAssertEqual(item.quality , 0)
    }

    
}
