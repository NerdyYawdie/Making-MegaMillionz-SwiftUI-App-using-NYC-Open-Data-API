//

import SwiftUI

struct MegaMillionView: View {
    
    @StateObject var viewModel = MegaMillionViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.winningNumbers) { winningNumbers in
                    RowView(viewModel: RowViewModel(winningNumbers: winningNumbers))
                }
                .listStyle(.plain)
            }
            .navigationTitle(Text("MM Lottery"))
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchWinningNumbers()
            }
            .refreshable {
                await viewModel.fetchWinningNumbers()
            }
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text(viewModel.errorMessage))
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView(LocalizedStringKey("Fetching Winning Numbers...🤑"))
                }
            }
        }
    }
}

#Preview {
    MegaMillionView()
}
