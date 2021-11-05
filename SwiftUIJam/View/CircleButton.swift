//
//  CircleButton.swift
//  SwiftUIJam
//
//  Created by Marina Huber on 05.11.2021..
//

import SwiftUI

struct CircleButton: View {
    
    @Binding var showMenu: Bool
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    
    var body: some View {
        
        Button(action: { self.showMenu.toggle() }) {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
                .offset(x: self.currentPosition.width, y: self.currentPosition.height)
               // 3.
                .gesture(DragGesture()
                            .onChanged { value in
                    self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                } // 4.
                            .onEnded { value in
                    self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                    print(self.newPosition.width)
                    self.newPosition = self.currentPosition
                }
                )
           
        }
    }
}
