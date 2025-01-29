# RecipeApp

### Summary: Include screenshots or a video of your app highlighting its features
| Home | Detail | Empty | Failure |
|-|-|-|-|
| ![Simulator Screenshot - iPhone 16 Pro - 2025-01-29 at 09 50 43](https://github.com/user-attachments/assets/28943807-5447-4710-866e-1d6e7c7accbb) | ![Simulator Screenshot - iPhone 16 Pro - 2025-01-29 at 09 58 19](https://github.com/user-attachments/assets/272a3dec-2ae2-4eb6-b67a-0b2b6ed3b85a) | ![Simulator Screenshot - iPhone 16 Pro - 2025-01-29 at 09 51 05](https://github.com/user-attachments/assets/64526a67-143f-4815-8655-4eedfb808b95) | ![Simulator Screenshot - iPhone 16 Pro - 2025-01-29 at 09 51 15](https://github.com/user-attachments/assets/f4a8fc04-95a0-4952-8b7e-c1c7b63e776d) |
| Home | Detail | Empty | Failure |
| ![Simulator Screenshot - iPhone 16 Pro - 2025-01-29 at 09 50 51](https://github.com/user-attachments/assets/d24ca982-316f-4f8a-86d7-99de5c44f06b) | ![Simulator Screenshot - iPhone 16 Pro - 2025-01-29 at 09 58 15](https://github.com/user-attachments/assets/7907dad6-7f9f-4124-985f-8b4c1498f962) | ![Simulator Screenshot - iPhone 16 Pro - 2025-01-29 at 09 51 07](https://github.com/user-attachments/assets/18389203-8b9e-4bf6-912d-55e768bf1212) | ![Simulator Screenshot - iPhone 16 Pro - 2025-01-29 at 09 51 17](https://github.com/user-attachments/assets/46dfe039-007a-4fd0-b7b6-97cd0b6e0d52) |


### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
- Focused on optimizing the user experience by ensuring an intuitive, smooth, and functional interface.
- Designed a scalable architecture using MVVM, integrating a router and coordinator to improve navigation management and separation of concerns.
- Leveraged Swift Concurrency (async/await) to efficiently handle background operations, ensuring a seamless and responsive UI.
- Optimized web content and video loading using WebKit, utilizing its native capabilities for enhanced efficiency and performance.
- Implemented image caching to minimize unnecessary network requests, reducing load times and improving the overall user experience.
- Developed a robust view state management system, ensuring efficient handling of different loading, success, and error states.
- Adopted the new Swift Testing framework to implement more efficient testing strategies, improving code quality and stability.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
- I allocated one day to the project, focusing on implementing essential changes without over-optimizing prematurely.
- I prioritized architectural robustness over premature fine-tuning, ensuring a scalable and maintainable foundation for future development.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
- I focused on performance and stability, ensuring the app avoided memory leaks and delivered a smoother user experience.
- I prioritized native Swift functionalities to avoid unnecessary dependencies, keeping the codebase lightweight, efficient, and easy to maintain.

### Weakest Part of the Project: What do you think is the weakest part of your project?
- The weakest part of the project was the use of WKWebView to display videos within the app. Since iOS 16, Apple has not fully optimized this component, which can lead to performance or compatibility issues in certain cases. However, I conducted thorough research and identified solutions to mitigate these issues, ensuring a more stable user experience.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
- I did not encounter any significant constraints during development. However, an improvement could have been implementing multiple HTTP Methods in the API for greater flexibility. Additionally, centralizing search filtering directly on the API rather than handling it on the client side would have optimized performance and reduced the application's workload.
