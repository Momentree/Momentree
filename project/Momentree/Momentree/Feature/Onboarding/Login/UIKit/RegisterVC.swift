//
//  RegisterVC.swift
//  Momentree
//
//  Created by 정성희 on 11/24/24.
//

import UIKit

class RegisterVC: UIViewController, UITextFieldDelegate {

    let registerAPI = RegisterAPI()
    
    @IBOutlet weak var IDField: UITextField!
    @IBOutlet weak var PWField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        // Do any additional setup after loading the view.
    }
    
    func setDesign() {
        IDField.borderStyle = .roundedRect
        IDField.autocorrectionType = .no                     // 자동 수정 활성화 여부
        IDField.spellCheckingType = .no                      // 맞춤법 검사 활성화 여부
        IDField.autocapitalizationType = .none               // 자동 대문자 활성화 여부

        IDField.placeholder = "아이디 입력"                     // 플레이스 홀더
        IDField.clearButtonMode = .always                    // 입력내용 한번에 지우는 x버튼(오른쪽)
        IDField.clearsOnBeginEditing = false                 // 편집 시 기존 텍스트필드값 제거?
        IDField.returnKeyType = .done
        IDField.delegate = self
        
        
        PWField.borderStyle = .roundedRect
        PWField.autocorrectionType = .no                     // 자동 수정 활성화 여부
        PWField.spellCheckingType = .no                      // 맞춤법 검사 활성화 여부
        PWField.autocapitalizationType = .none               // 자동 대문자 활성화 여부

        PWField.placeholder = "비밀번호 입력"                     // 플레이스 홀더
        PWField.clearButtonMode = .always                    // 입력내용 한번에 지우는 x버튼(오른쪽)
        PWField.clearsOnBeginEditing = false                 // 편집 시 기존 텍스트필드값 제거?
        PWField.returnKeyType = .done
        PWField.delegate = self
        PWField.isSecureTextEntry = true
    }
    
    @IBAction func tappedRegisterBtn(_ sender: UIButton) {
        registerAPI.signUpUser(loginId: IDField.text!, password: PWField.text!)
    }
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
