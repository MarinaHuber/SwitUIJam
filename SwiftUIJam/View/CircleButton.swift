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
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 20)
                .overlay(TextOverlay().offset(x: self.currentPosition.width, y: self.currentPosition.height), alignment: .center)

       }
        .gesture(
            DragGesture().onChanged { value in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
        } // 4.
                    .onEnded { value in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
            self.newPosition = self.currentPosition
            //not ideal it shows menu on every drag end
            self.showMenu.toggle()
        }
       )
    }
}

struct TextOverlay: View {
    var body: some View {
        ZStack {
            Text("Pull up")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.teal)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}
