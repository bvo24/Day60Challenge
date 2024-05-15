//
//  DetailView.swift
//  Day60Challenge
//
//  Created by Brian Vo on 5/14/24.
//

import SwiftUI

struct DetailView: View {
    
    let user : User
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    
                    Section(header: Text("User").font(.title2)){
                        Text("Name: \(user.name)")
                        Text("Age: \(user.age)")
                        Text("Address: \(user.address)")
                        Text("Active: \(user.isActive ? "Yes" : "No")")
                        Text("About: \(user.about)")
                        Text("Email: \(user.email)")
                        }
                        Spacer()
                        Section(header: Text("Tags").font(.title2)){
                    
                                ForEach(user.tags.indices, id: \.self) { index in
                                    Text(user.tags[index])
                        
                        
                                }
                    
                        }
                    Spacer()
                    Section(header: Text("Friends").font(.title2)){
                            
                                ForEach(user.friends){ friend in
                                    Text(friend.name)
                                    
                                
                            }
                            
                    
                        }
                    
                    
                    
                }
                .padding()
            }
            .navigationTitle("USER DETAILS")
            
            
            

            
            
        }
        
            
        
        
        
        
        
    }
}

    #Preview {
        
        do{
            let friend1 = Friend(id: UUID(), name: "Spongebob")
            let friend2 = Friend(id: UUID(), name: "Patrick")
            let friend3 = Friend(id: UUID(), name: "Plankton")
            
            let newUser = User(id: UUID(), isActive: true, name: "David", age: 22, email: "davidgoggins@gmail.com", address: "Mayonaise Street", about: "Im david goggins", registered: Date.now, tags: ["Athlete", "Bikini Bottom Associate"], friends: [friend1, friend2, friend3])
            
            
            
            
            return DetailView(user: newUser)
        }catch{
            return Text("Failed to create preview \(error.localizedDescription)")
        }
    
}
