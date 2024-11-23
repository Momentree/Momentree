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
                            Text("달력")
                        }
                        .tag(MainCoordinator.Tab.calendar)
                    
                    TreeCoordinatorView(store: store.scope(state: \.tree, action: \.tree))
                        .tabItem {
                            Text("크리스마스 트리")
                        }
                        .tag(MainCoordinator.Tab.tree)
                    
                    AroundCoordinatorView(store: store.scope(state: \.around, action: \.around))
                        .tabItem {
                            Text("둘러보기")
                        }
                        .tag(MainCoordinator.Tab.around)
                }
                .zIndex(0)
            }
            .onAppear {

            }
        }
    }
}
