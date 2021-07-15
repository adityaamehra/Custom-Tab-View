//
//  CustomTabBarButton.swift
//  Custom Tab View
//
//  Created by Adityaa Mehra on 15/07/21.
//

import SwiftUI

struct CustomTabBarButton: View {
    @Binding var selectedTab:Tab
    var tab:TabInfo
    var body: some View {
        VStack(spacing: 5){
            Rectangle().frame(height: 3).cornerRadius(2).foregroundColor(.blue).opacity(tab.view == selectedTab ? 1 : 0).padding(.bottom)
            Image(systemName: tab.icon).frame(height: 20)
            Text(tab.name).font(.caption)
        }.padding(.vertical).frame(height: 80).foregroundColor(tab.view == selectedTab ? .blue : .gray).onTapGesture {
            // Set the selected tab
            self.selectedTab = tab.view
        }
    }
}
