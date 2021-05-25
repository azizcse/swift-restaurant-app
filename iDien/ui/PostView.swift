//
//  PostView.swift
//  iDien
//
//  Created by Azizul Islam on 25/5/21.
//

import SwiftUI

struct PostView: View {
    @EnvironmentObject var order : Order
    
    @State var posts : [Post] = []
    
    var body: some View {
        NavigationView{
            List(posts){post in
                NavigationLink(destination:Text(post.body)){
                    Text(post.title).padding()
                }
                
            }
            .onAppear{
                Api().getPosts{ (posts) in
                    self.posts = posts
                }
            }
            .navigationTitle("Post")
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView().environmentObject(Order())
    }
}
