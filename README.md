# MyAppointmens

## This project is challenge test based on [challenge](https://github.com/mvitor-87/rails-clan-challenge/)

## Setup
1. Clone the repository
   ```bash
   git clone https://github.com/victormoreira92/MyAppointments.git
   cd MyAppointments
   ```
2. Install dependencies
   ```bash
   bundle install
   ```
3. Setup the database
   ```bash
   rails db:create
   rails db:migrate 
   rails db:seed # is necessary to create user and professionals
    ```
4. Start the server
   ```bash
   rails server
   ```
5. Open your browser and navigate to `http://localhost:3000`

## Routes 
- `GET /` - Home page
- `GET /api/v1/appointments` - List all user appointments
- `POST /api/v1/appointments` - Create a new appointment
- `GET /api/v1/appointments/:id` - Form to edit an appointment
