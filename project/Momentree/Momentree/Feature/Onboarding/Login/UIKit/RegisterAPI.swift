//
//  RegisterAPI.swift
//  Momentree
//
//  Created by 정성희 on 11/24/24.
//

import Foundation

class RegisterAPI {
    func signUpUser(loginId: String, password: String) {
        // Define the URL
        guard let url = URL(string: "http://ec2-184-73-145-160.compute-1.amazonaws.com:8080/sign-up") else {
            print("Invalid URL")
            return
        }

        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Define the request body
        let requestBody: [String: String] = [
            "loginId": loginId,
            "password": password
        ]

        // Convert the body to JSON data
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        } catch {
            print("Failed to encode JSON: \(error.localizedDescription)")
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
}
