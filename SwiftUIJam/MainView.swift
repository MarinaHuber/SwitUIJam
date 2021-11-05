//
//  ContentView.swift
//  SwiftUIJam
//
//  Created by Marina Huber on 05.11.2021..
//

import SwiftUI

struct MainView: View {
    var body: some View {
        MotionAnimationView(showMenu: .constant(false))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice("iPhone 12")
        }
    }
}
