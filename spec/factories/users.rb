FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    last_name              {'西'}
    first_name            {'鮎'}
    last_name_kana        {'ニシ'}
    first_name_kana       {'アユ'}
    birthday              {'1943-09-15'}

  end
end
