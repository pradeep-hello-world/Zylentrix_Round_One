# API Integration Application

## Getting Started

This project is a created to represent the skill of API Integration in Flutter Application in ListView.

## Project Structure

| -- Output 
|    | -- Application for Easy View
| -- Lib
|    | -- main.dart           # Entry Point of the Application
|    | -- Post_model.dart     # Contain a class to extract data from Api
│ -- pubspec.yaml             # Dependencies file
│ -- README.md                # Project documentation

## Installation & Setup

1. Initially Clone the Repository.
2. Install Dependencies using Teriminal with the following command:
   | -- flutter pub get
3. Connect either the Emulator or Developer Option Enabled Device and Run the "main.dart" file or use the following command:
   |  -- flutter run

## API Integration

This app fetches posts from the JSONPlaceholder API.

## API Endpoint:
url -- https://jsonplaceholder.typicode.com/posts

## Response Example
```[
  {
    "userId": 1,
    "id": 1,
    "title": "Sample Title",
    "body": "This is a sample post body."
  }
]
