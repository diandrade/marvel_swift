import SwiftUI

class viewModel: ObservableObject {
    @Published var characters: [Characters]
    
    func loadCharacters(){
        Task {
            do {
                characters = try await Network.shared.fetchcharacters()
            } catch {
                print("Erro: \(error)")
            }
        }
    }
}

1NN0V4T10N
1NN0V4T10N

