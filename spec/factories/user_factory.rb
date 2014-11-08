FactoryGirl.define do
  factory :user, aliases: [:author, :liker] do
    fname "Foo"
    lname "Bar"
    sequence :email { |n| "foo#{n}@bar.com" }
    password "verysecure"

    factory :filled_out do
      bday Date.today - 4.years
      gender "Male"
    end

  end


end