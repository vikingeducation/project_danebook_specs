require 'rails_helper'

# Here, we're explicitly calling the `describe` block
# on RSpec and also explicitly letting RSpec know
# that this is a Model spec, so it should include
# some extra model helper methods
# This is the explicit way to specify a model spec
# which we might otherwise implicitly set up using
# `describe User do` and relying on file naming conventions
# to handle classifying it as a model spec
RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"


end