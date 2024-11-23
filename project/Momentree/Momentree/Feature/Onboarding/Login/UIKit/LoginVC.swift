//
//  LoginVC.swift
//  Momentree
//
//  Created by 정성희 on 11/24/24.
//

import UIKit
//import Alamofire

class LoginVC: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var PWField: UITextField!
    @IBOutlet weak var IDField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    private var userToken:String = ""
    
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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (IDField.text?.count ?? 0 < 1) || (PWField.text?.count ?? 0 < 1) {
            updateLoginButtonState(isEnabled: false, backgroundColor: UIColor(red: 0.8627, green: 0.8627, blue: 0.8627, alpha: 1.0), borderColor: .clear)
            } else {
                updateLoginButtonState(isEnabled: true, backgroundColor: UIColor(hue: 0, saturation: 0.58, brightness: 0.9, alpha: 1.0), borderColor: .clear)
            }
    }
    
    func updateLoginButtonState(isEnabled: Bool, backgroundColor: UIColor, borderColor: UIColor) {
        loginBtn.isEnabled = isEnabled
        loginBtn.backgroundColor = backgroundColor
        loginBtn.layer.borderColor = borderColor.cgColor
    }
    
    @IBAction func IDTextField(_ sender: UITextField) {
        
    }
    
    @IBAction func PWTextField(_ sender: UITextField) {
    }
    
    public func apitest() {
        // Define the URL
        guard let url = URL(string: "http://ec2-184-73-145-160.compute-1.amazonaws.com:8080/follow-list") else {
            print("Invalid URL")
            return
        }

        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // ** Add token if required **
        let token = userToken // Replace with your actual token
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        
//        // Define the request body
//        let requestBody: [String: String] = [
//            "loginId": IDField.text!,  // Replace with actual loginId
//            "password": PWField.text! // Replace with actual password
//            
//        ]
//        // Convert the body to JSON data
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
//        } catch {
//            print("Failed to encode JSON")
//            return
//        }

        // Make the network request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")
            }
            
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Response data: \(responseString)")
                
                let parser = JSONParser()
                if let response = parser.parseLoginResponse(from: responseString) {
                    self.userToken = response.accessToken
                    print("Access Token: \(response.accessToken)")
                    print("User ID: \(response.userId)")
                } else {
                    print("Failed to parse login response.")
                }
            }
        }

        // Start the task
        task.resume()
    }
    
    @IBAction func tappedLoginBtn(_ sender: UIButton) {
        // Define the URL
        guard let url = URL(string: "http://ec2-184-73-145-160.compute-1.amazonaws.com:8080/sign-in") else {
            print("Invalid URL")
            return
        }

        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // ** Add token if required **
        let token = userToken // Replace with your actual token
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        
        // Define the request body
        let requestBody: [String: String] = [
            "loginId": IDField.text!,  // Replace with actual loginId
            "password": PWField.text! // Replace with actual password
            
        ]
        // Convert the body to JSON data
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        } catch {
            print("Failed to encode JSON")
            return
        }

        // Make the network request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")
            }
            
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Response data: \(responseString)")
                let parser = JSONParser()
                if let response = parser.parseLoginResponse(from: responseString) {
                    self.userToken = response.accessToken
                    print("Access Token: \(response.accessToken)")
                    print("User ID: \(response.userId)")
                    NotificationCenter.default.post(name: .login, object: nil)
                } else {
                    print("Failed to parse login response.")
                }
            }
        }

        // Start the task
        task.resume()
    }
    
    @IBAction func tappedRegisterBtn(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC else { return }

        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true, completion: nil)
    }
    
    struct LoginResponse: Codable {
        let accessToken: String
        let userId: Int
    }

    class JSONParser {
        func parseLoginResponse(from jsonString: String) -> LoginResponse? {
            // Convert the string to Data
            guard let jsonData = jsonString.data(using: .utf8) else {
                print("Failed to convert string to Data.")
                return nil
            }

            // Decode the JSON
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(LoginResponse.self, from: jsonData)
                return response
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
                return nil
            }
        }
    }
}
