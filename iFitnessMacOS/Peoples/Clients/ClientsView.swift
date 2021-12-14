//
//  ClientsView.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import SwiftUI

struct ClientsView: View {
    @State var clients = [Client]()
    @State private var showAdd = false
    @State private var showAEdit = false
    @State private var showDelete = false
    var body: some View {
        List(clients, id: \.self){client in
            HStack{
                Text("id: \(client.id)")
                    .frame(width: 40)
                Divider()
                Text("\(client.user_club.surname) \(client.user_club.name_user)")
                    .frame(width: 150)
                Divider()
                Text("Логин: \(client.user_club.login)")
                    .frame(width: 180)
                Divider()
                Text("Абонемент: \(client.abonement.name_abonement)")
                    
            }
            Divider()
        }
        .onAppear(){
            ClientModel().fetch{client in
                self.clients = client
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
            ClientAdd(isVisible: self.$showAdd)
        }
        .sheet(isPresented: $showAEdit){
            ClientEdit(isVisible: self.$showAEdit)
        }
        .sheet(isPresented: $showDelete){
            ClientDelete(isVisible: self.$showDelete)
        }
            
            
        
    }
}

struct ClientsView_Previews: PreviewProvider {
    static var previews: some View {
        ClientsView()
    }
}
