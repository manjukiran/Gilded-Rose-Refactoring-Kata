import Foundation
import XCTest

@testable import GildedRose

class GildedRoseTests: XCTestCase {

    func testOutput_For_Main_File() {
        let items = [
            SellableItem(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            SellableItem(name: "Aged Brie", sellIn: 2, quality: 0),
            SellableItem(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
            SellableItem(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            SellableItem(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            SellableItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
            SellableItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
            SellableItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
            // this conjured item does not work properly yet
            SellableItem(name: "Conjured Mana Cake", sellIn: 3, quality: 6)]
        
        let app = GildedRose(items: items);
        let days = 5
        var outputString = ""
        (0...days).forEach {
            var dayOutPutString = ""
            dayOutPutString += "-------- day \($0) --------"
            dayOutPutString += "\n" + "name, sellIn, quality";
            for item in items {
                dayOutPutString += "\n" + item.description;
            }
            outputString += "\(dayOutPutString)\n\n";
            app.updateQuality();
        }
        XCTAssertEqual(outputString, TestValues.Five_Day_Aging)
    }
    
    func test_performance_for_large_itemSize_and_DaysToExpiry() {
        let itemsArray = [
            SellableItem(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            SellableItem(name: "Aged Brie", sellIn: 2, quality: 0),
            SellableItem(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
            SellableItem(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            SellableItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
            SellableItem(name: "Conjured Mana Cake", sellIn: 3, quality: 6)]
        
        var items = [SellableItem]()
        let itemCount = 10000
        let dayCount = 100
        for _ in (0..<itemCount) {
            let randomIndex = Int.random(in: 0..<itemsArray.count)
            items.append(itemsArray[randomIndex])
        }
        let app = GildedRose(items: items)
        measure {
            for _ in (0..<dayCount) {
                app.updateQuality()
            }
        }
    }
}
