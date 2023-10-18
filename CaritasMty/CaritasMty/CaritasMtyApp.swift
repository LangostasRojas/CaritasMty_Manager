//
//  CaritasMtyApp.swift
//  CaritasMty
//
//  Created by Alumno on 31/08/23.
//

import SwiftUI

@main
struct CaritasMtyApp: App {
    init() {
        let verdePaleta = UIColor(red: 0, green: 156/255, blue: 166/255, alpha: 1)

        UISegmentedControl.appearance().selectedSegmentTintColor = verdePaleta
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
