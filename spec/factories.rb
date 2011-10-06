Factory.define :user, :aliases => [:owner] do |user|
  user.name                   "Sample User"
  user.email                  "sample@example.com"
  user.password               "samplepass"
  user.password_confirmation  "samplepass"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :club do |club|
  club.association :owner
  club.name "Sample Club"
  club.bio "Biographical information for Sample Club"
  club.contact_info "Contact information for Sample Club"
end

Factory.sequence :club_name do |n|
  "Sample Club #{n}"
end
