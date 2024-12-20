//
//  APIHeroeViewModel.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 19-12-24.

//  addingPercentEncoding: convierte " " espacios a %20 en la URL.
//  NSCharacterSet.urlQueryAllowed: caracteres permitidos en los params de la URL, por ejemplo en un ?api_key=""
//  Ambos los dejé por seguridad / buenas prácticas
//  guard let: verifica que la URL sea válida y esté en un formato correcto
//  do: realiza una solicitud asíncrona a la API y decodifica la repuesta JSON en el listado
//  catch: maneja cualquier error que ocurra durante la solicitud o decodificación

import Foundation

@MainActor
class APIHeroeViewModel: ObservableObject {
    @Published var heroes: [APIHeroeList] = []
    @Published var heroeDetail: APIHeroeDetail?
    @Published var isLoadingHeroes: Bool = true
    @Published var isLoadingHeroDetail: Bool = true
    @Published var errorFetchingHeroes: String? = nil
    @Published var errorFetchingHeroDetail: String? = nil
    
    func fetchHeroes() async {
        let urlString = "https://heroes-api-two.vercel.app/es/marvel/heroes"
        
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "") else {
            errorFetchingHeroes = "URL inválida"
            isLoadingHeroes = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let res = try JSONDecoder().decode([APIHeroeList].self, from: data)
            self.heroes = res
        } catch {
            self.errorFetchingHeroes = "Error en la API: \(error.localizedDescription)"
        }
        
        self.isLoadingHeroes = false
    }
    
    
    
    func fetchHeroDetail(id: Int) async {
        let urlString = "https://heroes-api-two.vercel.app/es/marvel/heroes/\(id)"
        
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "") else {
            errorFetchingHeroDetail = "URL inválida"
            isLoadingHeroDetail = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let res = try JSONDecoder().decode(APIHeroeDetail.self, from: data)
            self.heroeDetail = res
        } catch {
            self.errorFetchingHeroDetail = "Error en la API: \(error.localizedDescription)"
        }
        
        self.isLoadingHeroDetail = false
    }
    
}

