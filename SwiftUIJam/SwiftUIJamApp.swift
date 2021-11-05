//
//  SwiftUIJamApp.swift
//  SwiftUIJam
//
//  Created by Marina Huber on 05.11.2021..
//

import SwiftUI

@main
struct SwiftUIJamApp: App {
    var body: some Scene {
        WindowGroup {
            MotionAnimationView(showMenu: .constant(false))
        }
    }
}
