# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs

alias CruiseAmenityReservations.Amenity

amenities = [
  %{name: "Rock Climbing",
    description: "Climb the wall and have so much fun!",
    amenity_image: "https://www.royalcaribbean.com/content/dam/royal/data/activity/rock-climbing-wall/anthem-rockwall-man-climbing-day-activity.jpg/jcr:content/renditions/163x180.jpg",
    ship_location_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRyvhkiMBPY3QwyIsMzMQbig1m8xBbUJmMT3vAWYkShyfnpuIk"
  },
  %{name: "Rock Climbing",
    description: "Climb the wall and have so much fun!",
    amenity_image: "https://www.royalcaribbean.com/content/dam/royal/data/activity/rock-climbing-wall/anthem-rockwall-man-climbing-day-activity.jpg/jcr:content/renditions/163x180.jpg",
    ship_location_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRyvhkiMBPY3QwyIsMzMQbig1m8xBbUJmMT3vAWYkShyfnpuIk"
  },
  %{name: "Rock Climbing",
    description: "Climb the wall and have so much fun!",
    amenity_image: "https://www.royalcaribbean.com/content/dam/royal/data/activity/rock-climbing-wall/anthem-rockwall-man-climbing-day-activity.jpg/jcr:content/renditions/163x180.jpg",
    ship_location_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRyvhkiMBPY3QwyIsMzMQbig1m8xBbUJmMT3vAWYkShyfnpuIk"
  },
  %{name: "Rock Climbing",
    description: "Climb the wall and have so much fun!",
    amenity_image: "https://www.royalcaribbean.com/content/dam/royal/data/activity/rock-climbing-wall/anthem-rockwall-man-climbing-day-activity.jpg/jcr:content/renditions/163x180.jpg",
    ship_location_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRyvhkiMBPY3QwyIsMzMQbig1m8xBbUJmMT3vAWYkShyfnpuIk"
  },
  %{name: "Rock Climbing",
    description: "Climb the wall and have so much fun!",
    amenity_image: "https://www.royalcaribbean.com/content/dam/royal/data/activity/rock-climbing-wall/anthem-rockwall-man-climbing-day-activity.jpg/jcr:content/renditions/163x180.jpg",
    ship_location_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRyvhkiMBPY3QwyIsMzMQbig1m8xBbUJmMT3vAWYkShyfnpuIk"
  }
]

Enum.each amenities, fn amenity_params ->
  changeset = Amenity.changeset(%Amenity{}, amenity_params)
  CruiseAmenityReservations.Repo.insert!(changeset)
end
