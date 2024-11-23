//
//  MainCoordinatorView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct MainCoordinatorView : View {
    @State var store : StoreOf<MainCoordinator>
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                TabView(selection: $store.selectedTab.sending(\.tabSelected)) {
                    CalendarCoordinatorView(store: store.scope(state: \.calendar, action: \.calendar))
                        .tabItem {
                            Image(store.selectedTab == .calendar ? .calendarOn : .calendarOff)
                            Text("달력")
                                .tabItemFont()
                        }
                        .tag(MainCoordinator.Tab.calendar)
                        .ignoresSafeArea()
                    
                    TreeCoordinatorView(store: store.scope(state: \.tree, action: \.tree))
                        .tabItem {
                            Image(store.selectedTab == .tree ? .treeOn : .treeOff)
                            Text("트리")
                                .tabItemFont()
                        }
                        .tag(MainCoordinator.Tab.tree)
                    
                    AroundCoordinatorView(store: store.scope(state: \.around, action: \.around))
                        .tabItem {
                            Image(store.selectedTab == .around ? .followOn : .followOff)
                            Text("팔로잉 목록")
                                .tabItemFont()
                        }
                        .tag(MainCoordinator.Tab.around)
                }
                .zIndex(0)
            }
            .onAppear {
                print("MainCoordinator appear")
            }
            .accentColor(Color(hex: ColorSystem.red.rawValue))
        }
    }
}
