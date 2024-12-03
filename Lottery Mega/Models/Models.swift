//

import Foundation

struct WinningNumbers: Decodable, Identifiable {
    let id = UUID()
    let draw_date: String
    let winning_numbers: String
    let mega_ball: String
    let multiplier: String
    
    
}
