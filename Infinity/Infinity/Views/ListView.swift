import SwiftUI

// ListView
struct ListView: View {
    
    // See --> "ListViewModel.swift"
    @EnvironmentObject var listViewModel: ListViewModel
    @State var isPresenting = false
    @State private var showingAlert = false // this is for our alertview.
    @State var isModal: Bool = false
    @State var show = false
    @State var editMode = EditMode.inactive
    
    
    /**
     Start Body
     */
    var body: some View {
        
        
        
        ZStack {
            
            if listViewModel.items.isEmpty { // if there are no items, run this code.
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                    .environmentObject(listViewModel)
            }
            
            else {
                List {
                    ForEach(listViewModel.items) {
                        item in ListRowView(item: item)
                            .onTapGesture {
                                //self.showingAlert = true
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item) // update item
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem) // all from "ListViewModel.swift"
                    .onMove(perform: listViewModel.moveItem(from:to:))
                    /* // FUTURE VERSION (Reset Streak)
                    .alert(isPresented:$showingAlert) { // SHOW ALERT TO RESET STREAK
                        Alert(
                            title: Text("Do you want to reset your streak?"),
                            message: Text("This can't be undone."),
                            primaryButton: .destructive(Text("Reset")) {
                                listViewModel.updateItem(item: <#T##ItemModel#>)
                                print("Streak reset!") // DEBUG PURPOSES
                            },
                            secondaryButton: .cancel()
                        )
                    }
                     */
                } // END LIST
                .environment(\.editMode, $editMode)
                .animation(.spring())
            } // END ELSE
            
            // BUTTON
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    FloatingActionButton(show: $show, editMode: $editMode)
                }// END HSTACK
                .padding()
            } // END VSTACK
        } // END ZSTACK
    }
    
    
    
    
    
    
    
    
    
    //////////////////////////////////////////////////////////////////////////
    /**
     FLOATING ACTION BUTTON
     This is for editing and adding new goals.
     */
    struct FloatingActionButton : View {
         
        @Binding var show : Bool
        @State private var showingSheet = false // for sheet view
        @State var isEditing = true
        @Binding var editMode: EditMode
        
        var body: some View {
             
            VStack(spacing : 20) {
                 
                if self.show {
                    Button(action: {
                        self.isEditing.toggle()
                        if isEditing {
                            editMode = EditMode.inactive
                        }
                        else {
                            editMode = EditMode.active
                        }
                    }) {
                        if isEditing {
                            Image(systemName: "pencil")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(22)
                        }
                        else {
                            Image(systemName: "square.and.arrow.down")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(22)
                        }
                    }
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                     
                    Button(action: {
                        showingSheet.toggle()
                    }) {
                        Image(systemName: "plus").resizable().frame(width: 25, height: 25).padding(22)
                    }
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                    .sheet(isPresented: $showingSheet) { AddView() } // SHOW SHEET
                }
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "aqi.medium").resizable().frame(width: 25, height: 25).padding(22)
                }
                .background(Color.accentColor)
                .foregroundColor(Color.white)
                .clipShape(Circle())
                .rotationEffect(.init(degrees: self.show ? 180 : 0))
                .shadow(color: Color.black.opacity(0.3),
                        radius: 3,
                        x: 3,
                        y: 3)
                .padding(.bottom, 20)
            }.animation(.spring())
        }
    }

}


