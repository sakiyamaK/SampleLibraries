//
//  GithubAPI.swift
//  SampleRxSwift
//
//  Created by sakiyamaK on 2020/05/23.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation
import Alamofire

final class GithubAPI {
    static let shared = GithubAPI()

    private init() {}

    func get(searchWord: String, isDesc: Bool = true, success: (([GithubModel]) -> Void)? = nil, error: ((Error) -> Void)? = nil) {
        guard searchWord.count > 0 else {
            success?([])
            return
        }

        AF.request("https://api.github.com/search/repositories?q=\(searchWord)&sort=stars&order=\(isDesc ? "desc" : "asc")")
            .response { (response) in
                switch response.result {
                case .success:
                    guard
                        let data = response.data,
                        let githubResponse = try? JSONDecoder().decode(GithubResponse.self, from: data),
                        let models = githubResponse.items
                    else
                    {
                        success?([])
                        return
                    }
                    success?(models)
                case .failure(let err):
                    error?(err)
                }
            }
    }

    func get2(searchWord: String, isDesc: Bool = true, success: (([GithubModel]) -> Void)? = nil, error: ((Error) -> Void)? = nil) {
        guard searchWord.count > 0 else {
            success?([])
            return
        }
        let url = URL(string: "https://api.github.com/search/repositories?q=\(searchWord)&sort=stars&order=\(isDesc ? "desc" : "asc")")!
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: { response, _, _ in
            guard
                let data = response,
                let githubResponse = try? JSONDecoder().decode(GithubResponse.self, from: data),
                let models = githubResponse.items
            else
            {
                success?([])
                return
            }
            success?(models)
        })
        task.resume()
    }
}
