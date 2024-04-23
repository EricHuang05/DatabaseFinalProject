# MySQL + Flask Boilerplate Project

This repo contains a boilerplate setup for spinning up 3 Docker containers: 
1. A MySQL 8 container for obvious reasons
1. A Python Flask container to implement a REST API
1. A Local AppSmith Server

## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 

# LibreLibro 

LibreLibro is an online bookstore that aims to make the book-buying process as easy as possible. Search a vast library of books to find the perfect read, and we’ll ship it to you. No need to worry about losing track of your shipment—you can view where in the process your order is. Purchased books will automatically be saved to your profile, and you can leave ratings when you’re done reading. Don’t know what book you want? LibreLibro can recommend you a book based on your previous reviews. Students can use LibreLibro to find and purchase textbooks necessary for their courses. LibreLibro employees will update the inventory so consumers know if their desired book is out of stock or ready to buy. 

## Video Demo


## Features
Extensive Library: Search through a wide range of books to find the perfect read for you.
Personalized Recommendations: Let LibreLibro recommend your next read based on your previous reviews.
Inventory Updates: Our team constantly updates the inventory, so you'll always know if a book is in stock or ready to buy.



## Collaborators

[Eric Huang](https://github.com/EricHuang05)

[Jonathan Ding](https://github.com/nwhee)

[Joshua Jung](https://github.com/joshuajungg)



