import Foundation
import XCTest

@testable import GildedRose

class GildedRoseTests: XCTestCase {

    func testFoo() {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items);
        app.updateQuality();
        
        XCTAssertEqual("foo", app.items[0].name);
    }
    
    func testOutput_For_Main_File() {
        let items = [
            Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            Item(name: "Aged Brie", sellIn: 2, quality: 0),
            Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
            // this conjured item does not work properly yet
            Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)]
        
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
}
