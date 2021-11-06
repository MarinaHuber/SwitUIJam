//
//  ContentView.swift
//  SwiftUIJam
//
//  Created by Marina Huber on 05.11.2021..
//

import SwiftUI

let screen = UIScreen.main.bounds

struct MainView: View {
    
    @State var showMenu: Bool
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {

            MotionAnimationView()
            CircleButton(showMenu: $showMenu)
                .offset(y: showMenu ? -190 : 0)
                .rotation3DEffect(Angle(degrees: showMenu ? Double(viewState.height / 10) - 10 : 0), axis: (x: 15, y: 0, z: 0))
                .scaleEffect(showMenu ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all)

            
            MenuView()
                .background(Color.black.opacity(0.002))
                .offset(y: showMenu ? 0 : screen.height) // start position
                .offset(y: viewState.height - 200) // position of menu
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showMenu.toggle()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                    }
                    //returning menu to start position after drag
                    .onEnded { value in
                        if self.viewState.height > 50 {
                            self.showMenu = false
                        }
                        self.viewState = .zero
                    }
                )
        }
       
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(showMenu: false)
                .previewDevice("iPhone 12")
        }
    }
}
