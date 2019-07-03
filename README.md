# mywork challenge

This project was made using Ruby on Rails v5.2.3 and Ruby 2.6.1.
It's a simple Timetracker (registro de ponto) for Employees to register their times to work, and
for Company Managers to create Geofences that restric the locations where
employees can register the timetrack, and to see their information.

## How to run it
  
Clone this repository with:  
`git clone git@github.com:mathvp/mywork-challenge.git`  
  
Enter the project folder:  
`cd mywork-challenge`  
  
Install all dependecies with:  
`bundle install`  
  
Run the Migrations with:  
`rails db:migrate`
  
Start the server with:  
`rails s`  
  
Access **http://localhost:3000** on your browser.
  
  
## Runing the tests  
  
   To check all the tests, enter in the project folder and run:  
 `rspec`

  
## Technical choices

  - **Materialize**  
 I used [Materialize](https://github.com/Dogfalo/materialize) framework for the UI because it has a nice
looking from Material Design, saves lots of time with the utilities classes and it's mobile friendly. Also, it's easy to use (second time that I'm using it).
  
  - **Vue.js**  
To help me with js frontend part I choose the [Vue.js](https://github.com/vuejs/vue), that turn more easy to interact between the Maps and Forms with two way data binding. I load it from CDN to keep simple, because config with Rails/Webpack/Vue will take too much time.
  
  - **Leaflet**  
  For the maps I used [Leaflet](https://github.com/Leaflet/Leaflet) instead of Google Maps, simply because Google Maps wasn't work with free API. It was required to insert billing information. So I found the Leaflet and I really like the easy way to create the maps and add markers to it. And works good with Vuejs.
  
  - **Rspec and Capybara**  
  The tests was made with Rspec and Capybara GEMs.  

  - **Rubocop**  
  To format the code with the ruby style, it was used the Rubocop  
   
   
 ## Screenshots
   
 ![Geofence Screen](https://raw.githubusercontent.com/mathvp/mywork-challenge/master/print1.png)  
   
 ----------------------------------------  
   
 ![Geofence Screen](https://raw.githubusercontent.com/mathvp/mywork-challenge/master/print2.png)  
   
   
  ------------------------------------  
    
