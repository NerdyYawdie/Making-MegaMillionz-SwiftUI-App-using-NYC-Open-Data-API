//

import Foundation

class RowViewModel {
    
    let winningNumbers: WinningNumbers
    
    let dateFormatter = DateFormatter()
    
    init(winningNumbers: WinningNumbers) {
        self.winningNumbers = winningNumbers
    }
    
    func formatDate() -> Date? {
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.sss"
        let formattedDate = dateFormatter.date(from: winningNumbers.draw_date)
        return formattedDate
    }
    
    func splitWinningNumbers() -> [String] {
        var numbers = winningNumbers.winning_numbers.components(separatedBy: " ")
        return numbers
    }
}
