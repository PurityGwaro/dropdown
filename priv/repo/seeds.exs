# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Dropdown.Repo.insert!(%Dropdown.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# priv/repo/seeds.exs

# Import necessary modules
import Ecto.Query, warn: false

# Seed data for options
options = [
  %{"name" => "English", "code" => "95f6af3a"},
  %{"name" => "Hindi", "code" => "03426fa4"},
  %{"name" => "Telugu", "code" => "9cbee939"},
  %{"name" => "Tamil", "code" => "45960972"},
  %{"name" => "Armenian", "code" => "534af148"},
  %{"name" => "Assamese", "code" => "12d946e4"},
  %{"name" => "Aymara", "code" => "b564a329"},
  %{"name" => "Azerbaijani", "code" => "19096688"},
  %{"name" => "Balochi", "code" => "e41d14b9"},
  %{"name" => "Bambara", "code" => "9f45d63b"},
  %{"name" => "Basque", "code" => "c5a6da01"},
  %{"name" => "Belarusian", "code" => "bd86691a"},
  %{"name" => "Bengali", "code" => "47be096f"},
  %{"name" => "Bhojpuri", "code" => "2c616a73"},
  %{"name" => "Bosnian", "code" => "ae2f083b"},
  %{"name" => "Bulgarian", "code" => "af363069"},
  %{"name" => "Burmese", "code" => "44f68846"},
  %{"name" => "Catalan", "code" => "41f47b44"},
  %{"name" => "Cebuano", "code" => "88e1960d"},
  %{"name" => "Chichewa (Nyanja)", "code" => "bfb35b70"},
  %{"name" => "Chinese (Cantonese)", "code" => "9f740d76"},
  %{"name" => "Chinese (Mandarin)", "code" => "f5e23bbf"},
  %{"name" => "Croatian", "code" => "68284f4f"},
  %{"name" => "Czech", "code" => "8583efb8"},
  %{"name" => "Danish", "code" => "42fe35fd"},
  %{"name" => "Dari", "code" => "3582d9e0"},
  %{"name" => "Dogri", "code" => "c8006c7b"},
  %{"name" => "Dutch", "code" => "185f0a8b"},
  %{"name" => "Dzongkha", "code" => "b8221dc2"},
  %{"name" => "Estonian", "code" => "9a9b8df2"},
  %{"name" => "Fijian", "code" => "5e03f5df"},
  %{"name" => "Filipino (Tagalog)", "code" => "4bc7c8a1"},
  %{"name" => "Finnish", "code" => "37550b44"},
  %{"name" => "French", "code" => "cb69918c"},
  %{"name" => "Fula", "code" => "205b8449"},
  %{"name" => "Gaelic (Scottish)", "code" => "2c11e82f"},
  %{"name" => "Galician", "code" => "9bdf4b9c"},
  %{"name" => "Georgian", "code" => "fcd8540c"},
  %{"name" => "German", "code" => "707bd52c"},
  %{"name" => "Greek", "code" => "f760a2c2"},
  %{"name" => "Guarani", "code" => "4869d068"},
  %{"name" => "Gujarati", "code" => "b4890ac8"},
  %{"name" => "Haitian Creole", "code" => "2ad69383"},
  %{"name" => "Hausa", "code" => "6cb2b438"},
  %{"name" => "Hebrew", "code" => "bd965932"},
  %{"name" => "Hungarian", "code" => "270174fa"},
  %{"name" => "Icelandic", "code" => "c0376199"},
  %{"name" => "Igbo", "code" => "b6e05ca1"}
]

# Iterate over options and insert into database
Enum.each(options, fn option ->
  Dropdown.MultiSelectOption.create_option(option)
end)

IO.puts "Seed data inserted successfully."
