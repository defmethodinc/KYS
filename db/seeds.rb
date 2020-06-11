# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clients = Client.create([
                           {name:"Crr"},
                           {name:"Upstack"},
                           {name:"Citi"},
                           {name:"Paxos"},
                           {name: "NYVB"},
                           {name:"AWE"},
                           {name:"TurnTheTweet"}])
members = Member.create([
                          {name:"Jesusmar"},{name:"Tom"},{name:"Yisselda"},{name:"Matt"},
                          {name:"Terrence"},{name:"Josh"},{name:"Paul"},{name:"Mark"},
                          {name:"Nick"},{name:"Christine"},{name:"Jeff"}
                        ])
profiles = []
members.each do |m|
  profiles << Profile.create(member_id: m.id, seniority: %w(Sr Mid Jr).sample)
end

tools = Tool.create([{name: "Cypress"}, {name: "ActiveAdmin"}, {name: "Pantheon"},
                     {name: "Android"}, {name: "MiniTest"}, {name: "Rspec"},
                     {name: "Kafka"}, {name: "Graphql"}, {name: "MongoDb"},
                     {name: "Docker"}, {name: "Heroku"}, {name: "S3"}, {name: "S3"}, {name: "MPAndroidChart"},
                     {name: "ElasticBeanStalk"}])

experiences = []

(0..500).each do |n|
  experiences << Experience.create(member_id: Member.all.sample.id,
                                  tool_id: Tool.all.sample.id,
                                  client_id: Client.all.sample.id,
                                   experience_in_days: [30,60,90,120,150].sample)
end


members.each do |m|
  used = []
  while used.length < 8 do
    tool = tools.sample
    used << tool unless used.include?(tool)
  end

  used.each do  |tool|
    ConfidenceLevel.create(member:m,
                           tool: tool,
                           confidence_level: [1,2,3,4,5].sample)
  end
end