//
//  InboxRowView.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 6/30/23.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundColor(.secondary)
            VStack(alignment: .leading, spacing: 4) {
                Text("Sasha Pavlov")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("Some test message for now")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    //.frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.secondary)
        }
        .frame(height: 72)
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
