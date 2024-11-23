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
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    private let weekdays = ["일", "월", "화", "수", "목", "금", "토"]
    
    var body: some View {
        VStack(spacing: 20) {
            // 요일 헤더
            HStack {
                ForEach(weekdays, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(day == "일" ? .red : day == "토" ? .blue : Color(hex: ColorSystem.treeText.rawValue))
                        
                }
            }
            
            // 캘린더 그리드
            LazyVGrid(columns: columns) {
                ForEach(cells) { cell in
                    CalendarCellView(cell: cell)
                        .onTapGesture {
                            if cell.id > 0 {
                                // 날짜가 있는 셀만 터치 이벤트 처리
                                handleCellTap(cell)
                            }
                        }
                    // 날짜가 있는 셀만 탭 가능하도록 설정
                        .allowsHitTesting(cell.id > 0)
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
        
        var body: some View {
            VStack {
                if cell.id > 0 {
                    Text("\(cell.id)")
                } else {
                    Text("")
                }
                
                Spacer()
            }
            .frame(height: 90)
        }
    }
    
    private func generate2024December() {
        // 35개의 셀 생성 (31일 + 빈 셀)
        for day in 1...35 {
            cells.append(CalendarCell(id: day <= 31 ? day : 0, hasContent: false))
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
