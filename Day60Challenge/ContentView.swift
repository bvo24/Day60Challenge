//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Brian Vo on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        //        List(users, id: \.id){ user in
        //            VStack{
        //                Text(user.name)
        //
        //
        //
        //                Text(user.registered,  format: .dateTime.day().month().year())
        //            }
        
        
        
        //        }
        NavigationStack{
            List{
                ForEach(users, id: \.self){user in
                    NavigationLink(value: user){
                        Text(user.name)
                    }
                    
                    
                }
                
            }
            .task{
                await loadData()
            }
            .navigationDestination(for: User.self){ user in
            DetailView(user: user)
                    }
            .navigationTitle("Users")
            
        }
    }
        
    
    
    //Functions etc.
    func loadData() async{
        
        guard users.isEmpty else{return}
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else{
            print("Invalid URL")
            return
        }
        
        
        //Forogt date decoder?
        let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse =  try? decoder.decode([User].self, from: data){
                
                users = decodedResponse
                
                
            }
            
            
            
        }catch{
            
            print("Invalid data")
        }
                
    
    }
    
    
    
    
}

#Preview {
    ContentView()
}
