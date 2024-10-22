import SwiftUI
import Combine

// Classe responsável por gerenciar as notificações do teclado
class KeyboardManager: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .merge(with: NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
            .sink { [weak self] notification in
                if notification.name == UIResponder.keyboardWillShowNotification {
                    if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                        self?.keyboardHeight = keyboardFrame.height
                    }
                } else {
                    self?.keyboardHeight = 0
                }
            }
            .store(in: &cancellableSet)
    }
}

struct KeyboardResponsive: ViewModifier {
    @StateObject private var keyboardManager = KeyboardManager()
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardManager.keyboardHeight)
    }
}

extension View {
    func keyboardResponsive() -> some View {
        self.modifier(KeyboardResponsive())
    }
}
