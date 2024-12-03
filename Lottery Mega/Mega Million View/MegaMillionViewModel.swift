//

import Foundation

class MegaMillionViewModel: ObservableObject {
    
    @Published var winningNumbers: [WinningNumbers] = []
    
    @Published var isLoading: Bool = false
    
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    let services: APIServices
    
    init(services: APIServices = APIServicesImpl()) {
        self.services = services
    }
    
    @MainActor
    func fetchWinningNumbers() async {
        
        do {
            isLoading = true
            winningNumbers = try await services.fetchWinningNumbers()
            
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
            showErrorAlert.toggle()
        }
    }
    
}
