import Foundation
import CryptoKit

class Network {
    static let shared = Network()
    private init() {
    }
    
    func fetchcharacters() async throws -> [Characters] {
        let privateKey = "9cbdc624d704f14a24c1f98f690c41700c300a95"
        let publicKey = "b8f4e830bb180f953e570a104ef2d1c3"
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
        
        let endpoint = "http://gateway.marvel.com/v1/public/characters?ts=\(ts)&apiKey=\(publicKey)"
        
        guard let url = URL(string: endpoint) else {throw NetworkError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw NetworkError.invalidResponse}
        
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(Wrapper.self, from: data)
            return result.data.results
        } catch {
            throw NetworkError.decodingError
          }
        }
    
    func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8)!)
        return hash.map {
            String(format: "%02hhx", $0)}.joined()
        }
    }


