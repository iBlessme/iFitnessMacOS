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
                    .frame(width: 40)
                Divider()
                Text("\(users.surname) \(users.name_user) \(users.thirdname)")
                    .frame(width: 180)
                Divider()
                Text("Паспорт: \(users.passport_serial) \(users.passport_number) Снилс: \(users.snils)")
                    .frame(width: 130)
                Divider()
                Text("Номер телефона: \(users.phone_number)")
                    .frame(width: 100)
                Divider()
                Text("Логин и пароль: \(users.login) \(users.password)")
                    .frame(width: 180)
                
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
            UserClubAdd(isVisible: self.$showAdd)
        }
        .sheet(isPresented: $showAEdit){
            UserClubEdit(isVisible: self.$showAEdit)
        }
        .sheet(isPresented: $showDelete){
            UserClubDelete(isVisible: $showDelete)
        }
            
//            .padding()
       
        
        
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
