//
//  CalendarView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct CalendarView: View {
    @State var store : StoreOf<CalendarFeature>
    @State private var cells: [CalendarCell] = []
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 7)
    private let weekdays = ["일", "월", "화", "수", "목", "금", "토"]
    
    var body: some View {
        VStack {
            // 요일 헤더
            HStack(alignment: .bottom, spacing: 8) {
                Text("12월")
                    .fontModifier(fontSize: 32, weight: .bold, color: ColorSystem.red2.rawValue)
                Text("DECEMBER")
                    .fontModifier(fontSize: 18, weight: .bold, color: ColorSystem.red2.rawValue)
                Spacer()
            }
            Spacer()
                .frame(height: 44)
            HStack(spacing: 0) {
                ForEach(weekdays, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .frame(height: 32)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(day == "일" ? .red : day == "토" ? .blue : Color(hex: ColorSystem.treeText.rawValue))
                }
            }
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(cells) { cell in
                    CalendarCellView(
                        cell: cell,
                        buttonHandler: { id in
                            // TODO: 연결
                            store.send(.viewTransition(.sendDayToDiary(id)))
                        })
                }
            }
        }
        .padding()
        .onAppear {
            generate2024December()
        }
    }
    
    struct CalendarCellView: View {
        let cell: CalendarCell
        let buttonHandler: (Int) -> Void
        
        var body: some View {
            Button {
                buttonHandler(cell.id)
            } label: {
                VStack {
                    Rectangle()
                        .fill(Color(hex: ColorSystem.border.rawValue))
                        .frame(height: 1)
                    
                    Text(0...31 ~= cell.id ? "\(cell.id)" : "")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(
                            cell.id % 7 == 1 ?
                                .red :
                                (cell.id % 7 == 0 ? .blue : Color(hex: ColorSystem.treeText.rawValue))
                        )
                    
                    Spacer()
                }
                .frame(height: 90)
            }
            .disabled((0...31 ~= cell.id) == false)
        }
    }
    
    private func generate2024December() {
        // 35개의 셀 생성 (31일 + 빈 셀)
        for day in 1...35 {
            cells.append(CalendarCell(id: day, hasContent: false))
        }
    }
    
    private func handleCellTap(_ cell: CalendarCell) {
        // 여기에 셀 탭했을 때의 동작 추가
        print("Tapped cell: \(cell.id)")
    }
}

#Preview {
    CalendarView(store: .init(initialState: .init(), reducer: {
        CalendarFeature()
    }))
}

struct CalendarCell: Identifiable {
    let id: Int
    var hasContent: Bool
    
    init(id: Int, hasContent: Bool = false) {
        self.id = id
        self.hasContent = hasContent
    }
}
