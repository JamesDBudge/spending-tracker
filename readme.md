Usage instructions:

To run this app you need to install:

Install PG gem to allow Ruby to communicate with the DB
Install pry-byebug so we can test the controllers and models
PostgreSQL to create and run the database
Sinatra to run our web app

After installing the prerequisites:

Download and extract the files to a folder.
Navigate to the spending_tracker folder.
createdb 'spending_tracker'
psql -d spending_tracker -f db/spending_tracker.sql
ruby db/seeds.rb
ruby spending_tracker.rb
Open Chrome and navigate to Localhost:4567


Brief:

Spending Tracker
Build an app that allows a user to track their spending.

MVP
The app should allow the user to create, edit and delete merchants, e.g. Tesco, Amazon, ScotRail
The app should allow the user to create, edit and delete tags for their spending, e.g. groceries, entertainment, transport
The user should be able to assign tags and merchants to a transaction, as well as an amount spent on each transaction.
The app should display all the transactions a user has made in a single view, with each transaction's amount, merchant and tag, and a total for all transactions.
Inspired by:
Monzo, MoneyDashboard, lots of mobile/online banking apps

Possible Extensions
Transactions should have a timestamp, and the user should be able to view transactions sorted by the time they took place.
The user should be able to supply a budget, and the app should alert the user somehow when when they are nearing this budget or have gone over it.
The user should be able to filter their view of transactions, for example, to view all transactions in a given month, or view all spending on groceries.


Technologies Used:

HTML
CSS
PostgreSQL
Ruby
Sinatra
Git
Postico
Chrome Dev Tools
Atom

My goal with this project was to consolidate the learning from the first 4 weeks. While planning the project it quickly became obvious that every table within the database would need its own controller and its own set of views for all the functionality I wanted to put in.


Personal Extension Ideas:

A pie chart demonstrating percentage spending on each tag or in each merchant would be a good way for a user to visualise their spending, no easy ways to implement this exist in CSS/HTML only though.

A way to select only transactions from the past day, week, month.

Connecting with an actual bank account.

Moving more functionality directly to the main list of transactions eg a '+' button to add a new merchant or tag.

An option in the dropdowns while editing a transaction could also take you to the new tag/merchant page.
