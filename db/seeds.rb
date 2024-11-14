require 'faker'

20.times do
  project = Project.create(
    name: Faker::App.name,
    description: Faker::Lorem.paragraph(sentence_count: rand(3..5)),
    deadline: Faker::Date.between(from: 1.month.from_now, to: 6.months.from_now)
  )

  rand(3..6).times do
    Review.create(
      author: Faker::Name.name,
      comment: Faker::Lorem.sentence(word_count: rand(5..12)),
      rating: rand(1..5),
      project_id: project.id
    )
  end

  rand(4..7).times do
    Task.create(
      title: Faker::Lorem.sentence(word_count: rand(2..4)),
      description: Faker::Lorem.paragraph(sentence_count: rand(2..5)),
      status: rand(0..1),
      progress: rand(0..100),
      project_id: project.id
    )
  end
end

special_projects = [
  { name: "Redesign Website", description: "This project involves redesigning the company's website with a new modern look. It requires collaboration across teams.", deadline: Faker::Date.forward(days: 90) },
  { name: "Mobile App Development", description: "We need to develop a mobile app for e-commerce. The app should be intuitive and fast.", deadline: Faker::Date.forward(days: 60) },
  { name: "Data Migration Project", description: "The goal of this project is to migrate data from old systems to a cloud-based platform.", deadline: Faker::Date.forward(days: 120) }
]

special_projects.each do |project_data|
  project = Project.create(project_data)

  Review.create(
    author: "Admin User",
    comment: "This is an important project, and it requires urgent attention.",
    rating: 5,
    project_id: project.id
  )

  Task.create(
    title: "Project Planning",
    description: "Define the project scope and timelines. Allocate resources.",
    status: 0,
    progress: 0,
    project_id: project.id
  )
  Task.create(
    title: "UI/UX Design",
    description: "Design the user interface and user experience flow.",
    status: 1,
    progress: 40,
    project_id: project.id
  )
  Task.create(
    title: "Development & Testing",
    description: "Start coding the app and run tests.",
    status: 1,
    progress: 30,
    project_id: project.id
  )
  Task.create(
    title: "Deployment",
    description: "Deploy the mobile app to production.",
    status: 8,
    progress: 100,
    project_id: project.id
  )
end

puts "Seed data created successfully!"
