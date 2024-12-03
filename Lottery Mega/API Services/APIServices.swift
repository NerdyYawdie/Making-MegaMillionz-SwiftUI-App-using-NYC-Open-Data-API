//

import Foundation

protocol APIServices {
    func fetchWinningNumbers() async throws -> [WinningNumbers]
}

enum APIServicesError: Error {
    case invalidURL
    case invalidResponse
    case custom(String)
}

class APIServicesImpl: APIServices {
    
    private let endpoint: String = "https://data.ny.gov/resource/5xaw-6ayf.json"
    
    func fetchWinningNumbers() async throws -> [WinningNumbers] {
        
        guard let url = URL(string: endpoint) else {
            throw APIServicesError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode) else {
                throw APIServicesError.invalidResponse
            }
            
            let winningNumbers = try JSONDecoder().decode([WinningNumbers].self, from: data)
            return winningNumbers
        } catch {
            throw APIServicesError.custom(error.localizedDescription)
        }
    }
    
}
