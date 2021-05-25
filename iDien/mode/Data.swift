//
//  Data.swift
//  iDien
//
//  Created by Azizul Islam on 25/5/21.
//

import Foundation

struct Post:Codable, Identifiable {
    var id: Int
    var title : String
    var body : String
}

class Api{
    func getPosts(completion: @escaping ([Post]) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!){ data, _, error in
            DispatchQueue.main.async {
                let posts = try! JSONDecoder().decode([Post].self, from: data!)
                completion(posts)
            }
        }.resume()
    }
    
   
}
