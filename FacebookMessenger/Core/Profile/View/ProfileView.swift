//
//  ProfileView.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/2/23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var vm = ProfileViewModel()
    let user: User
    
    var body: some View {
        VStack {
            // header
            VStack {
                PhotosPicker(selection: $vm.selectedItem) {
                    if let profileImage = vm.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    } else {
                        CircularProfileImageView(user: user, size: .xLarge)
                    }
                }
                Text(user.fullName)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            // list
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            Text(option.title)
                        }
                    }
                }
                
                Section {
                    Button("Log Out") {
                        AuthService.shared.signOut()
                    }
                    
                    Button("Delete Account") {
                        
                    }
                }
                .foregroundColor(.red)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: .MOCK_USER)
    }
}
