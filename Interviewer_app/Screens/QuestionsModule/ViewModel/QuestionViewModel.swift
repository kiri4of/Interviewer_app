
import UIKit

class QuestionViewModel {
    private(set) var sections: [Section]
    
    init(sections: [Section]) {
        self.sections = sections
    }
    
    func highlightButton(selectedButton: inout CustomButton?, sender: CustomButton) {
        if let previousButton = selectedButton {
            previousButton.backgroundColor = AppColor.itemPrimaryBgColor
            previousButton.layer.borderColor = UIColor.clear.cgColor
            previousButton.layer.borderWidth = 1
        }
        
        sender.backgroundColor = AppColor.itemPrimaryBgColor.withAlphaComponent(0.7)
        sender.layer.borderColor = UIColor.white.cgColor
        sender.layer.borderWidth = 1
        
        selectedButton = sender
        
        let soundManager = SoundManager.shared
        soundManager.playSound(named: AppSounds.click.rawValue)
    }
    
    //MARK: - Items in StackView setup
    func getFormattedSections(containerWidth: CGFloat, minimumItemWidth: CGFloat, maximumItemWidth: CGFloat, spacing: CGFloat = 8) -> [(title: String, rows: [[String]])] {
        return sections.map { section in
            let rows = splitIntoRows(
                items: section.items,
                minimumItemWidth: minimumItemWidth,
                maximumItemWidth: maximumItemWidth,
                containerWidth: containerWidth,
                spacing: spacing
            )
            return (title: section.title, rows: rows)
        }
    }
    
    private func splitIntoRows(items: [String], minimumItemWidth: CGFloat, maximumItemWidth: CGFloat, containerWidth: CGFloat, spacing: CGFloat = 8) -> [[String]] {
        var rows: [[String]] = []
        var currentRow: [String] = []
        var currentRowWidth: CGFloat = 0
        
        for item in items {
            // Рассчитываем ширину элемента с учётом минимальной и максимальной ширины
            let itemWidth = min(max(calculateWidth(for: item) + 16, minimumItemWidth), maximumItemWidth)
            
            // Проверяем, поместится ли элемент в текущую строку
            if currentRowWidth + itemWidth + (currentRow.isEmpty ? 0 : spacing) > containerWidth {
                // Если не помещается, создаём новую строку
                rows.append(currentRow)
                currentRow = [item]
                currentRowWidth = itemWidth
            } else {
                // Если помещается, добавляем в текущую строку
                currentRow.append(item)
                currentRowWidth += itemWidth + (currentRow.isEmpty ? 0 : spacing)
            }
        }
        // Добавляем последнюю строку, если остались элементы
        if !currentRow.isEmpty {
            rows.append(currentRow)
        }
        
        return rows
    }
    
    private func calculateWidth(for item: String) -> CGFloat {
        let font = AppFonts.inter12Regular
        let attributes = [NSAttributedString.Key.font: font]
        let textSize = (item as NSString).size(withAttributes: attributes)
        return textSize.width
    }
    
}


