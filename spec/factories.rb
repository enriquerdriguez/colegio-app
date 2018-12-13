FactoryBot.define do
  factory :user do
    
  end

  factory :course do
    name {"Tercero"}
    level {"BACH"}
  end

  factory :student do
    first_name {"Noseque"}
    last_name {"Nosecuanto"}
    email {"noseque@nosecuanto.com"}
    password{"password"}
    birthdate {"1996-03-05 00:00:00"}
    course_id {:course}
    telephone {"123456789"}
  end

end