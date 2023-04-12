import SwiftUI

struct ListRowView: View {
    @Environment(\.scenePhase) var scenePhase
    let item: ItemModel
    /**
     MAIN BODY
     */
    var body: some View {
        // This is where we put thenumber of days since calculation, nice and simple
        
        // Difference between start date + today's date
        // see if hour
        let diffs = Calendar.current.dateComponents([.day], from: item.theStartDate, to: Date.now)
        let diffsString = "\(diffs.day!)"
        
        // View begins here
        HStack {
            
            /**
             The Design
             * User picks emoji for their goal
             * [icon/colour] [name of goal] ------- [date information vstack]
             */
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(colorConverter())
            Text(item.title)
            Spacer()
            VStack(alignment: .trailing){
                let dateStored = String(item.theDate)
                
            
                Text(diffsString + " days")
                
                Text("Since: " + item.theStartDate.formatted())
                    .font(.caption)
                
            }
        }
        .padding(.vertical, 8)
    }
    
    /**
     COLOR PICKER CALCULATIONS
     This is where we calculate what color value we want to set it to
     **/
    func colorConverter() -> Color {
        switch item.theColor {
        case 0:
            return .red
        case 1:
            return .yellow
        case 2:
            return .orange
        case 3:
            return .purple
        case 4:
            return .blue
        case 5:
            return .indigo
        case 6:
            return .green
        case 7:
            return .mint
        default:
            return .red
        }
    }
}


