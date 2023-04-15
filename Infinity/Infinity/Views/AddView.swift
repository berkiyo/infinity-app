import SwiftUI
import Foundation

extension String {
    func removeNewLines(_ delimiter: String = "") -> String {
        self.replacingOccurrences(of: "\n", with: delimiter)
    }
}

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode // telling us where we are in the view hierarchy
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    // Alerts for fields
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // For date picker
    @State private var pickedDate = Date.now
    @State private var todayDate = Date.now
    
    // For color picker
    @State private var selectedColor: Color = .red
    
    var body: some View {
        
        /**
         The styling of the AddView goes here.
         */
        ScrollView {
            VStack {
                TextField("Streak name (e.g. junk food)", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                
                Divider() // add a divider
                    .padding(.horizontal)
                    .padding(.vertical)
                
                Text("Pick your color")
                    .fontWeight(.medium)
                
                // COLOR PICKER
                ColorPickerView(selectedColor: $selectedColor)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 50)
                    
                
                Spacer()
                
                HStack {
                    Text("Selected Color")
                        .padding(.vertical)
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(selectedColor)
                }
                .padding(.vertical, 20)
                
                /**
                 BEGIN DATE/CALENDAR LOGIC
                 */
                HStack {
                    Text("Start Date")
                        .fontWeight(.medium)
                }
                //.frame(maxWidth: .infinity, alignment: .leading) //<-- Here
                
                
                DatePicker("Enter your date", selection: $pickedDate, in: ...Date())
                    .datePickerStyle(GraphicalDatePickerStyle())
                /*
                 DatePicker("Streak started on date:", selection: $pickedDate)
                 .datePickerStyle(GraphicalDatePickerStyle())
                 .frame(maxHeight: 400)
                 
                 */
                Divider() // add a divider
                    .padding(.horizontal)
                    .padding(.vertical)
                
                HStack {
                    Button(action: saveButtonPressed, label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: 200)
                            .background(Color.accentColor)
                            .cornerRadius(10, antialiased: true)
                        
                        Button(action: clearButtonPressed, label: {
                            Text("Clear".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 55)
                                .frame(maxWidth: 200)
                                .background(Color.gray)
                                .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        })
                    })
                }
            }
            .padding(14) // add some padding
        }
        .navigationTitle("Add an activity ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    /**
     COLOR PICKER CALCULATIONS
     This is where we calculate what color value we want to set it to
     **/
    func colorConverter() -> Int {
        switch selectedColor {
        case .red:
            return 0
        case .yellow:
            return 1
        case .orange:
            return 2
        case .purple:
            return 3
        case .blue:
            return 4
        case .indigo:
            return 5
        case .green:
            return 6
        case .mint:
            return 7
        default:
            return 0
        }
    }
    
    /**
     saveButtonPressed()
     When the save button is pressed, this function comes into action.
     */
    func saveButtonPressed() {
        if textIsAppropriate() { // if textIsAppropriate is true...
            // find the difference between two dates
            let diffs = Calendar.current.dateComponents([.day], from: pickedDate, to: todayDate)
            print(diffs.day!)
            
            listViewModel.addItem(title: textFieldText, theDate: Int(diffs.day!), theStartDate: pickedDate, theColor: colorConverter())
            presentationMode.wrappedValue.dismiss() // go back one in the presentation view hierarchy.
        }
        
    }
    
    /**
     clearButtonPressed()
     When the clear button is pressed, it will clear out all the text in the field
     */
    func clearButtonPressed() {
        textFieldText = ""
    }
    
    /**
     textIsAppropriate()
     Check and see if the number of characters is appropriate
     */
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    /**
     getAlert()
     Initiates the alert function.
     */
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

