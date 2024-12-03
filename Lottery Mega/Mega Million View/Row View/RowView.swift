//

import SwiftUI

struct RowView: View {
    
    var viewModel: RowViewModel
    
    var body: some View {
        VStack {
            if let winningNumbersDate = viewModel.formatDate() {
                Text(winningNumbersDate, style: .date)
                    .font(.title2)
                    .bold()
            }
            
            HStack {
                ForEach(viewModel.splitWinningNumbers().indices, id: \.self) { index in
                    Text(viewModel.splitWinningNumbers()[index])
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .padding()
                        .background(Circle().fill(Color.blue).shadow(radius: 1))
                }
            }
            
            Text("Mega Ball: \(viewModel.winningNumbers.mega_ball)")
            
            Text("Multiplier: \(viewModel.winningNumbers.multiplier)")
                .foregroundStyle(.secondary)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("For \(viewModel.formatDate() ?? Date()) Winning Numbers are \(viewModel.winningNumbers.winning_numbers) and the Megaball is: \(viewModel.winningNumbers.mega_ball), while the multiplier is \(viewModel.winningNumbers.multiplier)"))
    }
}

#Preview {
    RowView(viewModel: RowViewModel(winningNumbers: WinningNumbers(draw_date: "2024-11-26T00:00:00.000", winning_numbers: "05 22 24 39 42", mega_ball: "03", multiplier: "02")))
}
