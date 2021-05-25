//
//  MainView.swift
//  iDien
//
//  Created by Azizul Islam on 17/4/21.
//

import SwiftUI


struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem { Label("Menu", systemImage:"list.dash")}
            OrderView()
                .tabItem { Label("Order", systemImage:"square.and.pencil") }
            PostView()
                .tabItem{Label("Post", systemImage:"doc.plaintext")}
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
          
    }
}
