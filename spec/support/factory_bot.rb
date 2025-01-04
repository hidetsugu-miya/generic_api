# frozen_string_literal: true

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.include FactoryBot::Syntax::Methods
  config.infer_spec_type_from_file_location!

  config.before(:all) do
    FactoryBot.reload
  end
end
