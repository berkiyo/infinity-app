import SwiftUI

// ListView
struct ListView: View {
    
    // See --> "ListViewModel.swift"
    @EnvironmentObject var listViewModel: ListViewModel
    @State var isPresenting = false
    @State private var showingAlert = false // this is for our alertview.
    @State var isEditing = false
    @State var isModal: Bool = false
    @State private var showingSheet = false // for sheet view
    
    
    
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
                    Button(action: {
                        showingSheet.toggle()
                    }, label: {
                        Text("+")
                        .font(.system(.largeTitle))
                        .frame(width: 77, height: 70)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 7)
                    })
                    .background(Color.blue)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                    .sheet(isPresented: $showingSheet) {
                                AddView()
                            }
        
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
