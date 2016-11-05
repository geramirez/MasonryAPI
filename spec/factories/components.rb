FactoryGirl.define do

  factory :component do
    name 'Audit Policy'
    key 'Audit-Policy'
    documentation_complete true
    schema_version '3.0.0'
    # Check if record has been created before init
    initialize_with { Component.find_or_create_by(name: name) }
  end

  factory :reference do
    name 'AU Policy'
    path 'https://github.com/opencontrol/freedonia-policies/wiki/Audit-Policy'
    kind 'URL'
    association :component, factory: :component
  end

end
