//
//  InboxView.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 6/30/23.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessegeView = false
    @StateObject var vm = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User? {
        vm.currentUser
    }
    
    var body: some View {
        NavigationStack {
            List {
                ActiveNowView()
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                    
                ForEach(vm.recentMessages) { message in
                    ZStack {
                        NavigationLink(value: message) {
                            EmptyView()
                        }.opacity(0.0)
                        InboxRowView(message: message)
                    }
                }
            }
            .listStyle(.plain)
            .onChange(of: selectedUser, perform: { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user {
                    ChatView(user: user)
                }
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showNewMessegeView) {
                NewMessageView(selectedUser: $selectedUser)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        NavigationLink(value: user) {
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewMessegeView.toggle()
                        selectedUser = nil
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
