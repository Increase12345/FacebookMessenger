//
//  ContentView.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        Group {
            if vm.userSession != nil {
                InboxView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
