# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Renovator.destroy_all
Project.destroy_all
Contractor.destroy_all
Match.destroy_all

r1 = Renovator.create!(firstName: "Ryan", lastName: "Renovato", email: "rrenovato@gmail.com")

p1 = Project.create!(zipCode: "19019", intSvcs: true, archSvcs: false, gcSvcs: false, budget: 25000, renovator_id: r1.id)
p2 = Project.create!(zipCode: "19019", intSvcs: true, archSvcs: false, gcSvcs: true, budget: 75000, renovator_id: r1.id)
p3 = Project.create!(zipCode: "11954", intSvcs: true, archSvcs: false, gcSvcs: false, budget: 25000, renovator_id: r1.id)
p4 = Project.create!(zipCode: "11954", intSvcs: true, archSvcs: true, gcSvcs: false, budget: 75000, renovator_id: r1.id)
p5 = Project.create!(zipCode: "10003", intSvcs: true, archSvcs: false, gcSvcs: false, budget: 25000, renovator_id: r1.id)
p6 = Project.create!(zipCode: "10003", intSvcs: true, archSvcs: true, gcSvcs: true, budget: 75000, renovator_id: r1.id)
p7 = Project.create!(zipCode: "07028", intSvcs: true, archSvcs: false, gcSvcs: false, budget: 25000, renovator_id: r1.id)

c1 = Contractor.create!(companyName: "No Constraints Newark", email: "ncn@gmail.com", zipCode: "07105", intSvcs: true, archSvcs: true, gcSvcs: true)
c2 = Contractor.create!(companyName: "Philly Interiors", email: "phillyinteriors@gmail.com", zipCode: "19019", intSvcs: true, archSvcs: false, gcSvcs: false)
c3 = Contractor.create!(companyName: "Montauk Interiors", email: "montaukinteriors@gmail.com", zipCode: "11954", intSvcs: true, archSvcs: false, gcSvcs: false)
c4 = Contractor.create!(companyName: "NYC & NNJ Interiors", email: "nyc&nnjinteriors@gmail.com", zipCode: "10003", intSvcs: true, archSvcs: false, gcSvcs: false)
c5 = Contractor.create!(companyName: "Greenwich CT Universal Contracting", email: "universalcontractingct@gmail.com", zipCode: "06830", intSvcs: true, archSvcs: true, gcSvcs: true)
