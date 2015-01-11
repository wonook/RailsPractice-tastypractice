# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
categories = ["Korean", "Japanese", "Chinese", "Western"]

categories.each do |c|
    0.upto(1) do |i|
        p = Post.new
        p.user_id = i+1
        p.category = c
        p.title = "#{c} Food #{i} (TITLE)"
        p.content = "#{c} Food is #{i} good (CONTENT)"
        p.save
    end
end

users = ["Mike", "Charles", "Adam", "Matthew", "Peter", "Julia", "Salome", "Angelique", "Kaitlyn"]

users.each do |u|
    usr = User.new
    usr.username = u
    usr.password = u + u
    usr.save
end
