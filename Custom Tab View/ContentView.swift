//
//  ContentView.swift
//  Custom Tab View
//
//  Created by Adityaa Mehra on 15/07/21.
//

import SwiftUI

enum Tab {
    case Home
    case Feed
    case Add
    case Account
    case Settings
}
struct TabInfo:Identifiable {
    var id = UUID()
    var view:Tab
    var icon:String
    var name:String
}
struct ContentView: View {
    @State var selectedTab = Tab.Home
    @State var tabs = [TabInfo]()
    var a = 0
    var body: some View {
        
        GeometryReader { geo in
            VStack{
                // Switch the view according to the currently selected tab
                switch(selectedTab){
                case Tab.Home:
                    // Show home
                    Text("Home")
                case Tab.Feed:
                    // Show feed
                    Text("Feed")
                case Tab.Add:
                    // hello
                    Text("Add")
                case Tab.Account:
                    //bye
                    Text("Acount")
                case Tab.Settings:
                    // meet you soon
                    Text("Settings")
                }
                Spacer()
                
                VStack {
                    Path({ path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                    }).stroke(Color.gray)
                    HStack(spacing: 0){
                        Spacer()
                        ForEach(tabs){ tab in
                            CustomTabBarButton(selectedTab: $selectedTab, tab: tab).frame(width: (geo.size.width - 40) / 5)
                            Spacer()
                        }
                    }
                }.frame(height: 90)
            }
        }.onAppear(perform: {
            // Create tabs
            var newTabs = [TabInfo]()
            newTabs.append(TabInfo(view: Tab.Home, icon: "person", name: "home"))
            newTabs.append(TabInfo(view: Tab.Feed, icon: "person.2", name: "feed"))
            newTabs.append(TabInfo(view: Tab.Add, icon: "person.3", name: "add"))
            newTabs.append(TabInfo(view: Tab.Account, icon: "person.fill", name: "account"))
            newTabs.append(TabInfo(view: Tab.Settings, icon: "person.2.fill", name: "settings"))
            self.tabs = newTabs
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
