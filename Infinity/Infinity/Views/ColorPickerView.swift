import SwiftUI

struct ColorPickerView: View {
    
    @Binding var selectedColor: Color
    private let colors: [Color] = [
        .red, .yellow, .orange, .purple, .blue, .indigo, .green, .mint, .black, .white]
    
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(colors, id: \.self) {
                    color in
                    Circle()
                        .foregroundColor(color)
                        .frame(width: 45, height: 45)
                        .opacity(color == selectedColor ? 0.5 : 1.0)
                        .scaleEffect(color == selectedColor ? 1.1 : 1.0)
                        .onTapGesture {
                            selectedColor = color
                        }
                    
                }
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding(.horizontal)
        }
    }
}
