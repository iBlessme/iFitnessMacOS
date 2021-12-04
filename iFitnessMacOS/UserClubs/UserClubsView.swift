//
//  UserClubsView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import SwiftUI

struct UserClubsView: View {
    @State var usersClubModel = [UserClubs]()
    @State private var showAdd = false
    @State private var showAEdit = false
    @State private var showDelete = false
    var body: some View {
        List(usersClubModel, id: \.self){users in
            HStack{
            
                Text("id: \(users.id)")
                Divider()
                Text("\(users.surname) \(users.name_user) \(users.thirdname)")
                Divider()
                Text("Паспорт: \(users.passport_serial) \(users.passport_number) Снилс: \(users.snils)")
                Divider()
                Text("Номер телефона: \(users.phone_number)")
                Divider()
                Text("Логин и пароль: \(users.login) \(users.password)")
                
            }
            Divider()
        }
        .onAppear(){
            UserClubModel().fetch{users in
                self.usersClubModel = users
                }
            }
        
        .toolbar{
            Button(action: {showAdd.toggle()}){
                Text("✅ Добавить")
            }
            Button(action: {showAEdit.toggle()}){
                Text("✏ Изменить")
            }
            Button(action: {showDelete.toggle()}){
                Text("✖️ Удалить")
            }
        }
        .sheet(isPresented: $showAdd){
            UserClubAdd()
        }
        .sheet(isPresented: $showAEdit){
            UserClubEdit()
        }
        .sheet(isPresented: $showDelete){
            UserClubAdd()
        }
            
            .padding()
       
        
        
    }
}

func addUserClub(){
    
}
func deleteUserClub(){
    
}

struct UserClubsView_Previews: PreviewProvider {
    static var previews: some View {
        UserClubsView()
    }
}
