import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak private var countLabel: UILabel!
    @IBOutlet weak private var incrementButton: UIButton!
    @IBOutlet weak private var decrementButton: UIButton!
    @IBOutlet weak private var clearButton: UIButton!
    @IBOutlet weak private var historyTextView: UITextView!
    private var count: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.isEditable = false
        historyTextView.text = "История изменений:"
        incrementButton.backgroundColor = .red
        decrementButton.backgroundColor = .blue
        updateCountLabel()
    }

    @IBAction private func increment(_ sender: Any) {
        count += 1
        updateCountLabel()
        addHistory(action: "значение изменено на +1")
    }
    @IBAction private func decrement(_ sender: Any) {
        if count > 0 {
            count -= 1
            updateCountLabel()
            addHistory(action: "значение изменено на -1")
        }else{
            addHistory(action: "попытка уменьшить значение счётчика ниже 0")
        }
        
    }
    @IBAction private func clear(_ sender: Any) {
        count = 0
        updateCountLabel()
        addHistory(action: "значение сброшено")
    }
    
    private func updateCountLabel () {
        countLabel.text = "Значение счетчика: \(count)"
    }
    
    private func addHistory (action: String) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        
        historyTextView.text += "\n[\(dateString)]: " + action
    }
}

