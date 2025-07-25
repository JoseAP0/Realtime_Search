# Realtime Search

## Description
Realtime Search is a Rails project that implements a real-time input search feature with search suggestions based on prior searches made by the user. This project leverages the ultimate features of Rails to enhance user experience by providing immediate feedback and options as they type.

## Installation Instructions
To set up the project locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd realtime_search
   ```

2. Install the required gems:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the Rails server:
   ```bash
   rails server
   ```

5. Open your browser and navigate to `http://localhost:3000` to see the application in action.

## Usage
This project can be used to implement a real-time search box using Rails' ultimate features.

- Start typing in the search input field to search for articles.
- Get suggestions in real time based on previous search queries.
- The suggestions are completely separated by user.

## Features
- Real-time search input.
- Suggestions based on prior user searches.
- Responsive design using TailwindCSS.

## Technologies Used
- Ruby on Rails
- Stimulus
- Turbo Frames
- TailwindCSS

## Contributing
Contributions are welcome! Please follow these steps to contribute:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Create a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.