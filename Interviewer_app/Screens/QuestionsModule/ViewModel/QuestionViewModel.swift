
import UIKit

class QuestionViewModel {
    func splitIntoRows(items: [String], itemsPerRow: Int) -> [[String]] {
            var rows: [[String]] = []
            var currentRow: [String] = []
            
            for (index, item) in items.enumerated() {
                currentRow.append(item)
                if currentRow.count == itemsPerRow || index == items.count - 1 {
                    rows.append(currentRow)
                    currentRow = []
                }
            }
            return rows
        }
}
