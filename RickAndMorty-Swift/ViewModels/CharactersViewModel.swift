//
//  CharactersViewModel.swift
//  RickAndMorty-Swift
//
//  Created by Emir Alkal on 26.12.2022.
//

import Foundation


protocol CharactersViewModelDelegate {
    func fetchDidSuccess(_ vm: CharactersViewModel, fetchResultWithCharacters: CharacterCollection)
    func fetchFailWithError(_ vm: CharactersViewModel, errorMessage: String)
}

class CharactersViewModel {
    
    var delegate: CharactersViewModelDelegate?
    

    
    func fetchCharactersRequest() {
        APICaller.shared.getCharacters { characterCollection in
            if let characterCollection {
                DispatchQueue.main.async {
                    self.delegate?.fetchDidSuccess(self, fetchResultWithCharacters: characterCollection)
                }
            } else {
                DispatchQueue.main.async {
                    self.delegate?.fetchFailWithError(self, errorMessage: "something happened")
                }
            }
        }
    }
}
