import UIKit

class UserProfile {
    var name: String
    var isCourier: Bool
    var city: String
    
    init(name: String, isCourier: Bool, city: String) {
        self.name = name
        self.isCourier = isCourier
        self.city = city
    }
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var courierSwitch: UISwitch!
    @IBOutlet weak var cityPickerView: UIPickerView!
    
    let cities = ["Київ", "Львів", "Одеса", "Харків", "Дніпро", "Івано-Франківськ"]
    
    private var selectedCity: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        
        selectedCity = cities.first ?? ""
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = cities[row]
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let isCourier = courierSwitch.isOn
        
        let profile = UserProfile(name: name, isCourier: isCourier, city: selectedCity)
        

        print("📋 ДАНІ АНКЕТИ КОРИСТУВАЧА:")
        print("👤 Ім'я: \(profile.name.isEmpty ? "Не вказано" : profile.name)")
        print("🚴 Статус кур'єра: \(profile.isCourier ? "Так" : "Ні")")
        print("🏙 Місто: \(profile.city)")
    }
}
