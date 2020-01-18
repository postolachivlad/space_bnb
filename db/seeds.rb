# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ships = Spaceship.create(
  [
    {
      name: 'Astro Robin',
      description: "The Astro Robin was manufactured by Team Lightning Bolt. ... Along with the vehicles' extremely advanced control components, this machine was designed as a high-tech lightweight vehicle to match its pilot's lightning method of racing.",
      region: "Rudi-Dutschke-Straße 23",
      user_id: 1,
      min_duration: 5,
      photo: "../../app/assets/images/1_Astro_robin.jpg"
    },
    {
      name: 'Green Panther',
      description: "The machine houses two made-to-specs RS engines with advanced power capabilities that were designed especially for racing. The machine is valuable, but has major drawback in the amount of technical control from the pilot in order to compensate for its poor grip.",
      region: "Alexanderplatz",
      user_id: 1,
      min_duration: 5,
      photo: "../../app/assets/images/2_Green_panther.jpg"
    },
    {
      name: 'Little Wyvern',
      description: "The Little Wyvern is a modified version of the fighter crafts used by the Galaxy Dog squad. The machine has decent boost and grip rating in exchange for being one of the weakest machines in terms of body strength.",
      region: "Auguststraße 29C, 10119 Berlin",
      user_id: 1,
      min_duration: 5,
      photo: "../../app/assets/images/3_Little_wyvern.jpg"
    },
    {
      name: 'Mighty Typhoon',
      description: "The Mighty Typhoon originally belonged to a space racing team that dissolved after a big accident four years ago. The machine is lightweight and has excellent acceleration and boost abilities.",
      region: "Falckensteinstraße 49",
      user_id: 1,
      min_duration: 5,
      photo: "../../app/assets/images/4_Mighty_Typhoon.jpg"
    },
    {
      name: 'Fire Stingray',
      description: "Fire Stingray, an extremely small craft with only one fin sporting a pinkish color with fire painted on the back of the ship. Careful and perfectly timed use of the super jet (boost) is the key to operating this machine. ",
      region: "Holzmarktstraße 25, 10243 Berlin",
      user_id: 1,
      min_duration: 5,
      photo: "../../app/assets/images/5_Fire_stingray.jpg"
    },

    {
      name: 'Fire Stingray',
      description: "Fire Stingray, an extremely small craft with only one fin sporting a pinkish color with fire painted on the back of the ship. Careful and perfectly timed use of the super jet (boost) is the key to operating this machine. ",
      region: "Holzmarktstraße 25, 10243 Berlin",
      user_id: 1,
      min_duration: 5,
      photo: "../../app/assets/images/5_Fire_stingray.jpg"
    },
  ]
  )
