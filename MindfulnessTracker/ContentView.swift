import UIKit
import AVFoundation

class ContentViewController: UIViewController {
    
    // MARK: - Properties
    private var thoughtCount = 0
    private var audioPlayer: AVAudioPlayer?
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "妄念追蹤器"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "當妄（旺）念升起之時，讓一聲可愛狗狗『旺！』提醒您——此念非真，莫逐妄流，當下覺照，回歸本心。"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "今日妄念: 0"
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mindfulnessButton: UIButton = {
        let button = UIButton(type: .custom)
        
        // 設置狗狗圖片作為按鈕背景
        if let dogImage = UIImage(named: "Dog") {
            button.setBackgroundImage(dogImage, for: .normal)
            button.setBackgroundImage(dogImage.withAlpha(0.8), for: .highlighted)
        } else {
            // 如果找不到圖片，回退到原本的設計
            button.setTitle("🐕", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 80)
            button.backgroundColor = .systemRed
        }
        
        // 設置按鈕為圓形
        button.layer.cornerRadius = 100
        button.clipsToBounds = true
        
        // 添加陰影效果
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 8
        button.layer.masksToBounds = false
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "當妄念出現時，輕觸按鈕"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .systemGray2
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reminderLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .systemOrange
        label.textAlignment = .center
        label.numberOfLines = 0
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAudio()
        loadThoughtCount()
    }
    
    // MARK: - Setup Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Add subviews
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(countLabel)
        view.addSubview(mindfulnessButton)
        view.addSubview(messageLabel)
        view.addSubview(reminderLabel)
        
        // Setup button action
        mindfulnessButton.addTarget(self, action: #selector(mindfulnessButtonTapped), for: .touchUpInside)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Title label
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Description label
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Count label
            countLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Mindfulness button
            mindfulnessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mindfulnessButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            mindfulnessButton.widthAnchor.constraint(equalToConstant: 200),
            mindfulnessButton.heightAnchor.constraint(equalToConstant: 200),
            
            // Message label
            messageLabel.topAnchor.constraint(equalTo: mindfulnessButton.bottomAnchor, constant: 40),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Reminder label
            reminderLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 30),
            reminderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reminderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupAudio() {
        // Create a simple system sound for now
        // In a real app, you would include a woof.wav file in the bundle
    }
    
    // MARK: - Actions
    @objc private func mindfulnessButtonTapped() {
        // Increment thought count
        thoughtCount += 1
        saveThoughtCount()
        updateCountLabel()
        
        // Play sound (system sound for now)
        playWoofSound()
        
        // Show reminder message
        showReminderMessage()
        
        // Button animation
        animateButton()
        
        // Haptic feedback
        let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedback.impactOccurred()
    }
    
    // MARK: - Helper Methods
    private func updateCountLabel() {
        countLabel.text = "今日妄念: \(thoughtCount)"
    }
    
    private func playWoofSound() {
        // 使用真正的 woof.wav 檔案
        guard let path = Bundle.main.path(forResource: "woof", ofType: "wav") else {
            print("找不到 woof.wav 檔案，使用系統音效")
            AudioServicesPlaySystemSound(1016)  // 備用系統音效
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("播放音檔失敗: \(error)")
            AudioServicesPlaySystemSound(1016)  // 如果播放失敗，使用系統音效
        }
        
        // 震動回饋
        let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedback.impactOccurred()
    }
    
    private func showReminderMessage() {
        let messages = [
            "妄念現形！🧘",
            "回到當下！✨",
            "覺察妄念，回歸真實 🌟",
            "念頭來了又走，保持覺知 🌸",
            "活在當下，不被妄念帶走 🦋"
        ]
        
        let randomMessage = messages.randomElement() ?? "妄念現形！"
        reminderLabel.text = randomMessage
        
        // Animate the reminder message
        UIView.animate(withDuration: 0.3) {
            self.reminderLabel.alpha = 1.0
            self.reminderLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.reminderLabel.transform = CGAffineTransform.identity
            }
            
            // Hide message after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                UIView.animate(withDuration: 0.3) {
                    self.reminderLabel.alpha = 0
                }
            }
        }
    }
    
    private func animateButton() {
        UIView.animate(withDuration: 0.1) {
            self.mindfulnessButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.mindfulnessButton.transform = CGAffineTransform.identity
            }
        }
    }
    
    // MARK: - Data Persistence
    private func saveThoughtCount() {
        UserDefaults.standard.set(thoughtCount, forKey: "thoughtCount")
        
        // Save today's date to reset count daily
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: Date())
        UserDefaults.standard.set(today, forKey: "lastSavedDate")
    }
    
    private func loadThoughtCount() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: Date())
        let lastSavedDate = UserDefaults.standard.string(forKey: "lastSavedDate")
        
        // Reset count if it's a new day
        if lastSavedDate != today {
            thoughtCount = 0
        } else {
            thoughtCount = UserDefaults.standard.integer(forKey: "thoughtCount")
        }
        
        updateCountLabel()
    }
}

// MARK: - UIImage Extension
extension UIImage {
    func withAlpha(_ alpha: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
} 