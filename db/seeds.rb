# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


books = Book.create([
    {
        title: "mybook1", 
        author: "author1",
        subject_id: 1,
        price: 1.11
    }, 
    {
        title: "mybook2", 
        author: "author2",
        subject_id: 2,
        price: 2.22

    }, 
    {
        title: "mybook3", 
        author: "author3",
        subject_id: 3,
        price: 3.33

    }, 
    {
        title: "mybook4", 
        author: "author4",
        subject_id: 4,
        price: 4.44

    }, 

])