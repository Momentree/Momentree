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

        IDField.placeholder = "이메일 입력"                     // 플레이스 홀더
        IDField.clearButtonMode = .always                    // 입력내용 한번에 지우는 x버튼(오른쪽)
        IDField.clearsOnBeginEditing = false                 // 편집 시 기존 텍스트필드값 제거?
        IDField.returnKeyType = .done
        IDField.delegate = self
        
        
        PWField.borderStyle = .roundedRect
        PWField.autocorrectionType = .no                     // 자동 수정 활성화 여부
        PWField.spellCheckingType = .no                      // 맞춤법 검사 활성화 여부
        PWField.autocapitalizationType = .none               // 자동 대문자 활성화 여부

        PWField.placeholder = "이메일 입력"                     // 플레이스 홀더
        PWField.clearButtonMode = .always                    // 입력내용 한번에 지우는 x버튼(오른쪽)
        PWField.clearsOnBeginEditing = false                 // 편집 시 기존 텍스트필드값 제거?
        PWField.returnKeyType = .done
        PWField.delegate = self
    }
    
    @IBAction func IDTextField(_ sender: UITextField) {
        
    }
    
    @IBAction func PWTextField(_ sender: UITextField) {
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
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI2IiwiaWF0IjoxNzMyMzk0ODkzLCJleHAiOjE3MzIzOTg0OTN9.pZWFIHTKLIjFPsFsNFZhYQDPhq7aIOFDJOmgohcUgWo" // Replace with your actual token
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        
        // Define the request body
        let requestBody: [String: String] = [
            "loginId": IDField.text!,  // Replace with actual loginId
            "password": PWField.text! // Replace with actual password
            
        ]
        dump(requestBody)
        // Convert the body to JSON data
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            dump(request.httpBody)
            dump(request)
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
            }
        }

        // Start the task
        task.resume()
    }
    
//    func login() {
//        let url = "http://ec2-184-73-145-160.compute-1.amazonaws.com:8080/sign-in"
//
//        let parameters: [String: String] = [
//                    "loginId": "admin",
//                    "password": "admin"
//                ]
//        
//        // Make the POST request using Alamofire
//                AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
//                    .validate() // 자동으로 HTTP 상태 코드를 확인
//                    .responseJSON { [weak self] response in
//                        switch response.result {
//                        case .success(let value):
//                            // JSON 데이터 처리
//                            if let json = value as? [String: Any],
//                               let token = json["token"] as? String { // 서버가 "token" 키로 반환한다고 가정
//                                self?.token = token
//                                print("Login successful. Token: \(token)")
//                                completion(.success(token))
//                            } else {
//                                print("Token not found in response.")
//                                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Token not found"])))
//                            }
//                        case .failure(let error):
//                            print("Login request failed with error: \(error.localizedDescription)")
//                            completion(.failure(error))
//                        }
//                    }
//    }
    
    @IBAction func tappedRegisterBtn(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC else { return }

        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

