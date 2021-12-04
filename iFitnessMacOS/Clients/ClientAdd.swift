//
//  ClientAdd.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import SwiftUI

struct ClientAdd: View {
    @State var clients = [Client]()
    @State var userClub = [UserClubs]()
    @State var pickerUser : Client? = nil
    var body: some View {
        VStack{
//            Picker("ID Пользователя",selection: $pickerUser, content: {
//                ForEach(userClub, id: \.self){item in
//                    Text("\(item.id)")
//                }
//            })
            Form{
                Section{
                    Picker("ID Пользователя", selection: $pickerUser){
                        ForEach(userClub, id:\.self){ item in
                            Text("\(item.id)").tag(item.id)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                }
            }
        }
        .onAppear{
            ClientModel().fetch{items in
                self.clients = items
            }
            UserClubModel().fetch{ item in
                self.userClub = item
            }
        }
        .padding()
    }
}

struct ClientAdd_Previews: PreviewProvider {
    static var previews: some View {
        ClientAdd()
    }
}
