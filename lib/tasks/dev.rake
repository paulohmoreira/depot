namespace :dev do
  desc "Set up dev environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Droping db...") { %x(rails db:drop) }
      show_spinner("Creating db...") { %x(rails db:create) }
      show_spinner("Migrating...") { %x(rails db:migrate) }
      %x(rails dev:add_products)
      %x(rails dev:add_users)
    else
      puts "You are not in a development environment!"
    end
  end

  desc "Add Products"
  task add_products: :environment do
    show_spinner("Add products...") do
      products = [
        {
          title: "Rails, Angular, Postgres, and Bootstrap",
          description: 
          %{<p>
            <em>Powerful, Effective, and Efficient Full-Stack Web Development</em>
            As a Rails developer, you care about user experience and performance,
            but you also want simple and maintainable code. Achieve all that by
            embracing the full stack of web development, from styling with
            Bootstrap, building an interactive user interface with AngularJS, to
            storing data quickly and reliably in PostgreSQL. Take a holistic view of
            full-stack development to create usable, high-performing applications,
            and learn to use these technologies effectively in a Ruby on Rails
            environment.
          </p>},
          image_url: "dcbang.jpg",
          price: 45.00
        },
        {
          title: "Seven Mobile Apps in Seven Weeks",
          description: 
            %{<p>
              <em>Native Apps, Multiple Platforms</em>
              Answer the question “Can we build this for ALL the devices?” with a
              resounding YES. This book will help you get there with a real-world
              introduction to seven platforms, whether you’re new to mobile or an
              experienced developer needing to expand your options. Plus, you’ll find
              out which cross-platform solution makes the most sense for your needs.
            </p>},
          image_url: "7apps.jpg",
          price: 26.00
        },
        {
          title: "Ruby Performance Optimization",
          description: 
            %{<p>
              <em>Why Ruby Is Slow, and How to Fix It</em> 
              You don’t have to accept slow Ruby or Rails performance. In this
              comprehensive guide to Ruby optimization, you’ll learn how to write
              faster Ruby code—but that’s just the beginning. See exactly what makes
              Ruby and Rails code slow, and how to fix it. Alex Dymo will guide you
              through perils of memory and CPU optimization, profiling, measuring,
              performance testing, garbage collection, and tuning. You’ll find that
              all those “hard” things aren’t so difficult after all, and your code
              will run orders of magnitude faster.
            </p>},
          image_url: "adrpo.jpg",
          price: 46.00
        },
      ]

      products.each do |product|
        Product.find_or_create_by!(product)
      end
    end
  end

  desc "Add Users"
  task add_users: :environment do
    show_spinner("Add Users...") do
      users = [
        {
          name: "admin",
          password: "123456",
          password_confirmation: "123456",
        },
      ]

      users.each do |user|
        User.create!(user)
      end
    end
  end

  private
    def show_spinner(msg_start, msg_end = "Completed!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
end
