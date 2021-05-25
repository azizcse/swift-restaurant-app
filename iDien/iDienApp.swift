//
//  iDienApp.swift
//  iDien
//
//  Created by Azizul Islam on 10/4/21.
//

import SwiftUI

@main
struct iDienApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
