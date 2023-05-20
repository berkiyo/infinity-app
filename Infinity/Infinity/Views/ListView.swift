import SwiftUI

// ListView
struct ListView: View {
    
    // See --> "ListViewModel.swift"
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var showingAlert = false // this is for our alertview.
    @State var isEditing = false
    @State var isModal: Bool = false
    
    
    
    
    /**
     Start Body
     */
    var body: some View {
        
        
        ZStack {
            if listViewModel.items.isEmpty { // if there are no items, run this code.
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                    .environmentObject(listViewModel)
            } else {
                List {
                    ForEach(listViewModel.items) {
                        item in ListRowView(item: item)
                            .onTapGesture {
                                self.showingAlert = true
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item) // update item
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem) // all from "ListViewModel.swift"
                    .toolbar {
                        EditButton()
                    }
                    .alert(isPresented:$showingAlert) { // SHOW ALERT TO RESET STREAK
                        Alert(
                            title: Text("Do you want to reset your streak?"),
                            message: Text("This can't be undone."),
                            primaryButton: .destructive(Text("Reset")) {
                                print("Streak reset")
                            },
                            secondaryButton: .cancel()
                        )
                    }
                } // END LIST
                .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
            } // END ELSE
            
            // BUTTON
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ExpandableButtonPanelView(
                      primaryItem: ExpandableButtonItem(label: "♾️"), // No action
                      secondaryItems: [
                        ExpandableButtonItem(label: "✏️") {
                          // Can add action, if necessary
                        },
                        ExpandableButtonItem(label: "➕") {
                          // Can add action, if necessary
                        }
                      ]
                    )
                }// END HSTACK
                .padding()
            } // END VSTACK
        } // END ZSTACK
        .navigationTitle("Infinity")
        /*
        .navigationBarItems(
            leading:
                Button(action: {
                    self.isEditing.toggle()
                }) {
                    Text(isEditing ? "✅" : "✏️")
                },
            trailing:
                HStack {
                    NavigationLink("➕", destination: AddView().environmentObject(listViewModel))
                }
        )
         */
    }
    

}
