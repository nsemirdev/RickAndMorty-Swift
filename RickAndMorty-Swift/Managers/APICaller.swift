//
//  APICaller.swift
//  RickAndMorty-Swift
//
//  Created by Emir Alkal on 26.12.2022.
//

import UIKit

struct API {
    static let base_url = "https://rickandmortyapi.com/api/"
    
    struct Endpoints {
        static let character = "character"
    }
}


class APICaller {
    private init() {}
    static let shared = APICaller()
    static var next: String?
    
    func getCharacters(completion: @escaping (CharacterCollection?) -> Void) {
        let urlString: String
        
        if let next = APICaller.next {
            urlString = next
        } else {
            urlString = API.base_url + API.Endpoints.character
        }
        
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                completion(nil)
            }
    
            guard let data else { return }
            
            do {
                let result = try JSONDecoder().decode(CharacterCollection.self, from: data)
                if let next = result.info.next {
                    APICaller.next = next
                }
                completion(result)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }   
}
