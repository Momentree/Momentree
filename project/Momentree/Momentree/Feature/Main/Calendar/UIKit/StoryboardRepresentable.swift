//
//  StoryboardRepresentable.swift
//  Momentree
//
//  Created by 정성희 on 11/23/24.
//

import SwiftUI

struct StoryboardRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        // Storyboard 로드
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Storyboard ID로 ViewController 생성
        let viewController = storyboard.instantiateViewController(withIdentifier: "CalendarViewController")
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // 필요 시 업데이트 로직 추가
    }
}
