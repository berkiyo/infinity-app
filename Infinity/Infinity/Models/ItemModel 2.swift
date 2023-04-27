import Foundation

/**
 The ItemModel package -- part of the MVVM integration
 */

// Immutable Struct - keep them let.
struct ItemModel: Identifiable, Codable {
    let id: String              // id
    let title: String           // name of streak
    var theDate: Int            // the number of days since streak started
    var isCompleted: Bool       // streak completed status
    var theStartDate: Date      // the start date (i.e. when the streak was first started
    var theColor: Int           // the color picked (array of 8 elements)
    
    
    // init
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, theDate: Int, theStartDate: Date, theColor: Int) {
        self.id = id
        self.title = title
        self.theDate = theDate
        self.isCompleted = isCompleted
        self.theStartDate = theStartDate
        self.theColor = theColor
    }
    
    // update the items
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: true, theDate: theDate, theStartDate: theStartDate, theColor: theColor)
    }
}
